import{H as C,I as b,J as v,_ as A,w as k,K as y,L as D}from"./element-plus.4c84fed9.js";import{s as x,_ as L}from"./edit.vue_vue_type_script_setup_true_lang.e876f9fd.js";import{d as F,s as T,$ as R,af as S,o as a,c as $,U as t,L as e,M as d,K as u,S as l}from"./@vue.e8706010.js";import"./@vueuse.1e5a6e21.js";import"./@element-plus.196c7323.js";import"./lodash-es.92e7f918.js";import"./dayjs.acb2afad.js";import"./axios.4ea15493.js";import"./async-validator.fb49d0f5.js";import"./@ctrl.82a509e0.js";import"./@popperjs.36402333.js";import"./escape-html.e5dfadb9.js";import"./normalize-wheel-es.8aeb3683.js";import"./index.9623039f.js";import"./lodash.ded75160.js";import"./vue-router.12d45bc3.js";import"./pinia.dfca86b4.js";import"./vue-demi.ebc8116b.js";import"./css-color-function.c8e19b2b.js";import"./color.1121912c.js";import"./clone.9e59dbcb.js";import"./color-convert.755d189f.js";import"./color-name.e7a4e1d3.js";import"./color-string.e356f5de.js";import"./balanced-match.d2a36341.js";import"./debug.72cc5392.js";import"./ms.a9ae1d6d.js";import"./nprogress.2a2760db.js";import"./vue-clipboard3.38dbacbe.js";import"./clipboard.78d63871.js";import"./echarts.8d7a50ae.js";import"./zrender.1084fa23.js";import"./tslib.60310f1a.js";import"./highlight.js.4ebdf9a4.js";import"./@highlightjs.2cdc8407.js";import"./index.ce9653e5.js";const K={class:"storage"},N=l("\u5F00\u542F"),V=l("\u5173\u95ED"),z=l(" \u8BBE\u7F6E "),H=F({name:"storage"}),vt=F({...H,setup(I){const m=T(),o=R({loading:!1,lists:[]}),p=async()=>{try{o.loading=!0,o.lists=await x(),o.loading=!1}catch{o.loading=!1}},f=i=>{var r;(r=m.value)==null||r.open(i)};return p(),(i,r)=>{const g=C,c=b,s=v,_=A,B=k,E=y,h=S("perms"),w=D;return a(),$("div",K,[t(c,{class:"!border-none",shadow:"never"},{default:e(()=>[t(g,{type:"warning",title:"\u6E29\u99A8\u63D0\u793A\uFF1A1.\u5207\u6362\u5B58\u50A8\u65B9\u5F0F\u540E\uFF0C\u9700\u8981\u5C06\u8D44\u6E90\u6587\u4EF6\u4F20\u8F93\u81F3\u65B0\u7684\u5B58\u50A8\u7AEF\uFF1B2.\u8BF7\u52FF\u968F\u610F\u5207\u6362\u5B58\u50A8\u65B9\u5F0F\uFF0C\u53EF\u80FD\u5BFC\u81F4\u56FE\u7247\u65E0\u6CD5\u67E5\u770B",closable:!1,"show-icon":""})]),_:1}),d((a(),u(c,{class:"!border-none mt-4",shadow:"never"},{default:e(()=>[t(E,{size:"large",data:o.lists},{default:e(()=>[t(s,{label:"\u50A8\u5B58\u65B9\u5F0F",prop:"name","min-width":"120"}),t(s,{label:"\u50A8\u5B58\u4F4D\u7F6E",prop:"path","min-width":"160"}),t(s,{label:"\u72B6\u6001","min-width":"80"},{default:e(({row:n})=>[n.status==1?(a(),u(_,{key:0},{default:e(()=>[N]),_:1})):(a(),u(_,{key:1,type:"danger"},{default:e(()=>[V]),_:1}))]),_:1}),t(s,{label:"\u64CD\u4F5C","min-width":"80",fixed:"right"},{default:e(({row:n})=>[d((a(),u(B,{type:"primary",link:"",onClick:J=>f(n.engine)},{default:e(()=>[z]),_:2},1032,["onClick"])),[[h,["setting.storage/setup"]]])]),_:1})]),_:1},8,["data"])]),_:1})),[[w,o.loading]]),t(L,{ref_key:"editRef",ref:m,onSuccess:p},null,512)])}}});export{vt as default};