require('dotenv').config();

const express = require('express');
const app = express();
const fs = require('fs');
const path = require('path');
const debug = require('debug')('proto');
const request = require('superagent');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const _ = require('lodash');
const crypto = require('crypto');
const hash = () => {
	return crypto.createHmac('sha256', 'qwe87123dasa').update('I love hotcakes' + (new Date().valueOf())).digest('hex');
}
app.use(express.static('www'));
app.use(cookieParser());
app.use(bodyParser.json());
app.use((req,res,next)=>{
	let h = req.cookies._proto_;
	if(!h){
		h = hash();
		res.cookie('_proto_', h, {httpOnly: true});
	}
	debug('REQUEST', h, req.method, req.url, req.headers, req.body);
	next();
});

app.get('/ok', (req,res)=>{
	res.send({
		ok: true,
		timestamp: new Date().valueOf()
	})
})

app.post('/store', (req,res)=>{
	let id = req.cookies._proto_;
	console.log(id, JSON.stringify(req.body, null, 2));
	res.send({ok: true})
});


app.get(/.*?$/, (req,res,next)=>{
	res.sendFile(path.join(__dirname, '../www/index.html'));
});

app.listen(process.env.PORT || 3000);