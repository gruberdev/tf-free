/*
Package conf reads values from a configuration file such as JSON, TOML, YAML and etc using Viper.
It was separated to a different package from `cmd` to ease testing and re-use.
- This package was very much taught by the below articles:
  - "[Backend #12] Load config from file & environment variables in Golang with Viper"
	- https://youtu.be/n5p8HkO6bnE by TECH SCHOOL @ YouTube
  - "cobra-viper-example"
  	- https://github.com/nirasan/cobra-viper-example @ GitHub
*/
package conf

import (
	"path/filepath"
	"strings"

	"github.com/spf13/viper"
)

// TConfigApp is an alias of TConfigFile for backward compatibility and it will be removed in v1.3.0.
// Deprecated: as of v1.2.1. Use TConfigFile instead.
type TConfigApp = TConfigFile

// TConfigFile defines the data structure to store the information of the file to load.
type TConfigFile struct {
	/* one-liner-conf of file path */

	PathFileConf string // File path of config. If set, will have priority than NameFileConf and PathDirConf.

	/* parted conf of file path */

	PathDirConf  string // Dir path of config to search.
	NameFileConf string // File name of config file. May or may not have an extension.
	NameTypeConf string // File extension. REQUIRED if the conf file does not have the extension.

	/* configuration of it's state */
	IsUsingDefaultConf bool // Flag to determine if the app is using the default value or conf file value.
}

// GetNameConf is a method of TConfigFile that returns the config file name.
func (c TConfigFile) GetNameConf() string {
	if c.PathFileConf != "" {
		return filepath.Base(c.PathFileConf)
	}

	if hasExtInName(c.NameFileConf) {
		return c.NameFileConf
	}

	return c.NameFileConf + "." + c.NameTypeConf
}

// LoadConfig is an alias of LoadFile for backward compatibility and it will be removed in v1.3.0.
// Deprecated: as of v1.2.1. Use LoadFile() instead.
var LoadConfig = LoadFile

// LoadFile() stores values from the config file to userConfig.
//
// @args
//     appConfig  TConfigFile : Basic configuration to read the conf file.
//     userConfig struct      : An object to store values from conf file.
// @return
//     err        error       : If fails to read/store values from conf file returns error othersise nil.
// Usage:
//   type TConfUser struct {
//       MyValue string `mapstructure:"my_value"`
//   }
//   var (
//       configApp = conf.TConfigFile{
//           PathDirConf:        ".",
//           NameFileConf:       "userConfig",
//           NameTypeConf:       "json",
//       }
//       configUser = TConfUser{
//           MyValue: "",
//       }
//   )
//   if err := conf.LoadFile(*configApp, &configUser); err != nil {
//       // do something with the error
//   }
//   myValue := configUser.MyValue
func LoadFile(appConfig TConfigFile, userConfig interface{}) (err error) {
	// pitViper is a temporary viper instance
	pitViper := viper.New()

	// Set file path to search
	if appConfig.PathFileConf != "" {
		// Set one-liner file path
		pitViper.SetConfigFile(appConfig.PathFileConf)
	} else {
		// Set inidividual file path info
		pitViper.AddConfigPath(appConfig.PathDirConf)
		pitViper.SetConfigName(appConfig.NameFileConf)
		pitViper.SetConfigType(appConfig.NameTypeConf)
	}

	// Search and read values from the config file and stores to "userConfig"
	err = pitViper.ReadInConfig()
	if err == nil {
		// Map the read config values
		err = pitViper.Unmarshal(&userConfig)
	}

	return err // return error if viper fails to read or map the values
}

// hasExtInName() returns true if the nameFile contains a file extension which viper can detect.
func hasExtInName(nameFile string) bool {
	var extWithNoDot string = strings.TrimLeft(filepath.Ext(nameFile), ".")

	return hasStringInSlice(extWithNoDot, viper.SupportedExts)
}

// hasStringInSlice returns true if a string is in a list of slice.
func hasStringInSlice(a string, list []string) bool {
	for _, b := range list {
		if b == a {
			return true
		}
	}

	return false
}
