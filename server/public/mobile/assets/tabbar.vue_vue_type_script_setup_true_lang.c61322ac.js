import{o as t,c as e,w as o,l as a,t as i,s,v as l,h as n,k as r,x as u,y as c,r as d,a as f,b as h,e as p,F as b,f as m,z as g,A as y,d as _,B as C,u as S,C as v,D as B,g as w}from"./index.11096ec6.js";import{_ as x}from"./u-icon.5ed808e6.js";import{_ as k}from"./_plugin-vue_export-helper.cdc0426e.js";import{n as T}from"./util.9e38efcf.js";const z=k({name:"u-badge",props:{type:{type:String,default:"error"},size:{type:String,default:"default"},isDot:{type:Boolean,default:!1},count:{type:[Number,String]},overflowCount:{type:Number,default:99},showZero:{type:Boolean,default:!1},offset:{type:Array,default:()=>[20,20]},absolute:{type:Boolean,default:!0},fontSize:{type:[String,Number],default:"24"},color:{type:String,default:"#ffffff"},bgColor:{type:String,default:""},isCenter:{type:Boolean,default:!1}},computed:{boxStyle(){let t={};return this.isCenter?(t.top=0,t.right=0,t.transform="translateY(-50%) translateX(50%)"):(t.top=this.offset[0]+"rpx",t.right=this.offset[1]+"rpx",t.transform="translateY(0) translateX(0)"),"mini"==this.size&&(t.transform=t.transform+" scale(0.8)"),t},showText(){return this.isDot?"":this.count>this.overflowCount?`${this.overflowCount}+`:this.count},show(){return 0!=this.count||0!=this.showZero}}},[["render",function(u,c,d,f,h,p){const b=r;return p.show?(t(),e(b,{key:0,class:s(["u-badge",[d.isDot?"u-badge-dot":"","mini"==d.size?"u-badge-mini":"",d.type?"u-badge--bg--"+d.type:""]]),style:l([{top:d.offset[0]+"rpx",right:d.offset[1]+"rpx",fontSize:d.fontSize+"rpx",position:d.absolute?"absolute":"static",color:d.color,backgroundColor:d.bgColor},p.boxStyle])},{default:o((()=>[a(i(p.showText),1)])),_:1},8,["class","style"])):n("v-if",!0)}],["__scopeId","data-v-c7706cca"]]);const P=k({emits:["update:modelValue","input","change"],props:{value:{type:[String,Number],default:0},modelValue:{type:[String,Number],default:0},show:{type:Boolean,default:!0},bgColor:{type:String,default:"#ffffff"},height:{type:[String,Number],default:100},iconSize:{type:[String,Number],default:40},midButtonSize:{type:[String,Number],default:90},activeColor:{type:String,default:"#303133"},inactiveColor:{type:String,default:"#606266"},midButton:{type:Boolean,default:!1},list:{type:Array,default:()=>[]},beforeSwitch:{type:Function,default:null},borderTop:{type:Boolean,default:!0},hideTabBar:{type:Boolean,default:!0}},data:()=>({midButtonLeft:"50%",pageUrl:""}),created(){this.hideTabBar&&u();let t=c();this.pageUrl=t[t.length-1].route},computed:{valueCom(){return this.modelValue},elIconPath(){return t=>{let e=this.list[t].pagePath;return e?e==this.pageUrl||e=="/"+this.pageUrl?this.list[t].selectedIconPath:this.list[t].iconPath:t==this.valueCom?this.list[t].selectedIconPath:this.list[t].iconPath}},elColor(){return t=>{let e=this.list[t].pagePath;return e?e==this.pageUrl||e=="/"+this.pageUrl?this.activeColor:this.inactiveColor:t==this.valueCom?this.activeColor:this.inactiveColor}}},mounted(){this.midButton&&this.getMidButtonLeft()},methods:{async clickHandler(t){if(this.beforeSwitch&&"function"==typeof this.beforeSwitch){let e=this.beforeSwitch.bind(this.$u.$parent.call(this))(t);e&&"function"==typeof e.then?await e.then((e=>{this.switchTab(t)})).catch((t=>{})):!0===e&&this.switchTab(t)}else this.switchTab(t)},switchTab(t){let e=this.list[t].pagePath;if(e){if(e==this.pageUrl||e=="/"+this.pageUrl)return;this.$emit("change",t)}else this.$emit("change",t),this.$emit("input",t),this.$emit("update:modelValue",t)},getOffsetRight:(t,e)=>e?-20:t>9?-40:-30,getMidButtonLeft(){let t=this.$u.sys().windowWidth;this.midButtonLeft=t/2+"px"}}},[["render",function(u,c,_,C,S,v){const B=d(f("u-icon"),x),w=d(f("u-badge"),z),k=r,T=y;return _.show?(t(),e(k,{key:0,class:"u-tabbar",onTouchmove:c[0]||(c[0]=g((()=>{}),["stop","prevent"]))},{default:o((()=>[h(k,{class:s(["u-tabbar__content safe-area-inset-bottom",{"u-border-top":_.borderTop}]),style:l({height:u.$u.addUnit(_.height),backgroundColor:_.bgColor})},{default:o((()=>[(t(!0),p(b,null,m(_.list,((r,u)=>(t(),e(k,{class:s(["u-tabbar__content__item",{"u-tabbar__content__circle":_.midButton&&r.midButton}]),key:u,onClick:g((t=>v.clickHandler(u)),["stop"]),style:l({backgroundColor:_.bgColor})},{default:o((()=>[h(k,{class:s([_.midButton&&r.midButton?"u-tabbar__content__circle__button":"u-tabbar__content__item__button"])},{default:o((()=>[h(B,{size:_.midButton&&r.midButton?_.midButtonSize:_.iconSize,name:v.elIconPath(u),"img-mode":"scaleToFill",color:v.elColor(u),"custom-prefix":r.customIcon?"custom-icon":"uicon"},null,8,["size","name","color","custom-prefix"]),r.count?(t(),e(w,{key:0,count:r.count,"is-dot":r.isDot,offset:[-2,v.getOffsetRight(r.count,r.isDot)]},null,8,["count","is-dot","offset"])):n("v-if",!0)])),_:2},1032,["class"]),h(k,{class:"u-tabbar__content__item__text",style:l({color:v.elColor(u)})},{default:o((()=>[h(T,{class:"u-line-1"},{default:o((()=>[a(i(r.text),1)])),_:2},1024)])),_:2},1032,["style"])])),_:2},1032,["class","onClick","style"])))),128)),_.midButton?(t(),e(k,{key:0,class:s(["u-tabbar__content__circle__border",{"u-border":_.borderTop}]),style:l({backgroundColor:_.bgColor,left:S.midButtonLeft})},null,8,["class","style"])):n("v-if",!0)])),_:1},8,["style","class"]),n(" 这里加上一个48rpx的高度,是为了增高有凸起按钮时的防塌陷高度(也即按钮凸出来部分的高度) "),h(k,{class:"u-fixed-placeholder safe-area-inset-bottom",style:l({height:`calc(${u.$u.addUnit(_.height)} + ${_.midButton?48:0}rpx)`})},null,8,["style"])])),_:1})):n("v-if",!0)}],["__scopeId","data-v-d0031f76"]]),$=_({__name:"tabbar",setup(o){const a=C(),i=S(),s=v((()=>i.getTabbarConfig.map((t=>({iconPath:t.unselected,selectedIconPath:t.selected,text:t.name,link:t.link,pagePath:t.link.path}))))),l=v((()=>({activeColor:i.getStyleConfig.selected_color,inactiveColor:i.getStyleConfig.default_color}))),n=t=>{const e=s.value[t];T(e.link,"reLaunch")};return(o,i)=>{const r=d(f("u-tabbar"),P);return t(),e(r,B({modelValue:a.value,"onUpdate:modelValue":i[0]||(i[0]=t=>a.value=t)},w(l),{list:w(s),onChange:n,"hide-tab-bar":!1}),null,16,["modelValue","list"])}}});export{$ as _,z as a};