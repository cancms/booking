import{X as Z,B as I,w as H,E as J,a as Y,a0 as ee,Q as ue,R as le,C as oe,$ as te,v as se,D as ae}from"./element-plus.4c84fed9.js";import{o as ne,p as de,b as ie,q as re,M as c,s as pe,t as ce}from"./index.9623039f.js";import{d as P,r as x,s as O,$ as W,e as z,w as me,n as R,j as Fe,o as r,c as B,U as l,L as o,u as p,K as f,V as L,a as t,a7 as S,P as _e,T as fe,Z as q,S as E,R as b}from"./@vue.e8706010.js";import{c as Ee}from"./@vueuse.1e5a6e21.js";import{a as ve,b as be,c as Ce,d as Ve}from"./menu.2f385011.js";import{P as Be}from"./index.ce9653e5.js";const he={class:"icon-select"},De={class:"flex justify-between"},ye=t("div",{class:"mb-3"},"\u8BF7\u9009\u62E9\u56FE\u6807",-1),Ae=["onClick"],ke={class:"h-[280px]"},ge={class:"flex flex-wrap"},Ue={key:0,class:"flex items-center"},we=E("\u65E0"),xe=P({__name:"picker",props:{modelValue:{default:""},disabled:{type:Boolean,default:!1}},emits:["update:modelValue","change"],setup(h,{emit:D}){const y=x(0),k=[{name:"element\u56FE\u6807",icons:ne()},{name:"\u672C\u5730\u56FE\u6807",icons:de()}],C=O(),s=W({inputValue:"",popoverVisible:!1,popoverWidth:0,mouseoverSelect:!1,inputFocus:!1}),T=()=>{s.inputFocus=s.popoverVisible=!0},U=()=>{s.inputFocus=!1,s.popoverVisible=s.mouseoverSelect},N=m=>{s.mouseoverSelect=s.popoverVisible=!1,D("update:modelValue",m),D("change",m)},u=()=>{D("update:modelValue",""),D("change","")},$=z(()=>{var _,V;const m=(V=(_=k[y.value])==null?void 0:_.icons)!=null?V:[];if(!s.inputValue)return m;const n=s.inputValue.toLowerCase();return m.filter(A=>{if(A.toLowerCase().indexOf(n)!==-1)return A})}),w=()=>{R(()=>{var n;const m=(n=C.value)==null?void 0:n.$el.offsetWidth;s.popoverWidth=m<300?300:m})};return Ee(document.body,"click",()=>{s.popoverVisible=!!(s.inputFocus||s.mouseoverSelect)}),me(()=>s.popoverVisible,async m=>{var n,_;await R(),m?(n=C.value)==null||n.focus():(_=C.value)==null||_.blur()}),Fe(()=>{w()}),(m,n)=>{const _=ie,V=H,A=J,M=Y,d=Z;return r(),B("div",he,[l(d,{trigger:"contextmenu",visible:s.popoverVisible,"onUpdate:visible":n[3]||(n[3]=e=>s.popoverVisible=e),width:s.popoverWidth},{reference:o(()=>[l(p(I),{ref_key:"inputRef",ref:C,modelValue:s.inputValue,"onUpdate:modelValue":n[2]||(n[2]=e=>s.inputValue=e),modelModifiers:{trim:!0},placeholder:"\u641C\u7D22\u56FE\u6807",autofocus:!1,disabled:h.disabled,onFocus:T,onBlur:U,clearable:""},{prepend:o(()=>[h.modelValue?(r(),B("div",Ue,[l(M,{class:"flex-1 w-20",content:h.modelValue,placement:"top"},{default:o(()=>[(r(),f(_,{class:"mr-1",key:h.modelValue,name:h.modelValue,size:16},null,8,["name"]))]),_:1},8,["content"])])):(r(),B(L,{key:1},[we],64))]),append:o(()=>[l(V,null,{default:o(()=>[l(_,{name:"el-icon-Close",size:18,onClick:u})]),_:1})]),_:1},8,["modelValue","disabled"])]),default:o(()=>[t("div",{onMouseover:n[0]||(n[0]=q(e=>s.mouseoverSelect=!0,["stop"])),onMouseout:n[1]||(n[1]=q(e=>s.mouseoverSelect=!1,["stop"]))},[t("div",null,[t("div",De,[ye,t("div",null,[(r(),B(L,null,S(k,(e,i)=>t("span",{key:i,class:_e(["cursor-pointer text-sm ml-2",{"text-primary":i==y.value}]),onClick:v=>y.value=i},fe(e.name),11,Ae)),64))])]),t("div",ke,[l(A,null,{default:o(()=>[t("div",ge,[(r(!0),B(L,null,S(p($),e=>(r(),B("div",{key:e,class:"m-1"},[l(V,{onClick:i=>N(e)},{default:o(()=>[l(_,{name:e,size:18},null,8,["name"])]),_:2},1032,["onClick"])]))),128))])]),_:1})])])],32)]),_:1},8,["visible","width"])])}}}),Te={class:"edit-popup"},Ne=E("\u76EE\u5F55"),$e=E("\u83DC\u5355"),Me=E("\u6309\u94AE"),Le={class:"flex-1"},Oe=t("div",{class:"form-tips"}," \u8BBF\u95EE\u7684\u8DEF\u7531\u5730\u5740\uFF0C\u5982\uFF1A`user`\uFF0C\u5982\u5916\u7F51\u5730\u5740\u9700\u5185\u94FE\u8BBF\u95EE\u5219\u4EE5`http(s)://`\u5F00\u5934 ",-1),Re={class:"flex-1"},Se=t("div",{class:"form-tips"}," \u8BBF\u95EE\u7684\u7EC4\u4EF6\u8DEF\u5F84\uFF0C\u5982\uFF1A`user/setting`\uFF0C\u9ED8\u8BA4\u5728`views`\u76EE\u5F55\u4E0B ",-1),qe={class:"flex-1"},Ie=t("div",{class:"form-tips"}," \u8BBF\u95EE\u8BE6\u60C5\u9875\u9762\uFF0C\u7F16\u8F91\u9875\u9762\u65F6\uFF0C\u83DC\u5355\u9AD8\u4EAE\u663E\u793A\uFF0C\u5982`/consumer/lists` ",-1),Pe={class:"flex-1"},We=t("div",{class:"form-tips"}," \u5C06\u4F5C\u4E3Aserver\u7AEFAPI\u9A8C\u6743\u4F7F\u7528\uFF0C\u5982`auth.admin/user`\uFF0C\u8BF7\u8C28\u614E\u4FEE\u6539 ",-1),ze={class:"flex-1"},Ge=t("div",{class:"form-tips"},' \u8BBF\u95EE\u8DEF\u7531\u7684\u9ED8\u8BA4\u4F20\u9012\u53C2\u6570\uFF0C\u5982\uFF1A`{"id": 1, "name": "admin"}`\u6216`id=1&name=admin` ',-1),je=E("\u7F13\u5B58"),Ke=E("\u4E0D\u7F13\u5B58"),Qe=t("div",{class:"form-tips"},"\u9009\u62E9\u7F13\u5B58\u5219\u4F1A\u88AB`keep-alive`\u7F13\u5B58",-1),Xe=E("\u663E\u793A"),Ze=E("\u9690\u85CF"),He=t("div",{class:"form-tips"}," \u9009\u62E9\u9690\u85CF\u5219\u8DEF\u7531\u5C06\u4E0D\u4F1A\u51FA\u73B0\u5728\u4FA7\u8FB9\u680F\uFF0C\u4F46\u4ECD\u7136\u53EF\u4EE5\u8BBF\u95EE ",-1),Je=E("\u6B63\u5E38"),Ye=E("\u505C\u7528"),eu=t("div",{class:"form-tips"},"\u9009\u62E9\u505C\u7528\u5219\u8DEF\u7531\u5C06\u4E0D\u4F1A\u51FA\u73B0\u5728\u4FA7\u8FB9\u680F\uFF0C\u4E5F\u4E0D\u80FD\u88AB\u8BBF\u95EE",-1),uu=t("div",{class:"form-tips"},"\u6570\u503C\u8D8A\u5927\u8D8A\u6392\u524D",-1),du=P({__name:"edit",emits:["success","close"],setup(h,{expose:D,emit:y}){const k=O(),C=O(),s=x("add"),T=z(()=>s.value=="edit"?"\u7F16\u8F91\u83DC\u5355":"\u65B0\u589E\u83DC\u5355"),U=x(re()),N=(d,e)=>{const i=d?U.value.filter(v=>v.toLowerCase().includes(d.toLowerCase())):U.value;e(i.map(v=>({value:v})))},u=W({id:"",pid:0,type:c.CATALOGUE,icon:"",name:"",sort:0,paths:"",perms:"",component:"",selected:"",params:"",is_cache:0,is_show:1,is_disable:0}),$={pid:[{required:!0,message:"\u8BF7\u9009\u62E9\u7236\u7EA7\u83DC\u5355",trigger:["blur","change"]}],name:[{required:!0,message:"\u8BF7\u8F93\u5165\u83DC\u5355\u540D\u79F0",trigger:"blur"}],paths:[{required:!0,message:"\u8BF7\u8F93\u5165\u8DEF\u7531\u5730\u5740",trigger:"blur"}],component:[{required:!0,message:"\u8BF7\u8F93\u5165\u7EC4\u4EF6\u5730\u5740",trigger:"blur"}]},w=x([]),m=async()=>{const d=await ve({page_type:0}),e={id:0,name:"\u9876\u7EA7",children:[]};e.children=pe(ce(d.lists).filter(i=>i.type!=c.BUTTON)),w.value.push(e)},n=async()=>{var d,e;await((d=k.value)==null?void 0:d.validate()),s.value=="edit"?await be(u):await Ce(u),(e=C.value)==null||e.close(),y("success")},_=(d="add")=>{var e;s.value=d,(e=C.value)==null||e.open()},V=d=>{for(const e in u)d[e]!=null&&d[e]!=null&&(u[e]=d[e])},A=async d=>{const e=await Ve({id:d.id});V(e)},M=()=>{y("close")};return m(),D({open:_,setFormData:V,getDetail:A}),(d,e)=>{const i=ue,v=le,F=oe,G=te,g=I,j=xe,K=ee,Q=se,X=ae;return r(),B("div",Te,[l(Be,{ref_key:"popupRef",ref:C,title:p(T),async:!0,width:"550px",onConfirm:n,onClose:M},{default:o(()=>[l(X,{ref_key:"formRef",ref:k,model:u,"label-width":"80px",rules:$},{default:o(()=>[l(F,{label:"\u83DC\u5355\u7C7B\u578B",prop:"type",required:""},{default:o(()=>[l(v,{modelValue:u.type,"onUpdate:modelValue":e[0]||(e[0]=a=>u.type=a)},{default:o(()=>[l(i,{label:p(c).CATALOGUE},{default:o(()=>[Ne]),_:1},8,["label"]),l(i,{label:p(c).MENU},{default:o(()=>[$e]),_:1},8,["label"]),l(i,{label:p(c).BUTTON},{default:o(()=>[Me]),_:1},8,["label"])]),_:1},8,["modelValue"])]),_:1}),l(F,{label:"\u7236\u7EA7\u83DC\u5355",prop:"pid"},{default:o(()=>[l(G,{class:"flex-1",modelValue:u.pid,"onUpdate:modelValue":e[1]||(e[1]=a=>u.pid=a),data:w.value,clearable:"","node-key":"id",props:{label:"name"},"default-expand-all":!0,placeholder:"\u8BF7\u9009\u62E9\u7236\u7EA7\u83DC\u5355","check-strictly":""},null,8,["modelValue","data"])]),_:1}),l(F,{label:"\u83DC\u5355\u540D\u79F0",prop:"name"},{default:o(()=>[l(g,{modelValue:u.name,"onUpdate:modelValue":e[2]||(e[2]=a=>u.name=a),placeholder:"\u8BF7\u8F93\u5165\u83DC\u5355\u540D\u79F0",clearable:""},null,8,["modelValue"])]),_:1}),u.type!=p(c).BUTTON?(r(),f(F,{key:0,label:"\u83DC\u5355\u56FE\u6807",prop:"icon"},{default:o(()=>[l(j,{class:"flex-1",modelValue:u.icon,"onUpdate:modelValue":e[3]||(e[3]=a=>u.icon=a)},null,8,["modelValue"])]),_:1})):b("",!0),u.type!=p(c).BUTTON?(r(),f(F,{key:1,label:"\u8DEF\u7531\u8DEF\u5F84",prop:"paths"},{default:o(()=>[t("div",Le,[l(g,{modelValue:u.paths,"onUpdate:modelValue":e[4]||(e[4]=a=>u.paths=a),placeholder:"\u8BF7\u8F93\u5165\u8DEF\u7531\u8DEF\u5F84",clearable:""},null,8,["modelValue"]),Oe])]),_:1})):b("",!0),u.type==p(c).MENU?(r(),f(F,{key:2,label:"\u7EC4\u4EF6\u8DEF\u5F84",prop:"component"},{default:o(()=>[t("div",Re,[l(K,{class:"w-full",modelValue:u.component,"onUpdate:modelValue":e[5]||(e[5]=a=>u.component=a),"fetch-suggestions":N,clearable:"",placeholder:"\u8BF7\u8F93\u5165\u7EC4\u4EF6\u8DEF\u5F84"},null,8,["modelValue"]),Se])]),_:1})):b("",!0),u.type==p(c).MENU?(r(),f(F,{key:3,label:"\u9009\u4E2D\u83DC\u5355",prop:"selected"},{default:o(()=>[t("div",qe,[l(g,{modelValue:u.selected,"onUpdate:modelValue":e[6]||(e[6]=a=>u.selected=a),placeholder:"\u8BF7\u8F93\u5165\u8DEF\u7531\u8DEF\u5F84",clearable:""},null,8,["modelValue"]),Ie])]),_:1})):b("",!0),u.type!=p(c).CATALOGUE?(r(),f(F,{key:4,label:"\u6743\u9650\u5B57\u7B26",prop:"perms"},{default:o(()=>[t("div",Pe,[l(g,{modelValue:u.perms,"onUpdate:modelValue":e[7]||(e[7]=a=>u.perms=a),placeholder:"\u8BF7\u8F93\u5165\u6743\u9650\u5B57\u7B26",clearable:""},null,8,["modelValue"]),We])]),_:1})):b("",!0),u.type==p(c).MENU?(r(),f(F,{key:5,label:"\u8DEF\u7531\u53C2\u6570",prop:"params"},{default:o(()=>[t("div",null,[t("div",ze,[l(g,{modelValue:u.params,"onUpdate:modelValue":e[8]||(e[8]=a=>u.params=a),placeholder:"\u8BF7\u8F93\u5165\u8DEF\u7531\u53C2\u6570",clearable:""},null,8,["modelValue"])]),Ge])]),_:1})):b("",!0),u.type==p(c).MENU?(r(),f(F,{key:6,label:"\u662F\u5426\u7F13\u5B58",prop:"is_cache",required:""},{default:o(()=>[t("div",null,[l(v,{modelValue:u.is_cache,"onUpdate:modelValue":e[9]||(e[9]=a=>u.is_cache=a)},{default:o(()=>[l(i,{label:1},{default:o(()=>[je]),_:1}),l(i,{label:0},{default:o(()=>[Ke]),_:1})]),_:1},8,["modelValue"]),Qe])]),_:1})):b("",!0),u.type!=p(c).BUTTON?(r(),f(F,{key:7,label:"\u662F\u5426\u663E\u793A",prop:"is_show",required:""},{default:o(()=>[t("div",null,[l(v,{modelValue:u.is_show,"onUpdate:modelValue":e[10]||(e[10]=a=>u.is_show=a)},{default:o(()=>[l(i,{label:1},{default:o(()=>[Xe]),_:1}),l(i,{label:0},{default:o(()=>[Ze]),_:1})]),_:1},8,["modelValue"]),He])]),_:1})):b("",!0),u.type!=p(c).BUTTON?(r(),f(F,{key:8,label:"\u83DC\u5355\u72B6\u6001",prop:"is_disable",required:""},{default:o(()=>[t("div",null,[l(v,{modelValue:u.is_disable,"onUpdate:modelValue":e[11]||(e[11]=a=>u.is_disable=a)},{default:o(()=>[l(i,{label:0},{default:o(()=>[Je]),_:1}),l(i,{label:1},{default:o(()=>[Ye]),_:1})]),_:1},8,["modelValue"]),eu])]),_:1})):b("",!0),l(F,{label:"\u83DC\u5355\u6392\u5E8F",prop:"sort"},{default:o(()=>[t("div",null,[l(Q,{modelValue:u.sort,"onUpdate:modelValue":e[12]||(e[12]=a=>u.sort=a),min:0,max:9999},null,8,["modelValue"]),uu])]),_:1})]),_:1},8,["model"])]),_:1},8,["title"])])}}});export{du as _};
