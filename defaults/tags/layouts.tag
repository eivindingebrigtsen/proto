<app>
	<layout>
			
	</layout>
	<script>	
		const riot = require('riot');
		const request = require('superagent');
		this.on('mount', ()=>{
			console.log('Hello mount')
			let tag = location.pathname.split('/')[1] || 'home';
			this.goto(tag);
		})
		window.onpopstate = (e)=>{
			this.goto(location.pathname.split('/')[1]);
		}
		this.goto = (tag) =>{
			if(!location.pathname.match(tag)){
				history.pushState({active: tag}, tag, '/'+tag);
			}			
			console.log(tag, document.querySelector('#root'))
			document.querySelector('#root').innerHTML = '<'+tag+'></'+tag+'>';
			let page = riot.mount(document.querySelector('#root'), tag, {
				submit: this.submit,
				goto: this.goto
			});
			console.log(tag, document.querySelector('#root'))
		}
		let goTo = this.goto;
		this.submit = function(e){
			e.preventDefault();
			let href = e.target.getAttribute('href');
			console.log('SUBMIT', href, this.data);
			request.post('/store').send(this.data).end((err,res)=>{
				if(href){
					goTo(href);
				}
				console.log(err,res);
			});
		}
	</script>
</app>

<banner>
	<div class="background" style="background-image: url({opts.image})">
		<h1>{opts.title}</h1>
		<p if="{opts.intro}" class="intro">{opts.intro}</p>
		<a if="{opts.action}" onclick="{opts.action}">{opts.actionlabel}</a>
	</div>
</banner>