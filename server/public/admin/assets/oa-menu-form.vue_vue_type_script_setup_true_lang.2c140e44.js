import{B,C as D,Q as C,R as g,D as I}from"./element-plus.4c84fed9.js";import{r as c}from"./useMenuOa.4ff15a86.js";import{d as k,s as w,r as P,w as R,l as U,o as p,K as _,L as u,U as a,R as s,H as h,c as F,V as T,u as x,S as f}from"./@vue.e8706010.js";const A=f("\u4E0D\u914D\u7F6E\u5B50\u83DC\u5355"),N=f("\u914D\u7F6E\u5B50\u83DC\u5355"),S=f("\u7F51\u9875"),G=f("\u5C0F\u7A0B\u5E8F"),Q=k({__name:"oa-menu-form",props:{modular:{default:"master"},name:{default:""},menuType:{type:Boolean,default:!1},visitType:{default:"view"},url:{default:""},appId:{default:""},pagePath:{default:""}},emits:["update:name","update:menuType","update:visitType","update:url","update:appId","update:pagePath"],setup(m,{expose:E,emit:d}){const i=m,y=w(),e=P({...i});return R(()=>i,v=>{e.value=v},{immediate:!0}),U(()=>{i.modular==="master"&&d("update:menuType",e.value.menuType),d("update:name",e.value.name),d("update:visitType",e.value.visitType),d("update:url",e.value.url),d("update:appId",e.value.appId),d("update:pagePath",e.value.pagePath)}),E({menuFormRef:y}),(v,l)=>{const r=B,o=D,n=C,V=g,b=I;return p(),_(b,{ref_key:"menuFormRef",ref:y,rules:x(c),model:e.value,"label-width":"100px"},{default:u(()=>[a(o,{label:m.modular==="master"?"\u4E3B\u83DC\u5355\u540D\u79F0":"\u5B50\u83DC\u5355\u540D\u79F0",prop:"name"},{default:u(()=>[a(r,{modelValue:e.value.name,"onUpdate:modelValue":l[0]||(l[0]=t=>e.value.name=t)},null,8,["modelValue"])]),_:1},8,["label"]),m.modular==="master"?(p(),_(o,{key:0,label:"\u4E3B\u83DC\u5355\u7C7B\u578B",prop:"menuType"},{default:u(()=>[a(V,{modelValue:e.value.menuType,"onUpdate:modelValue":l[1]||(l[1]=t=>e.value.menuType=t)},{default:u(()=>[a(n,{label:!1},{default:u(()=>[A]),_:1}),a(n,{label:!0},{default:u(()=>[N]),_:1})]),_:1},8,["modelValue"])]),_:1})):s("",!0),e.value.menuType&&m.modular==="master"?(p(),_(o,{key:1,label:""},{default:u(()=>[h(v.$slots,"default")]),_:3})):s("",!0),e.value.menuType?s("",!0):(p(),F(T,{key:2},[a(o,{label:"\u8DF3\u8F6C\u94FE\u63A5",prop:"visitType"},{default:u(()=>[a(V,{modelValue:e.value.visitType,"onUpdate:modelValue":l[2]||(l[2]=t=>e.value.visitType=t)},{default:u(()=>[a(n,{label:"view"},{default:u(()=>[S]),_:1}),a(n,{label:"miniprogram"},{default:u(()=>[G]),_:1})]),_:1},8,["modelValue"])]),_:1}),a(o,{label:"\u7F51\u5740",prop:"url"},{default:u(()=>[a(r,{modelValue:e.value.url,"onUpdate:modelValue":l[3]||(l[3]=t=>e.value.url=t)},null,8,["modelValue"])]),_:1}),e.value.visitType=="miniprogram"?(p(),F(T,{key:0},[a(o,{label:"AppId",prop:"appId"},{default:u(()=>[a(r,{modelValue:e.value.appId,"onUpdate:modelValue":l[4]||(l[4]=t=>e.value.appId=t)},null,8,["modelValue"])]),_:1}),a(o,{label:"\u8DEF\u5F84",prop:"pagePath"},{default:u(()=>[a(r,{modelValue:e.value.pagePath,"onUpdate:modelValue":l[5]||(l[5]=t=>e.value.pagePath=t)},null,8,["modelValue"])]),_:1})],64)):s("",!0)],64))]),_:3},8,["rules","model"])}}});export{Q as _};
