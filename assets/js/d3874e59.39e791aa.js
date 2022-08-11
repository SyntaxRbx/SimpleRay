"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[374],{3905:(e,n,t)=>{t.d(n,{Zo:()=>u,kt:()=>f});var r=t(67294);function a(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function o(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);n&&(r=r.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,r)}return t}function c(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?o(Object(t),!0).forEach((function(n){a(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function l(e,n){if(null==e)return{};var t,r,a=function(e,n){if(null==e)return{};var t,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||(a[t]=e[t]);return a}(e,n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(a[t]=e[t])}return a}var i=r.createContext({}),s=function(e){var n=r.useContext(i),t=n;return e&&(t="function"==typeof e?e(n):c(c({},n),e)),t},u=function(e){var n=s(e.components);return r.createElement(i.Provider,{value:n},e.children)},p={inlineCode:"code",wrapper:function(e){var n=e.children;return r.createElement(r.Fragment,{},n)}},m=r.forwardRef((function(e,n){var t=e.components,a=e.mdxType,o=e.originalType,i=e.parentName,u=l(e,["components","mdxType","originalType","parentName"]),m=s(t),f=a,y=m["".concat(i,".").concat(f)]||m[f]||p[f]||o;return t?r.createElement(y,c(c({ref:n},u),{},{components:t})):r.createElement(y,c({ref:n},u))}));function f(e,n){var t=arguments,a=n&&n.mdxType;if("string"==typeof e||a){var o=t.length,c=new Array(o);c[0]=m;var l={};for(var i in n)hasOwnProperty.call(n,i)&&(l[i]=n[i]);l.originalType=e,l.mdxType="string"==typeof e?e:a,c[1]=l;for(var s=2;s<o;s++)c[s]=t[s];return r.createElement.apply(null,c)}return r.createElement.apply(null,t)}m.displayName="MDXCreateElement"},4167:(e,n,t)=>{t.r(n),t.d(n,{HomepageFeatures:()=>y,default:()=>d});var r=t(87462),a=t(67294),o=t(3905);const c={toc:[{value:"Usage",id:"usage",level:2}]};function l(e){let{components:n,...t}=e;return(0,o.kt)("wrapper",(0,r.Z)({},c,t,{components:n,mdxType:"MDXLayout"}),(0,o.kt)("h2",{id:"usage"},"Usage"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-lua"},'local SimpleRay = require(game.ReplicatedStorage.SimpleRay)\n\nlocal origin = Vector3.new(0, 0, 0)\nlocal direction = Vector.new(0, 1, 0)\nlocal maxRayInstances = 2\n\nlocal result = SimpleRay.new({\n    Origin = origin,\n    Direction = direction,\n    Params = {\n        IgnoreWater = true,\n        Blacklist = {\n            workspace.Part2\n        }\n    },\n    MaxParts = maxRayInstances,\n    IgnoreCollideOffParts = true,\n    IgnoreTransparency = NumberRange.new(0.1, 1),\n    CustomFilter = function(inst: Instance)\n        return inst.Name ~= "Debug"\n    end,\n    Visualize = true\n}):GetResult()\n\nprint(result)\n--[[\n    Example Output:\n    {\n        Distance = 50,\n        Position = Vector3.new(12, 0, 37),\n        Normal = Vector3.new(0, 1, 0),\n        Instances = {\n            {\n                ["Instance"] = workspace.Part,\n                ["Material"] = Enum.Material.Plastic,\n                ["Normal"] = Vector3.new(0, 0, 1),\n                ["Position"] = Vector3.new(-2, 5, -17)\n            },\n            {\n                Instance = workspace.Baseplate,\n                Material = Enum.Material.Plastic,\n                Normal = Vector3.new(0, 1, 0),\n                Position = Vector3.new(12, 0, 37)\n            }\n        }\n    }\n]]\n')))}l.isMDXComponent=!0;var i=t(39960),s=t(52263),u=t(73576),p=t(86010);const m="heroBanner_e1Bh",f="buttons_VwD3";function y(){return null}function g(){const{siteConfig:e}=(0,s.Z)();return a.createElement("header",{className:(0,p.Z)("hero",m)},a.createElement("div",{className:"container"},a.createElement("h1",{className:"hero__title"},e.title),a.createElement("p",{className:"hero__subtitle"},e.tagline),a.createElement("div",{className:f},a.createElement(i.Z,{className:"button button--secondary button--lg",to:"/docs/intro"},"Get Started \u2192"))))}function d(){const{siteConfig:e,tagline:n}=(0,s.Z)();return a.createElement(u.Z,{title:e.title,description:n},a.createElement(g,null),a.createElement("main",null,a.createElement(y,null),a.createElement("div",{className:"container"},a.createElement(l,null))))}}}]);