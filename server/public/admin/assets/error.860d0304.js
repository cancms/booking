import{w as c}from"./element-plus.4c84fed9.js";import{a as u}from"./vue-router.12d45bc3.js";import{d,r as _,G as v,o as a,c as f,a as r,H as B,T as i,K as x,L as y,S as g,u as E,R as h}from"./@vue.e8706010.js";import{d as k}from"./index.9623039f.js";import"./@vueuse.1e5a6e21.js";import"./@element-plus.196c7323.js";import"./lodash-es.92e7f918.js";import"./dayjs.acb2afad.js";import"./axios.4ea15493.js";import"./async-validator.fb49d0f5.js";import"./@ctrl.82a509e0.js";import"./@popperjs.36402333.js";import"./escape-html.e5dfadb9.js";import"./normalize-wheel-es.8aeb3683.js";import"./lodash.ded75160.js";import"./pinia.dfca86b4.js";import"./vue-demi.ebc8116b.js";import"./css-color-function.c8e19b2b.js";import"./color.1121912c.js";import"./clone.9e59dbcb.js";import"./color-convert.755d189f.js";import"./color-name.e7a4e1d3.js";import"./color-string.e356f5de.js";import"./balanced-match.d2a36341.js";import"./debug.72cc5392.js";import"./ms.a9ae1d6d.js";import"./nprogress.2a2760db.js";import"./vue-clipboard3.38dbacbe.js";import"./clipboard.78d63871.js";import"./echarts.8d7a50ae.js";import"./zrender.1084fa23.js";import"./tslib.60310f1a.js";import"./highlight.js.4ebdf9a4.js";import"./@highlightjs.2cdc8407.js";const w={class:"error"},S={class:"error-code"},C={class:"text-lg text-tx-secondary mt-7 mb-7"},D=d({__name:"error",props:{code:String,title:String,showBtn:{type:Boolean,default:!0}},setup(t){const n=t;let o=null;const e=_(5),s=u();return n.showBtn&&(o=setInterval(()=>{e.value===0?(clearInterval(o),s.go(-1)):e.value--},1e3)),v(()=>{o&&clearInterval(o)}),(p,m)=>{const l=c;return a(),f("div",w,[r("div",null,[B(p.$slots,"content",{},()=>[r("div",S,i(t.code),1)],!0),r("div",C,i(t.title),1),t.showBtn?(a(),x(l,{key:0,type:"primary",onClick:m[0]||(m[0]=I=>E(s).go(-1))},{default:y(()=>[g(i(e.value)+" \u79D2\u540E\u8FD4\u56DE\u4E0A\u4E00\u9875 ",1)]),_:1})):h("",!0)])])}}});const pt=k(D,[["__scopeId","data-v-9a820143"]]);export{pt as default};
