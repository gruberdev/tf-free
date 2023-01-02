import React from 'react'
import { DocsThemeConfig } from 'nextra-theme-docs'

const config: DocsThemeConfig = {
  logo: (
    <>
      <svg xmlns="http://www.w3.org/2000/svg" width="64px" height="64px" viewBox="0 0 64 64" fill="none"><path d="M38.06 26.151v11.473L48 31.891V20.406l-9.94 5.745z" fill="#4040B2"/><path d="m27.03 20.406 9.94 5.745v11.473l-9.94-5.74V20.407zM16 14v11.479l9.94 5.74v-11.48L16 14zm11.03 30.624 9.94 5.74v-11.48l-9.94-5.739v11.48z" fill="#5C4EE5"/></svg>
      <span style={{ marginLeft: '.4em', fontWeight: 800 }}>
        Terraform Free
      </span>
    </>
  ),
  project: {
    link: 'https://github.com/gruberdev/tf-free',
  },
  footer: {
    text: <span>
      <a href="https://discord.gg/7dXyRzSkhr" target="_blank">Feel free to join our Discord if you have any questions</a>.
    </span>,
  },
  chat: {
    link: 'https://discord.gg/7dXyRzSkhr',
  },
  docsRepositoryBase: 'https://github.com/gruberdev/tf-free/tree/main/docs',
  useNextSeoProps() {
    return {
      titleTemplate: '%s – tf-free docs'
    }
  },
}

export default config
