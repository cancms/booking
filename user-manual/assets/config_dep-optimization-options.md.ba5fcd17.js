import{_ as e,c as o,o as s,a as i}from"./app.a104fce0.js";const h=JSON.parse('{"title":"\u4F9D\u8D56\u4F18\u5316\u9009\u9879","description":"","frontmatter":{},"headers":[{"level":2,"title":"optimizeDeps.entries","slug":"optimizedeps-entries"},{"level":2,"title":"optimizeDeps.exclude","slug":"optimizedeps-exclude"},{"level":2,"title":"optimizeDeps.include","slug":"optimizedeps-include"},{"level":2,"title":"optimizeDeps.esbuildOptions","slug":"optimizedeps-esbuildoptions"},{"level":2,"title":"optimizeDeps.force","slug":"optimizedeps-force"}],"relativePath":"config/dep-optimization-options.md"}'),p={name:"config/dep-optimization-options.md"},t=i(`<h1 id="dep-optimization-options" tabindex="-1">\u4F9D\u8D56\u4F18\u5316\u9009\u9879 <a class="header-anchor" href="#dep-optimization-options">\xB6</a></h1><ul><li><strong>\u76F8\u5173\u5185\u5BB9\uFF1A</strong> <a href="/guide/dep-pre-bundling.html">\u4F9D\u8D56\u9884\u6784\u5EFA</a></li></ul><h2 id="optimizedeps-entries" tabindex="-1">optimizeDeps.entries <a class="header-anchor" href="#optimizedeps-entries">\xB6</a></h2><ul><li><strong>\u7C7B\u578B\uFF1A</strong> <code>string | string[]</code></li></ul><p>\u9ED8\u8BA4\u60C5\u51B5\u4E0B\uFF0CVite \u4F1A\u6293\u53D6\u4F60\u7684 <code>index.html</code> \u6765\u68C0\u6D4B\u9700\u8981\u9884\u6784\u5EFA\u7684\u4F9D\u8D56\u9879\uFF08\u5FFD\u7565\u4E86<code>node_modules</code>\u3001<code>build.outDir</code>\u3001<code>__tests__</code> \u548C <code>coverage</code>\uFF09\u3002\u5982\u679C\u6307\u5B9A\u4E86 <code>build.rollupOptions.input</code>\uFF0CVite \u5C06\u8F6C\u800C\u53BB\u6293\u53D6\u8FD9\u4E9B\u5165\u53E3\u70B9\u3002</p><p>\u5982\u679C\u8FD9\u4E24\u8005\u90FD\u4E0D\u5408\u4F60\u610F\uFF0C\u5219\u53EF\u4EE5\u4F7F\u7528\u6B64\u9009\u9879\u6307\u5B9A\u81EA\u5B9A\u4E49\u6761\u76EE\u2014\u2014\u8BE5\u503C\u9700\u8981\u9075\u5FAA <a href="https://github.com/mrmlnc/fast-glob#basic-syntax" target="_blank" rel="noopener noreferrer">fast-glob \u6A21\u5F0F</a> \uFF0C\u6216\u8005\u662F\u76F8\u5BF9\u4E8E Vite \u9879\u76EE\u6839\u76EE\u5F55\u7684\u5339\u914D\u6A21\u5F0F\u6570\u7EC4\u3002\u5F53\u663E\u5F0F\u58F0\u660E\u4E86 <code>optimizeDeps.entries</code> \u65F6\u9ED8\u8BA4\u53EA\u6709 <code>node_modules</code> \u548C <code>build.outDir</code> \u6587\u4EF6\u5939\u4F1A\u88AB\u5FFD\u7565\u3002\u5982\u679C\u8FD8\u9700\u5FFD\u7565\u5176\u4ED6\u6587\u4EF6\u5939\uFF0C\u4F60\u53EF\u4EE5\u5728\u6A21\u5F0F\u5217\u8868\u4E2D\u4F7F\u7528\u4EE5 <code>!</code> \u4E3A\u524D\u7F00\u7684\u3001\u7528\u6765\u5339\u914D\u5FFD\u7565\u9879\u7684\u6A21\u5F0F\u3002</p><h2 id="optimizedeps-exclude" tabindex="-1">optimizeDeps.exclude <a class="header-anchor" href="#optimizedeps-exclude">\xB6</a></h2><ul><li><strong>\u7C7B\u578B\uFF1A</strong> <code>string[]</code></li></ul><p>\u5728\u9884\u6784\u5EFA\u4E2D\u5F3A\u5236\u6392\u9664\u7684\u4F9D\u8D56\u9879\u3002</p><div class="warning custom-block"><p class="custom-block-title">CommonJS</p><p>CommonJS \u7684\u4F9D\u8D56\u4E0D\u5E94\u8BE5\u6392\u9664\u5728\u4F18\u5316\u5916\u3002\u5982\u679C\u4E00\u4E2A ESM \u4F9D\u8D56\u88AB\u6392\u9664\u5728\u4F18\u5316\u5916\uFF0C\u4F46\u662F\u5374\u6709\u4E00\u4E2A\u5D4C\u5957\u7684 CommonJS \u4F9D\u8D56\uFF0C\u5219\u5E94\u8BE5\u4E3A\u8BE5 CommonJS \u4F9D\u8D56\u6DFB\u52A0 <code>optimizeDeps.include</code>\u3002\u4F8B\u5982\uFF1A</p><div class="language-js"><span class="copy"></span><pre><code><span class="line"><span style="color:#89DDFF;font-style:italic;">export</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;font-style:italic;">default</span><span style="color:#A6ACCD;"> </span><span style="color:#82AAFF;">defineConfig</span><span style="color:#A6ACCD;">(</span><span style="color:#89DDFF;">{</span></span>
<span class="line"><span style="color:#A6ACCD;">  </span><span style="color:#F07178;">optimizeDeps</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> </span><span style="color:#89DDFF;">{</span></span>
<span class="line"><span style="color:#A6ACCD;">    </span><span style="color:#F07178;">include</span><span style="color:#89DDFF;">:</span><span style="color:#A6ACCD;"> [</span><span style="color:#89DDFF;">&#39;</span><span style="color:#C3E88D;">esm-dep &gt; cjs-dep</span><span style="color:#89DDFF;">&#39;</span><span style="color:#A6ACCD;">]</span></span>
<span class="line"><span style="color:#A6ACCD;">  </span><span style="color:#89DDFF;">}</span></span>
<span class="line"><span style="color:#89DDFF;">}</span><span style="color:#A6ACCD;">)</span></span>
<span class="line"></span></code></pre></div></div><h2 id="optimizedeps-include" tabindex="-1">optimizeDeps.include <a class="header-anchor" href="#optimizedeps-include">\xB6</a></h2><ul><li><strong>\u7C7B\u578B\uFF1A</strong> <code>string[]</code></li></ul><p>\u9ED8\u8BA4\u60C5\u51B5\u4E0B\uFF0C\u4E0D\u5728 <code>node_modules</code> \u4E2D\u7684\uFF0C\u94FE\u63A5\u7684\u5305\u4E0D\u4F1A\u88AB\u9884\u6784\u5EFA\u3002\u4F7F\u7528\u6B64\u9009\u9879\u53EF\u5F3A\u5236\u9884\u6784\u5EFA\u94FE\u63A5\u7684\u5305\u3002</p><h2 id="optimizedeps-esbuildoptions" tabindex="-1">optimizeDeps.esbuildOptions <a class="header-anchor" href="#optimizedeps-esbuildoptions">\xB6</a></h2><ul><li><strong>\u7C7B\u578B\uFF1A</strong> <a href="https://esbuild.github.io/api/#simple-options" target="_blank" rel="noopener noreferrer"><code>EsbuildBuildOptions</code></a></li></ul><p>\u5728\u90E8\u7F72\u626B\u63CF\u548C\u4F18\u5316\u8FC7\u7A0B\u4E2D\u4F20\u9012\u7ED9 esbuild \u7684\u9009\u9879\u3002</p><p>\u67D0\u4E9B\u9009\u9879\u8FDB\u884C\u4E86\u7701\u7565\uFF0C\u56E0\u4E3A\u4FEE\u6539\u5B83\u4EEC\u4E0E Vite \u7684\u4F18\u5316\u65B9\u6848\u5E76\u4E0D\u517C\u5BB9\u3002</p><ul><li>\u5FFD\u7565\u4E86 <code>external</code> \u9009\u9879\uFF0C\u8BF7\u4F7F\u7528 Vite \u7684 <code>optimizeDeps.exclude</code> \u9009\u9879</li><li><code>plugins</code> \u4E0E Vite \u7684 dep \u63D2\u4EF6\u5408\u5E76</li></ul><h2 id="optimizedeps-force" tabindex="-1">optimizeDeps.force <a class="header-anchor" href="#optimizedeps-force">\xB6</a></h2><ul><li><strong>\u7C7B\u578B\uFF1A</strong> <code>boolean</code></li></ul><p>\u8BBE\u7F6E\u4E3A <code>true</code> \u53EF\u4EE5\u5F3A\u5236\u4F9D\u8D56\u9884\u6784\u5EFA\uFF0C\u800C\u5FFD\u7565\u4E4B\u524D\u5DF2\u7ECF\u7F13\u5B58\u8FC7\u7684\u3001\u5DF2\u7ECF\u4F18\u5316\u8FC7\u7684\u4F9D\u8D56\u3002</p>`,21),n=[t];function l(a,c,d,r,u,m){return s(),o("div",null,n)}var g=e(p,[["render",l]]);export{h as __pageData,g as default};
