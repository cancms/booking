import{_ as e,c as t,o as a,a as r}from"./app.04560c22.js";var n="https://cancms.github.io/booking/user-manual/og-image-announcing-vite3.png",o="https://cancms.github.io/booking/user-manual/assets/v3-docs.2bb7b882.png",s="https://cancms.github.io/booking/user-manual/assets/vite.63a26457.svg",i="https://cancms.github.io/booking/user-manual/assets/vue.5532db34.svg",l="https://cancms.github.io/booking/user-manual/assets/svelte.a39f39b7.svg",p="https://cancms.github.io/booking/user-manual/assets/react.35ef61ed.svg",h="https://cancms.github.io/booking/user-manual/assets/preact.48177e6f.svg",c="https://cancms.github.io/booking/user-manual/assets/lit.c8dae599.svg",d="https://cancms.github.io/booking/user-manual/assets/vite-3-cold-start.af8884cf.svg",u="https://cancms.github.io/booking/user-manual/assets/v3-open-issues-and-PRs.acbbaeb7.png",m="https://cancms.github.io/booking/user-manual/assets/v3-new-open-issues-and-PRs.89c27587.png";const C=JSON.parse(`{"title":"Vite 3.0 is out!","description":"","frontmatter":{"sidebar":false,"head":[["meta",{"property":"og:type","content":"website"}],["meta",{"property":"og:title","content":"Announcing Vite 3"}],["meta",{"property":"og:image","content":"https://vitejs.dev/og-image-announcing-vite3.png"}],["meta",{"property":"og:url","content":"https://vitejs.dev/blog/announcing-vite3"}],["meta",{"property":"og:description","content":"Vite 3 Release Announcement"}],["meta",{"name":"twitter:card","content":"summary_large_image"}]]},"headers":[{"level":2,"title":"New Documentation","slug":"new-documentation"},{"level":2,"title":"Create Vite Starter Templates","slug":"create-vite-starter-templates"},{"level":2,"title":"Dev Improvements","slug":"dev-improvements"},{"level":3,"title":"Vite CLI","slug":"vite-cli"},{"level":3,"title":"Improved WebSocket Connection Strategy","slug":"improved-websocket-connection-strategy"},{"level":3,"title":"Cold Start Improvements","slug":"cold-start-improvements"},{"level":3,"title":"import.meta.glob","slug":"import-meta-glob"},{"level":3,"title":"Aligning WASM Import with Future Standards","slug":"aligning-wasm-import-with-future-standards"},{"level":2,"title":"Build Improvements","slug":"build-improvements"},{"level":3,"title":"ESM SSR Build by Default","slug":"esm-ssr-build-by-default"},{"level":3,"title":"Improved Relative Base Support","slug":"improved-relative-base-support"},{"level":2,"title":"Experimental Features","slug":"experimental-features"},{"level":3,"title":"Built Asset Paths fine-grained Control (Experimental)","slug":"built-asset-paths-fine-grained-control-experimental"},{"level":3,"title":"Esbuild Deps Optimization at Build Time (Experimental)","slug":"esbuild-deps-optimization-at-build-time-experimental"},{"level":3,"title":"HMR Partial Accept (Experimental)","slug":"hmr-partial-accept-experimental"},{"level":2,"title":"Bundle Size Reduction","slug":"bundle-size-reduction"},{"level":2,"title":"Bug Fixing","slug":"bug-fixing"},{"level":2,"title":"Compatibility Notes","slug":"compatibility-notes"},{"level":2,"title":"Upgrades to Vite Core","slug":"upgrades-to-vite-core"},{"level":2,"title":"The Ecosystem is Ready for v3","slug":"the-ecosystem-is-ready-for-v3"},{"level":2,"title":"Acknowledgments","slug":"acknowledgments"},{"level":2,"title":"What's Next","slug":"what-s-next"}],"relativePath":"blog/announcing-vite3.md"}`),g={name:"blog/announcing-vite3.md"},f=r('<h1 id="vite-3-0-is-out" tabindex="-1">Vite 3.0 is out! <a class="header-anchor" href="#vite-3-0-is-out">\xB6</a></h1><p>In February last year, <a href="https://twitter.com/youyuxi" target="_blank" rel="noopener noreferrer">Evan You</a> released Vite 2. Since then, its adoption has grown non-stop, reaching more than 1 million npm downloads per week. A sprawling ecosystem rapidly formed after the release. Vite is powering a renewed innovation race in Web frameworks. <a href="https://v3.nuxtjs.org/" target="_blank" rel="noopener noreferrer">Nuxt 3</a> uses Vite by default. <a href="https://kit.svelte.dev/" target="_blank" rel="noopener noreferrer">SvelteKit</a>, <a href="https://astro.build/" target="_blank" rel="noopener noreferrer">Astro</a>, <a href="https://hydrogen.shopify.dev/" target="_blank" rel="noopener noreferrer">Hydrogen</a>, and <a href="https://docs.solidjs.com/start" target="_blank" rel="noopener noreferrer">SolidStart</a> are all built with Vite. <a href="https://laravel.com/docs/9.x/vite" target="_blank" rel="noopener noreferrer">Laravel has now decided to use Vite by default</a>. <a href="https://vite-ruby.netlify.app/" target="_blank" rel="noopener noreferrer">Vite Ruby</a> shows how Vite can improve Rails DX. <a href="https://vitest.dev" target="_blank" rel="noopener noreferrer">Vitest</a> is making strides as a Vite-native alternative to Jest. Vite is behind <a href="https://docs.cypress.io/guides/component-testing/writing-your-first-component-test" target="_blank" rel="noopener noreferrer">Cypress</a> and <a href="https://playwright.dev/docs/test-components" target="_blank" rel="noopener noreferrer">Playwright</a>&#39;s new Component Testing features, Storybook has <a href="https://github.com/storybookjs/builder-vite" target="_blank" rel="noopener noreferrer">Vite as an official builder</a>. And <a href="https://patak.dev/vite/ecosystem.html" target="_blank" rel="noopener noreferrer">the list goes on</a>. Maintainers from most of these projects got involved in improving the Vite core itself, working closely with the Vite <a href="https://vitejs.dev/team" target="_blank" rel="noopener noreferrer">team</a> and other contributors.</p><p><img src="'+n+'" alt="Vite 3 Announcement Cover Image"></p><p>Today, 16 months from the v2 launch we are happy to announce the release of Vite 3. We decided to release a new Vite major at least every year to align with <a href="https://nodejs.org/en/about/releases/" target="_blank" rel="noopener noreferrer">Node.js&#39;s EOL</a>, and take the opportunity to review Vite&#39;s API regularly with a short migration path for projects in the ecosystem.</p><p>Quick links:</p><ul><li><a href="https:/cancms.github.io/booking/user-manual/">Docs</a></li><li><a href="https:/cancms.github.io/booking/user-manual/guide/migration.html">Migration Guide</a></li><li><a href="https://github.com/vitejs/vite/blob/main/packages/vite/CHANGELOG.md#300-2022-07-13" target="_blank" rel="noopener noreferrer">Changelog</a></li></ul><p>If you are new to Vite, we recommend reading the <a href="https://vitejs.dev/guide/why.html" target="_blank" rel="noopener noreferrer">Why Vite Guide</a>. Then check out <a href="https://vitejs.dev/guide/" target="_blank" rel="noopener noreferrer">the Getting Started</a> and <a href="https://vitejs.dev/guide/features" target="_blank" rel="noopener noreferrer">Features guide</a> to see what Vite provides out of the box. As usual, contributions are welcome at <a href="https://github.com/vitejs/vite" target="_blank" rel="noopener noreferrer">GitHub</a>. More than <a href="https://github.com/vitejs/vite/graphs/contributors" target="_blank" rel="noopener noreferrer">600 collaborators</a> have helped improve Vite so far. Follow the updates on <a href="https://twitter.com/vite_js" target="_blank" rel="noopener noreferrer">Twitter</a>, or join discussions with other Vite users on our <a href="http://chat.vitejs.dev/" target="_blank" rel="noopener noreferrer">Discord chat server</a>.</p><h2 id="new-documentation" tabindex="-1">New Documentation <a class="header-anchor" href="#new-documentation">\xB6</a></h2><p>Go to <a href="https://vitejs.dev" target="_blank" rel="noopener noreferrer">vitejs.dev</a> to enjoy the new v3 docs. Vite is now using the new <a href="https://vitepress.vuejs.org" target="_blank" rel="noopener noreferrer">VitePress</a> default theme, with a stunning dark mode between other features.</p><p><a href="https://vitejs.dev" target="_blank" rel="noopener noreferrer"><img src="'+o+'" alt="Vite documentation frontpage"></a></p><p>Several projects in the ecosystem have already migrated to it (see <a href="https://vitest.dev" target="_blank" rel="noopener noreferrer">Vitest</a>, <a href="https://vite-plugin-pwa.netlify.app/" target="_blank" rel="noopener noreferrer">vite-plugin-pwa</a>, and <a href="https://vitepress.vuejs.org/" target="_blank" rel="noopener noreferrer">VitePress</a> itself).</p><p>If you need to access the Vite 2 docs, they will remain online at <a href="https://v2.vitejs.dev" target="_blank" rel="noopener noreferrer">v2.vitejs.dev</a>. There is also a new <a href="https://main.vitejs.dev" target="_blank" rel="noopener noreferrer">main.vitejs.dev</a> subdomain, where each commit to Vite\u2019s main branch is auto deployed. This is useful when testing beta versions or contributing to the core\u2019s development.</p><p>There is also now an official Spanish translation, that has been added to the previous Chinese and Japanese translations:</p><ul><li><a href="https://cn.vitejs.dev/" target="_blank" rel="noopener noreferrer">\u7B80\u4F53\u4E2D\u6587</a></li><li><a href="https://ja.vitejs.dev/" target="_blank" rel="noopener noreferrer">\u65E5\u672C\u8A9E</a></li><li><a href="https://es.vitejs.dev/" target="_blank" rel="noopener noreferrer">Espa\xF1ol</a></li></ul><h2 id="create-vite-starter-templates" tabindex="-1">Create Vite Starter Templates <a class="header-anchor" href="#create-vite-starter-templates">\xB6</a></h2><p><a href="https:/cancms.github.io/booking/user-manual/guide/#trying-vite-online">create-vite</a> templates have been a great tool to quickly test Vite with your favorite framework. In Vite 3, all of the templates got a new theme in line with the new docs. Open them online and start playing with Vite 3 now:</p><div class="stackblitz-links"><a target="_blank" href="https://vite.new"><img width="75" height="75" src="'+s+'" alt="Vite logo"></a><a target="_blank" href="https://vite.new/vue"><img width="75" height="75" src="'+i+'" alt="Vue logo"></a><a target="_blank" href="https://vite.new/svelte"><img width="60" height="60" src="'+l+'" alt="Svelte logo"></a><a target="_blank" href="https://vite.new/react"><img width="75" height="75" src="'+p+'" alt="React logo"></a><a target="_blank" href="https://vite.new/preact"><img width="65" height="65" src="'+h+'" alt="Preact logo"></a><a target="_blank" href="https://vite.new/lit"><img width="60" height="60" src="'+c+`" alt="Lit logo"></a></div><p>The theme is now shared by all templates. This should help better convey the scope for these starters as minimal templates to get started with Vite. For more complete solutions including linting, testing setup, and other features, there are official Vite-powered templates for some frameworks like <a href="https://github.com/vuejs/create-vue" target="_blank" rel="noopener noreferrer">create-vue</a> and <a href="https://github.com/sveltejs/kit" target="_blank" rel="noopener noreferrer">create-svelte</a>. There is a community-maintained list of templates at <a href="https://github.com/vitejs/awesome-vite#templates" target="_blank" rel="noopener noreferrer">Awesome Vite</a>.</p><h2 id="dev-improvements" tabindex="-1">Dev Improvements <a class="header-anchor" href="#dev-improvements">\xB6</a></h2><h3 id="vite-cli" tabindex="-1">Vite CLI <a class="header-anchor" href="#vite-cli">\xB6</a></h3><pre style="background-color:var(--vp-code-block-bg);padding:2em;border-radius:8px;max-width:100%;overflow-x:auto;">  <span style="color:lightgreen;"><b>VITE</b></span> <span style="color:lightgreen;">v3.0.0</span>  <span style="color:gray;">ready in <b>320</b> ms</span>

  <span style="color:lightgreen;"><b>\u279C</b></span>  <span style="color:white;"><b>Local</b>:</span>   <span style="color:cyan;">http://127.0.0.1:5173/</span>
  <span style="color:green;"><b>\u279C</b></span>  <span style="color:gray;"><b>Network</b>: use --host to expose</span>
</pre><p>Apart from the CLI\u2019s aesthetics improvements, you\u2019ll notice that the default dev server port is now 5173 and the preview server listening at 4173. This change ensures Vite will avoid collisions with other tools.</p><h3 id="improved-websocket-connection-strategy" tabindex="-1">Improved WebSocket Connection Strategy <a class="header-anchor" href="#improved-websocket-connection-strategy">\xB6</a></h3><p>One of the pain points of Vite 2 was configuring the server when running behind a proxy. Vite 3 changes the default connection scheme so it works out of the box in most scenarios. All these setups are now tested as part of the Vite Ecosystem CI through <a href="https://github.com/sapphi-red/vite-setup-catalogue" target="_blank" rel="noopener noreferrer"><code>vite-setup-catalogue</code></a>.</p><h3 id="cold-start-improvements" tabindex="-1">Cold Start Improvements <a class="header-anchor" href="#cold-start-improvements">\xB6</a></h3><p>Vite now avoids full reload during cold start when imports are injected by plugins while crawling the initial statically imported modules (<a href="https://github.com/vitejs/vite/issues/8869" target="_blank" rel="noopener noreferrer">#8869</a>).</p><details><summary><b>Click to learn more</b></summary><p>In Vite 2.9, both the scanner and optimizer were run in the background. In the best scenario, where the scanner would find every dependency, no reload was needed in cold start. But if the scanner missed a dependency, a new optimization phase and then a reload were needed. Vite was able to avoid some of these reloads in v2.9, as we detected if the new optimized chunks were compatible with the ones the browser had. But if there was a common dep, the sub-chunks could change and a reload was required to avoid duplicated state. In Vite 3, the optimized deps aren&#39;t handed to the browser until the crawling of static imports is done. A quick optimization phase is issued if there is a missing dep (for example, injected by a plugin), and only then, the bundled deps are sent. So, a page reload is no longer needed for these cases.</p></details><img style="background-color:var(--vp-code-block-bg);padding:4%;border-radius:8px;" width="100%" height="auto" src="`+d+`" alt="Two graphs comparing Vite 2.9 and Vite 3 optimization strategy"><h3 id="import-meta-glob" tabindex="-1">import.<wbr>meta.glob <a class="header-anchor" href="#import-meta-glob">\xB6</a></h3><p><code>import.<wbr>meta.glob</code> support was rewritten. Read about the new features in the <a href="https:/cancms.github.io/booking/user-manual/guide/features.html#glob-import">Glob Import Guide</a>:</p><p><a href="https:/cancms.github.io/booking/user-manual/guide/features.html#multiple-patterns">Multiple Patterns</a> can be passed as an array</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">meta</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">glob</span><span style="color:#A6ACCD;">([</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./dir/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#89DDFF;">,</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./another/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#A6ACCD;">])</span></span>
<span class="line"></span></code></pre></div><p><a href="https:/cancms.github.io/booking/user-manual/guide/features.html#negative-patterns">Negative Patterns</a> are now supported (prefixed with <code>!</code>) to ignore some specific files</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">meta</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">glob</span><span style="color:#A6ACCD;">([</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./dir/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#89DDFF;">,</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">!**/bar.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#A6ACCD;">])</span></span>
<span class="line"></span></code></pre></div><p><a href="https:/cancms.github.io/booking/user-manual/guide/features.html#named-imports">Named Imports</a> can be specified to improve tree-shaking</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">meta</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">glob</span><span style="color:#A6ACCD;">(</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./dir/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#89DDFF;">,</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span><span style="color:#A6ACCD;"> </span><span style="color:#F07178;">import</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">setup</span><span style="color:#89DDFF;">&#39;</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;">)</span></span>
<span class="line"></span></code></pre></div><p><a href="https:/cancms.github.io/booking/user-manual/guide/features.html#custom-queries">Custom Queries</a> can be passed to attach metadata</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">meta</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">glob</span><span style="color:#A6ACCD;">(</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./dir/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#89DDFF;">,</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span><span style="color:#A6ACCD;"> </span><span style="color:#F07178;">query</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span><span style="color:#A6ACCD;"> </span><span style="color:#F07178;">custom</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">data</span><span style="color:#89DDFF;">&#39;</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;">)</span></span>
<span class="line"></span></code></pre></div><p><a href="https:/cancms.github.io/booking/user-manual/guide/features.html#glob-import">Eager Imports</a> is now passed as a flag</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">meta</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">glob</span><span style="color:#A6ACCD;">(</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./dir/*.js</span><span style="color:#89DDFF;">&#39;</span><span style="color:#89DDFF;">,</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span><span style="color:#A6ACCD;"> </span><span style="color:#F07178;">eager</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> </span><span style="color:#FF9CAC;">true</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;">)</span></span>
<span class="line"></span></code></pre></div><h3 id="aligning-wasm-import-with-future-standards" tabindex="-1">Aligning WASM Import with Future Standards <a class="header-anchor" href="#aligning-wasm-import-with-future-standards">\xB6</a></h3><p>The WebAssembly import API has been revised to avoid collisions with future standards and to make it more flexible:</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">import</span><span style="color:#A6ACCD;"> init </span><span style="color:#89DDFF;font-style:italic;">from</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">./example.wasm?init</span><span style="color:#89DDFF;">&#39;</span></span>
<span class="line"></span>
<span class="line"><span style="color:#82AAFF;">init</span><span style="color:#A6ACCD;">()</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">then</span><span style="color:#A6ACCD;">(</span><span style="color:#89DDFF;">(</span><span style="color:#A6ACCD;">instance</span><span style="color:#89DDFF;">)</span><span style="color:#A6ACCD;"> </span><span style="color:#C792EA;">=&gt;</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span></span>
<span class="line"><span style="color:#F07178;">  </span><span style="color:#A6ACCD;">instance</span><span style="color:#89DDFF;">.</span><span style="color:#A6ACCD;">exports</span><span style="color:#89DDFF;">.</span><span style="color:#82AAFF;">test</span><span style="color:#F07178;">()</span></span>
<span class="line"><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;">)</span></span>
<span class="line"></span></code></pre></div><p>Learn more in the <a href="https:/cancms.github.io/booking/user-manual/guide/features.html#webassembly">WebAssembly guide</a></p><h2 id="build-improvements" tabindex="-1">Build Improvements <a class="header-anchor" href="#build-improvements">\xB6</a></h2><h3 id="esm-ssr-build-by-default" tabindex="-1">ESM SSR Build by Default <a class="header-anchor" href="#esm-ssr-build-by-default">\xB6</a></h3><p>Most SSR frameworks in the ecosystem were already using ESM builds. So, Vite 3 makes ESM the default format for SSR builds. This allows us to streamline previous <a href="https://vitejs.dev/guide/ssr.html#ssr-externals" target="_blank" rel="noopener noreferrer">SSR externalization heuristics</a>, externalizing dependencies by default.</p><h3 id="improved-relative-base-support" tabindex="-1">Improved Relative Base Support <a class="header-anchor" href="#improved-relative-base-support">\xB6</a></h3><p>Vite 3 now properly supports relative base (using <code>base: &#39;&#39;</code>), allowing built assets to be deployed to different bases without re-building. This is useful when the base isn&#39;t known at build time, for example when deploying to content-addressable networks like <a href="https://ipfs.io/" target="_blank" rel="noopener noreferrer">IPFS</a>.</p><h2 id="experimental-features" tabindex="-1">Experimental Features <a class="header-anchor" href="#experimental-features">\xB6</a></h2><h3 id="built-asset-paths-fine-grained-control-experimental" tabindex="-1">Built Asset Paths fine-grained Control (Experimental) <a class="header-anchor" href="#built-asset-paths-fine-grained-control-experimental">\xB6</a></h3><p>There are other deploy scenarios where this isn&#39;t enough. For example, if the generated hashed assets need to be deployed to a different CDN from the public files, then finer-grained control is required over path generation at build time. Vite 3 provides an experimental API to modify the built file paths. Check <a href="https:/cancms.github.io/booking/user-manual/guide/build.html#advanced-base-options">Build Advanced Base Options</a> for more information.</p><h3 id="esbuild-deps-optimization-at-build-time-experimental" tabindex="-1">Esbuild Deps Optimization at Build Time (Experimental) <a class="header-anchor" href="#esbuild-deps-optimization-at-build-time-experimental">\xB6</a></h3><p>One of the main differences between dev and build time is how Vite handles dependencies. During build time, <a href="https://github.com/rollup/plugins/tree/master/packages/commonjs" target="_blank" rel="noopener noreferrer"><code>@rollup/plugin-commonjs</code></a> is used to allow importing CJS only dependencies (like React). When using the dev server, esbuild is used instead to pre-bundle and optimize dependencies, and an inline interop scheme is applied while transforming user code importing CJS deps. During the development of Vite 3, we introduced the changes needed to also allow the use of <a href="https:/cancms.github.io/booking/user-manual/guide/migration.html#using-esbuild-deps-optimization-at-build-time">esbuild to optimize dependencies during build time</a>. <a href="https://github.com/rollup/plugins/tree/master/packages/commonjs" target="_blank" rel="noopener noreferrer"><code>@rollup/plugin-commonjs</code></a> can then be avoided, making dev and build time work in the same way.</p><p>Given that Rollup v3 will be out in the next months, and we&#39;re going to follow up with another Vite major, we&#39;ve decided to make this mode optional to reduce v3 scope and give Vite and the ecosystem more time to work out possible issues with the new CJS interop approach during build time. Frameworks may switch to using esbuild deps optimization during build time by default at their own pace before Vite 4.</p><h3 id="hmr-partial-accept-experimental" tabindex="-1">HMR Partial Accept (Experimental) <a class="header-anchor" href="#hmr-partial-accept-experimental">\xB6</a></h3><p>There is opt-in support for <a href="https://github.com/vitejs/vite/pull/7324" target="_blank" rel="noopener noreferrer">HMR Partial Accept</a>. This feature could unlock finer-grained HMR for framework components that export several bindings in the same module. You can learn more at <a href="https://github.com/vitejs/vite/discussions/7309" target="_blank" rel="noopener noreferrer">the discussion for this proposal</a>.</p><h2 id="bundle-size-reduction" tabindex="-1">Bundle Size Reduction <a class="header-anchor" href="#bundle-size-reduction">\xB6</a></h2><p>Vite cares about its publish and install footprint; a fast installation of a new app is a feature. Vite bundles most of its dependencies and tries to use modern lightweight alternatives where possible. Continuing with this ongoing goal, Vite 3 publish size is 30% smaller than v2.</p><table><thead><tr><th></th><th style="text-align:center;">Publish Size</th><th style="text-align:center;">Install Size</th></tr></thead><tbody><tr><td>Vite 2.9.14</td><td style="text-align:center;">4.38MB</td><td style="text-align:center;">19.1MB</td></tr><tr><td>Vite 3.0.0</td><td style="text-align:center;">3.05MB</td><td style="text-align:center;">17.8MB</td></tr><tr><td>Reduction</td><td style="text-align:center;">-30%</td><td style="text-align:center;">-7%</td></tr></tbody></table><p>In part, this reduction was possible by making some dependencies that most users weren&#39;t needing optional. First, <a href="https://github.com/terser/terser" target="_blank" rel="noopener noreferrer">Terser</a> is no longer installed by default. This dependency was no longer needed since we already made esbuild the default minifier for both JS and CSS in Vite 2. If you use <code>build.minify: &#39;terser&#39;</code>, you&#39;ll need to install it (<code>npm add -D terser</code>). We also moved <a href="https://github.com/digitalbazaar/forge" target="_blank" rel="noopener noreferrer">node-forge</a> out of the monorepo, implementing support for automatic https certificate generation as a new plugin: <a href="https:/cancms.github.io/booking/user-manual/guide/migration.html#automatic-https-certificate-generation"><code>@vitejs/plugin-basic-ssl</code></a>. Since this feature only creates untrusted certificates that are not added to the local store, it didn&#39;t justify the added size.</p><h2 id="bug-fixing" tabindex="-1">Bug Fixing <a class="header-anchor" href="#bug-fixing">\xB6</a></h2><p>A triaging marathon was spearheaded by <a href="https://twitter.com/bluwyoo" target="_blank" rel="noopener noreferrer">@bluwyoo</a>, <a href="https://twitter.com/sapphi_red" target="_blank" rel="noopener noreferrer">@sapphi_red</a>, that recently joined the Vite team. During the past three months, the Vite open issues were reduced from 770 to 400. And this dive was achieved while the newly open PRs were at an all-time high. At the same time, <a href="https://twitter.com/haoqunjiang" target="_blank" rel="noopener noreferrer">@haoqunjiang</a> had also curated a comprehensive <a href="https://github.com/vitejs/vite/discussions/8232" target="_blank" rel="noopener noreferrer">overview of Vite issues</a>.</p><p><a href="https://www.repotrends.com/vitejs/vite" target="_blank" rel="noopener noreferrer"><img src="`+u+'" alt="Graph of open issues and pull requests in Vite"></a></p><p><a href="https://www.repotrends.com/vitejs/vite" target="_blank" rel="noopener noreferrer"><img src="'+m+'" alt="Graph of new issues and pull requests in Vite"></a></p><h2 id="compatibility-notes" tabindex="-1">Compatibility Notes <a class="header-anchor" href="#compatibility-notes">\xB6</a></h2><ul><li>Vite no longer supports Node.js 12 / 13 / 15, which reached its EOL. Node.js 14.18+ / 16+ is now required.</li><li>Vite is now published as ESM, with a CJS proxy to the ESM entry for compatibility.</li><li>The Modern Browser Baseline now targets browsers which support the <a href="https://caniuse.com/es6-module" target="_blank" rel="noopener noreferrer">native ES Modules</a>, <a href="https://caniuse.com/es6-module-dynamic-import" target="_blank" rel="noopener noreferrer">native ESM dynamic import</a>, and <a href="https://caniuse.com/mdn-javascript_operators_import_meta" target="_blank" rel="noopener noreferrer"><code>import.<wbr>meta</code></a> features.</li><li>JS file extensions in SSR and library mode now use a valid extension (<code>js</code>, <code>mjs</code>, or <code>cjs</code>) for output JS entries and chunks based on their format and the package type.</li></ul><p>Learn more in the <a href="https:/cancms.github.io/booking/user-manual/guide/migration.html">Migration Guide</a>.</p><h2 id="upgrades-to-vite-core" tabindex="-1">Upgrades to Vite Core <a class="header-anchor" href="#upgrades-to-vite-core">\xB6</a></h2><p>While working towards Vite 3, we also improved the contributing experience for collaborators to <a href="https://github.com/vitejs/vite" target="_blank" rel="noopener noreferrer">Vite Core</a>.</p><ul><li>Unit and E2E tests have been migrated to <a href="https://vitest.dev" target="_blank" rel="noopener noreferrer">Vitest</a>, providing a faster and more stable DX. This move also works as dog fooding for an important infrastructure project in the ecosystem.</li><li>VitePress build is now tested as part of CI.</li><li>Vite upgraded to <a href="https://pnpm.io/" target="_blank" rel="noopener noreferrer">pnpm 7</a>, following the rest of the ecosystem.</li><li>Playgrounds have been moved to <a href="https://github.com/vitejs/vite/tree/main/playground" target="_blank" rel="noopener noreferrer"><code>/playgrounds</code></a> out of packages directory.</li><li>The packages and playgrounds are now <code>&quot;type&quot;: &quot;module&quot;</code>.</li><li>Plugins are now bundled using <a href="https://github.com/unjs/unbuild" target="_blank" rel="noopener noreferrer">unbuild</a>, and <a href="https://github.com/vitejs/vite/tree/main/packages/plugin-vue-jsx" target="_blank" rel="noopener noreferrer">plugin-vue-jsx</a> and <a href="https://github.com/vitejs/vite/tree/main/packages/plugin-legacy" target="_blank" rel="noopener noreferrer">plugin-legacy</a> were moved to TypeScript.</li></ul><h2 id="the-ecosystem-is-ready-for-v3" tabindex="-1">The Ecosystem is Ready for v3 <a class="header-anchor" href="#the-ecosystem-is-ready-for-v3">\xB6</a></h2><p>We have worked closely with projects in the ecosystem to ensure that frameworks powered by Vite are ready for Vite 3. <a href="https://github.com/vitejs/vite-ecosystem-ci" target="_blank" rel="noopener noreferrer">vite-ecosystem-ci</a> allows us to run the CI&#39;s from the leading players in the ecosystem against Vite&#39;s main branch and receive timely reports before introducing a regression. Today&#39;s release should soon be compatible with most projects using Vite.</p><h2 id="acknowledgments" tabindex="-1">Acknowledgments <a class="header-anchor" href="#acknowledgments">\xB6</a></h2><p>Vite 3 is the result of the aggregate effort of members of the <a href="https:/cancms.github.io/booking/user-manual/team.html">Vite Team</a> working together with ecosystem project maintainers and other collaborators to Vite core.</p><p>We want to thank everyone that have implemented features, and fixes, given feedback, and have been involved in Vite 3:</p><ul><li>Vite team members <a href="https://twitter.com/youyuxi" target="_blank" rel="noopener noreferrer">@youyuxi</a>, <a href="https://twitter.com/patak_dev" target="_blank" rel="noopener noreferrer">@patak_dev</a>, <a href="https://twitter.com/antfu7" target="_blank" rel="noopener noreferrer">@antfu7</a>, <a href="https://twitter.com/bluwyoo" target="_blank" rel="noopener noreferrer">@bluwyoo</a>, <a href="https://twitter.com/sapphi_red" target="_blank" rel="noopener noreferrer">@sapphi_red</a>, <a href="https://twitter.com/haoqunjiang" target="_blank" rel="noopener noreferrer">@haoqunjiang</a>, <a href="https://github.com/poyoho" target="_blank" rel="noopener noreferrer">@poyoho</a>, <a href="https://twitter.com/Shini_92" target="_blank" rel="noopener noreferrer">@Shini_92</a>, and <a href="https://twitter.com/retropragma" target="_blank" rel="noopener noreferrer">@retropragma</a>.</li><li><a href="https://github.com/benmccann" target="_blank" rel="noopener noreferrer">@benmccann</a>, <a href="https://twitter.com/danielcroe" target="_blank" rel="noopener noreferrer">@danielcroe</a>, <a href="https://twitter.com/brillout" target="_blank" rel="noopener noreferrer">@brillout</a>, <a href="https://twitter.com/sheremet_va" target="_blank" rel="noopener noreferrer">@sheremet_va</a>, <a href="https://twitter.com/userquin" target="_blank" rel="noopener noreferrer">@userquin</a>, <a href="https://twitter.com/enzoinnocenzi" target="_blank" rel="noopener noreferrer">@enzoinnocenzi</a>, <a href="https://twitter.com/maximomussini" target="_blank" rel="noopener noreferrer">@maximomussini</a>, <a href="https://twitter.com/IanVanSchooten" target="_blank" rel="noopener noreferrer">@IanVanSchooten</a>, the <a href="https://astro.build/" target="_blank" rel="noopener noreferrer">Astro team</a>, and all other maintainers of frameworks and plugins in the ecosystem in that helped shape v3.</li><li><a href="https://github.com/dominikg" target="_blank" rel="noopener noreferrer">@dominikg</a> for his work on vite-ecosystem-ci.</li><li><a href="https://twitter.com/ZoltanKochan" target="_blank" rel="noopener noreferrer">@ZoltanKochan</a> for his work on <a href="https://pnpm.io/" target="_blank" rel="noopener noreferrer">pnpm</a>, and for his responsiveness when we needed support with it.</li><li><a href="https://github.com/rixo" target="_blank" rel="noopener noreferrer">@rixo</a> for HMR Partial Accept support.</li><li><a href="https://twitter.com/KiaKing85" target="_blank" rel="noopener noreferrer">@KiaKing85</a> for getting the theme ready for the Vite 3 release, and <a href="https://twitter.com/_brc_dd" target="_blank" rel="noopener noreferrer">@_brc_dd</a> for working on the VitePress internals.</li><li><a href="https://twitter.com/CodingWithCego" target="_blank" rel="noopener noreferrer">@CodingWithCego</a> for the new Spanish translation, and <a href="https://twitter.com/ShenQingchuan" target="_blank" rel="noopener noreferrer">@ShenQingchuan</a>, <a href="https://github.com/hiro-lapis" target="_blank" rel="noopener noreferrer">@hiro-lapis</a> and others in the Chinese and Japanese translations teams for keeping the translated docs up to date.</li></ul><p>We also want to thank individuals and companies sponsoring the Vite team, and companies investing in Vite development: some of <a href="https://twitter.com/antfu7" target="_blank" rel="noopener noreferrer">@antfu7</a>&#39;s work on Vite and the ecosystem is part of his job at <a href="https://nuxtlabs.com/" target="_blank" rel="noopener noreferrer">Nuxt Labs</a>, and <a href="https://stackblitz.com/" target="_blank" rel="noopener noreferrer">StackBlitz</a> hired <a href="https://twitter.com/patak_dev" target="_blank" rel="noopener noreferrer">@patak_dev</a> to work full time on Vite.</p><h2 id="what-s-next" tabindex="-1">What&#39;s Next <a class="header-anchor" href="#what-s-next">\xB6</a></h2><p>We&#39;ll take the following months to ensure a smooth transition for all the projects built on top of Vite. So the first minors will be focused on continuing our triaging efforts with a focus on newly opened issues.</p><p>The Rollup team is <a href="https://twitter.com/lukastaegert/status/1544186847399743488" target="_blank" rel="noopener noreferrer">working on its next major</a>, to be released in the following months. Once the Rollup plugins ecosystem has time to update, we&#39;ll follow up with a new Vite major. This will give us another opportunity to introduce more significant changes this year, which we could take to stabilize some of the experimental features introduced in this release.</p><p>If you are interested in helping improve Vite, the best way to get on board is to help with triaging issues. Join <a href="https://chat.vitejs.dev" target="_blank" rel="noopener noreferrer">our Discord</a> and look for the <code>#contributing</code> channel. Or get involved in our <code>#docs</code>, <code>#help</code> others, or create plugins. We are just getting started. There are many open ideas to keep improving Vite&#39;s DX.</p>',82),b=[f];function v(y,w,k,D,_,F){return a(),t("div",null,b)}var x=e(g,[["render",v]]);export{C as __pageData,x as default};
