
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
      base: 'tf-free | Documentation'                    // --> the base title of your doc pages
    },

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
