import { 
  createTheme, 
  DefaultCodeThemeDark,
} from '@codedoc/core/transport';


export const theme = /*#__PURE__*/createTheme({
  light: {
    primary: '#5BBCFA'
  },
  dark: {
    primary: '#5BBCFA',
    background: '#161719',
    text: '#D1D2D7',
    shadow: '#5BBCFA'
  },
  code: {
    wmbar: false,                          // --> disable the top-bar by default
    dark: DefaultCodeThemeDark,       // --> use the default light code theme in light-mode
  },
});
