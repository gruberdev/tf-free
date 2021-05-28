
import { configuration } from '@codedoc/core';

import { theme } from './theme';


export const config = /*#__PURE__*/configuration({
  theme,                                  // --> add the theme. modify `./theme.ts` for changing the theme.
  dest: {
    namespace: '/tf-free'                 // --> your github pages namespace. remove if you are using a custom domain.
  },
  page: {
    title: {
      base: 'Tf Free'                     // --> the base title of your doc pages
    }
  },
  misc: {
    github: {
      user: 'gruberdev',                  // --> your github username (where your repo is hosted)
      repo: 'tf-free',                    // --> your github repo name
    }
  },
});
