import{B as w,C as x,v as R,Q as k,R as y,D as g}from"./element-plus.4c84fed9.js";import{P as h}from"./index.ce9653e5.js";import{a as U,b as N}from"./dict.e1dc3479.js";import{d as q,s as _,r as A,e as I,$ as P,o as S,c as T,U as l,L as a,a as c,u as z,S as f}from"./@vue.e8706010.js";const G={class:"edit-popup"},L=c("div",{class:"form-tips"},"\u6570\u503C\u8D8A\u5927\u8D8A\u6392\u524D",-1),Q=f("\u6B63\u5E38"),$=f("\u505C\u7528"),X=q({__name:"edit",emits:["success","close"],setup(j,{expose:v,emit:m}){const p=_(),d=_(),n=A("add"),B=I(()=>n.value=="edit"?"\u7F16\u8F91\u5B57\u5178\u6570\u636E":"\u65B0\u589E\u5B57\u5178\u6570\u636E"),u=P({id:"",type_value:"",name:"",value:"",sort:0,status:1,remark:"",type_id:0}),E={name:[{required:!0,message:"\u8BF7\u8F93\u5165\u6570\u636E\u540D\u79F0",trigger:["blur"]}],value:[{required:!0,message:"\u8BF7\u8F93\u5165\u6570\u636E\u503C",trigger:["blur"]}]},F=async()=>{var o,e;await((o=p.value)==null?void 0:o.validate()),n.value=="edit"?await U(u):await N(u),(e=d.value)==null||e.close(),m("success")},b=()=>{m("close")};return v({open:(o="add")=>{var e;n.value=o,(e=d.value)==null||e.open()},setFormData:o=>{for(const e in u)o[e]!=null&&o[e]!=null&&(u[e]=o[e])}}),(o,e)=>{const r=w,s=x,V=R,i=k,C=y,D=g;return S(),T("div",G,[l(h,{ref_key:"popupRef",ref:d,title:z(B),async:!0,width:"550px",onConfirm:F,onClose:b},{default:a(()=>[l(D,{class:"ls-form",ref_key:"formRef",ref:p,rules:E,model:u,"label-width":"84px"},{default:a(()=>[l(s,{label:"\u5B57\u5178\u7C7B\u578B"},{default:a(()=>[l(r,{"model-value":u.type_value,placeholder:"\u8BF7\u8F93\u5165\u5B57\u5178\u7C7B\u578B",disabled:""},null,8,["model-value"])]),_:1}),l(s,{label:"\u6570\u636E\u540D\u79F0",prop:"name"},{default:a(()=>[l(r,{modelValue:u.name,"onUpdate:modelValue":e[0]||(e[0]=t=>u.name=t),placeholder:"\u8BF7\u8F93\u5165\u6570\u636E\u540D\u79F0",clearable:""},null,8,["modelValue"])]),_:1}),l(s,{label:"\u6570\u636E\u503C",prop:"value"},{default:a(()=>[l(r,{modelValue:u.value,"onUpdate:modelValue":e[1]||(e[1]=t=>u.value=t),placeholder:"\u8BF7\u8F93\u5165\u6570\u636E\u503C",clearable:""},null,8,["modelValue"])]),_:1}),l(s,{label:"\u6392\u5E8F",prop:"sort"},{default:a(()=>[c("div",null,[l(V,{modelValue:u.sort,"onUpdate:modelValue":e[2]||(e[2]=t=>u.sort=t),min:0,max:9999},null,8,["modelValue"]),L])]),_:1}),l(s,{label:"\u72B6\u6001",required:"",prop:"status"},{default:a(()=>[l(C,{modelValue:u.status,"onUpdate:modelValue":e[3]||(e[3]=t=>u.status=t)},{default:a(()=>[l(i,{label:1},{default:a(()=>[Q]),_:1}),l(i,{label:0},{default:a(()=>[$]),_:1})]),_:1},8,["modelValue"])]),_:1}),l(s,{label:"\u5907\u6CE8",prop:"remark"},{default:a(()=>[l(r,{modelValue:u.remark,"onUpdate:modelValue":e[4]||(e[4]=t=>u.remark=t),type:"textarea",autosize:{minRows:4,maxRows:6},clearable:"",maxlength:"200","show-word-limit":""},null,8,["modelValue"])]),_:1})]),_:1},8,["model"])]),_:1},8,["title"])])}}});export{X as _};
