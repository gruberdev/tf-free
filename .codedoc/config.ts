
import { configuration } from '@codedoc/core';

import { theme } from './theme';


export const config = /*#__PURE__*/configuration({
  theme,
  src: {
    base: 'docs/md',                     // --> the base folder for all markdowns
    toc: '_toc.md',                      // --> markdown file for toc, relative to `base`
    not_found: '404.md',                // --> markdown file for 404 page, relative to `base`
    pick: /\.md$/,                       // --> which files to pick (default: .md files)
    drop: /(^_)|(\/_)/,                  // --> which files to drop (default: _something.md files)               // --> markdown file for 404 page, relative to `base`
  },                                // --> add the theme. modify `./theme.ts` for changing the theme.
  dest: {
    namespace: '',
    html: 'docs/build',
    assets: 'docs/build',
    bundle: 'docs/build/assets',
    styles: 'docs/build/assets'               // --> your github pages namespace. remove if you are using a custom domain.
  },
  page: {
    title: {
       base: 'tf-free documentation'                    // --> the base title of your doc pages
    },
    fonts: {                             // --> font settings
      text: {                            // --> font used for texts
        url:                             // --> URL of font used for texts
          'https://fonts.googleapis.com/css2?family=Inter:wght@400&display=swap',
        name: 'Inter',                    // --> name of font used for texts
        fallback: 'sans-serif'
      },
      code: {                            // --> font used for codes
        url:                             // --> URL of font used for codes
          'https://fonts.googleapis.com/css2?family=Inter:wght@300;400&family=JetBrains+Mono&display=swap',
        name: 'JetBrains Mono',         // --> name of the font used for codes
        fallback:                        // --> fallback font for codes
          `'Courier New', Courier, monospace`
      },
    }           // --> the fallback font for texts
  },
  dev: {
    port: 3000                           // --> the port for local dev server
  },

  misc: {
    github: {
      user: 'gruberdev',                  // --> your github username (where your repo is hosted)
      repo: 'tf-free',                    // --> your github repo name
    }
  },
});
