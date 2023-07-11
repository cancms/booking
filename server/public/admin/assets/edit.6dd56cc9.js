import{_ as N}from"./index.bf882b58.js";import{N as $,I,B as O,C as z,O as L,P as S,v as T,Q as j,R as P,D as G,w as H}from"./element-plus.4c84fed9.js";import{_ as K}from"./index.vue_vue_type_style_index_0_lang.028ddbac.js";import{_ as M}from"./picker.22059d9c.js";import{u as Q,a as J}from"./vue-router.12d45bc3.js";import{u as W}from"./useDictOptions.8355a429.js";import{g as X,h as Y,i as Z,j as ee}from"./article.1d2cea55.js";import{e as te}from"./index.9623039f.js";import{d as V,$ as E,s as oe,o as m,c as b,U as e,L as a,a as u,V as le,a7 as ae,u as ue,S as d,K as re}from"./@vue.e8706010.js";import"./@vueuse.1e5a6e21.js";import"./@element-plus.196c7323.js";import"./lodash-es.92e7f918.js";import"./dayjs.acb2afad.js";import"./axios.4ea15493.js";import"./async-validator.fb49d0f5.js";import"./@ctrl.82a509e0.js";import"./@popperjs.36402333.js";import"./escape-html.e5dfadb9.js";import"./normalize-wheel-es.8aeb3683.js";import"./@wangeditor.d48d1b87.js";import"./index.ce9653e5.js";import"./index.13998e90.js";import"./index.vue_vue_type_script_setup_true_lang.9919777c.js";import"./index.befa2b22.js";import"./index.vue_vue_type_script_setup_true_lang.50d803e5.js";import"./usePaging.b71474b4.js";import"./vue3-video-play.4851e3ad.js";import"./vuedraggable.0a97d29d.js";import"./vue.175d7544.js";import"./sortablejs.6cd2b42b.js";import"./lodash.ded75160.js";import"./pinia.dfca86b4.js";import"./vue-demi.ebc8116b.js";import"./css-color-function.c8e19b2b.js";import"./color.1121912c.js";import"./clone.9e59dbcb.js";import"./color-convert.755d189f.js";import"./color-name.e7a4e1d3.js";import"./color-string.e356f5de.js";import"./balanced-match.d2a36341.js";import"./debug.72cc5392.js";import"./ms.a9ae1d6d.js";import"./nprogress.2a2760db.js";import"./vue-clipboard3.38dbacbe.js";import"./clipboard.78d63871.js";import"./echarts.8d7a50ae.js";import"./zrender.1084fa23.js";import"./tslib.60310f1a.js";import"./highlight.js.4ebdf9a4.js";import"./@highlightjs.2cdc8407.js";const ie={class:"article-edit"},se={class:"xl:flex"},ne={class:"w-80"},me={class:"w-80"},de={class:"w-80"},pe=u("div",{class:"form-tips"},"\u5EFA\u8BAE\u5C3A\u5BF8\uFF1A240*180px",-1),_e={class:"w-80"},ce=u("div",{class:"form-tips"},"\u9ED8\u8BA4\u4E3A0\uFF0C \u6570\u503C\u8D8A\u5927\u8D8A\u6392\u524D",-1),fe=d("\u663E\u793A"),Ee=d("\u9690\u85CF"),be={class:"xl:ml-20"},Ve=d("\u4FDD\u5B58"),we=V({name:"articleListsEdit"}),bt=V({...we,setup(Fe){const n=Q(),w=J(),t=E({id:"",title:"",image:"",cid:"",desc:"",author:"",content:"",click_virtual:0,sort:0,is_show:1,abstract:""}),{removeTab:F}=te(),p=oe(),v=E({title:[{required:!0,message:"\u8BF7\u8F93\u5165\u6587\u7AE0\u6807\u9898",trigger:"blur"}],cid:[{required:!0,message:"\u8BF7\u9009\u62E9\u6587\u7AE0\u680F\u76EE",trigger:"blur"}]}),B=async()=>{const i=await X({id:n.query.id});Object.keys(t).forEach(o=>{t[o]=i[o]})},{optionsData:g}=W({article_cate:{api:Y}}),A=async()=>{var i;await((i=p.value)==null?void 0:i.validate()),n.query.id?await Z(t):await ee(t),F(),w.back()};return n.query.id&&B(),(i,o)=>{const h=$,_=I,s=O,r=z,C=L,x=S,D=M,c=T,f=j,k=P,R=K,y=G,U=H,q=N;return m(),b("div",ie,[e(_,{class:"!border-none",shadow:"never"},{default:a(()=>[e(h,{content:i.$route.meta.title,onBack:o[0]||(o[0]=l=>i.$router.back())},null,8,["content"])]),_:1}),e(_,{class:"mt-4 !border-none",shadow:"never"},{default:a(()=>[e(y,{ref_key:"formRef",ref:p,class:"ls-form",model:t,"label-width":"85px",rules:v},{default:a(()=>[u("div",se,[u("div",null,[e(r,{label:"\u6587\u7AE0\u6807\u9898",prop:"title"},{default:a(()=>[u("div",ne,[e(s,{modelValue:t.title,"onUpdate:modelValue":o[1]||(o[1]=l=>t.title=l),placeholder:"\u8BF7\u8F93\u5165\u6587\u7AE0\u6807\u9898",type:"textarea",autosize:{minRows:3,maxRows:3},maxlength:"64","show-word-limit":"",clearable:""},null,8,["modelValue"])])]),_:1}),e(r,{label:"\u6587\u7AE0\u680F\u76EE",prop:"cid"},{default:a(()=>[e(x,{class:"w-80",modelValue:t.cid,"onUpdate:modelValue":o[2]||(o[2]=l=>t.cid=l),placeholder:"\u8BF7\u9009\u62E9\u6587\u7AE0\u680F\u76EE",clearable:""},{default:a(()=>[(m(!0),b(le,null,ae(ue(g).article_cate,l=>(m(),re(C,{key:l.id,label:l.name,value:l.id},null,8,["label","value"]))),128))]),_:1},8,["modelValue"])]),_:1}),e(r,{label:"\u6587\u7AE0\u7B80\u4ECB",prop:"desc"},{default:a(()=>[u("div",me,[e(s,{modelValue:t.desc,"onUpdate:modelValue":o[3]||(o[3]=l=>t.desc=l),placeholder:"\u8BF7\u8F93\u5165\u6587\u7AE0\u7B80\u4ECB",type:"textarea",autosize:{minRows:3,maxRows:6},maxlength:200,"show-word-limit":"",clearable:""},null,8,["modelValue"])])]),_:1}),e(r,{label:"\u6458\u8981",prop:"abstract"},{default:a(()=>[u("div",de,[e(s,{type:"textarea",autosize:{minRows:6,maxRows:6},modelValue:t.abstract,"onUpdate:modelValue":o[4]||(o[4]=l=>t.abstract=l),maxlength:"200","show-word-limit":"",clearable:""},null,8,["modelValue"])])]),_:1}),e(r,{label:"\u6587\u7AE0\u5C01\u9762",prop:"image"},{default:a(()=>[u("div",null,[u("div",null,[e(D,{modelValue:t.image,"onUpdate:modelValue":o[5]||(o[5]=l=>t.image=l),limit:1},null,8,["modelValue"])]),pe])]),_:1}),e(r,{label:"\u4F5C\u8005",prop:"author"},{default:a(()=>[u("div",_e,[e(s,{modelValue:t.author,"onUpdate:modelValue":o[6]||(o[6]=l=>t.author=l),placeholder:"\u8BF7\u8F93\u5165\u4F5C\u8005\u540D\u79F0"},null,8,["modelValue"])])]),_:1}),e(r,{label:"\u6392\u5E8F",prop:"sort"},{default:a(()=>[u("div",null,[e(c,{modelValue:t.sort,"onUpdate:modelValue":o[7]||(o[7]=l=>t.sort=l),min:0,max:9999},null,8,["modelValue"]),ce])]),_:1}),e(r,{label:"\u521D\u59CB\u6D4F\u89C8\u91CF",prop:"click_virtual"},{default:a(()=>[u("div",null,[e(c,{modelValue:t.click_virtual,"onUpdate:modelValue":o[8]||(o[8]=l=>t.click_virtual=l),min:0},null,8,["modelValue"])])]),_:1}),e(r,{label:"\u6587\u7AE0\u72B6\u6001",required:"",prop:"is_show"},{default:a(()=>[e(k,{modelValue:t.is_show,"onUpdate:modelValue":o[9]||(o[9]=l=>t.is_show=l)},{default:a(()=>[e(f,{label:1},{default:a(()=>[fe]),_:1}),e(f,{label:0},{default:a(()=>[Ee]),_:1})]),_:1},8,["modelValue"])]),_:1})]),u("div",be,[e(r,{label:"\u6587\u7AE0\u5185\u5BB9",prop:"content"},{default:a(()=>[e(R,{modelValue:t.content,"onUpdate:modelValue":o[10]||(o[10]=l=>t.content=l),height:667,width:375},null,8,["modelValue"])]),_:1})])])]),_:1},8,["model","rules"])]),_:1}),e(q,null,{default:a(()=>[e(U,{type:"primary",onClick:A},{default:a(()=>[Ve]),_:1})]),_:1})])}}});export{bt as default};