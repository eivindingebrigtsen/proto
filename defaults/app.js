const riot = require("riot");

require('../node_modules/bootstrap/scss/bootstrap.scss');
require('../prototype/main.less');
// DEFAULTS FROM FRAMEWORK
var context = require.context('./tags', true, /\.(tag)$/);
var files={};

context.keys().forEach((filename)=>{
  console.log(filename);
  files[filename] = context(filename);
});

context = require.context('./less', true, /\.(less)$/);
files={};
context.keys().forEach((filename)=>{
  console.log(filename);
  files[filename] = context(filename);
});


// TAGS ADDED BY USER
context = require.context('../prototype', true, /\.(tag)$/);
files={};
context.keys().forEach((filename)=>{
  console.log(filename);
  files[filename] = context(filename);
});



setTimeout(()=>{
	console.log('HELLO INIT')
	riot.mount('*');
},1)

if('serviceWorker' in navigator) {
	navigator.serviceWorker.register('/proto-service-worker.js');
}