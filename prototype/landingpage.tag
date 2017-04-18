<redd-barna-timeline>
	<style>
		.wrap{
			position: relative;
		}
		.first-screen{
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			z-index: 2;
			background-color: red;
			color: white;
			text-align: center;
			opacity: 1;
			transition: all ease-in 3s;
		}
		.first-screen.fade{
			opacity: 0;
		}
		.first-screen button{
			position: absolute;
			bottom: 20px;
		}
	</style>
	<div class="wrap">		
		<div class="first-screen">
			<button onclick="{revealTimeline}">Slå på</button>
		</div>
		<timeline></timeline>
		<content>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
			<div class="seperator">&nbsp;</div>
			<h1>Hallo</h1>
			<p>lorem ipsum sit dolor amet</p>
			<img src="https://www.reddbarna.no/nyheter/vet-ikke-om-barna-lever-neste-morgen?pid=RB-BaseContentRB-IngressImage&r_n_d=313663_&adjust=1&x=718&y=444&xm=359&ym=222&from=0">
		</content>
	</div>
	<script>
		this.revealTimeline = (e) =>{
			console.log(e);
			e.target.parentElement.classList.add('fade');
		}
	</script>
</redd-barna-timeline>
<content>
	<style scoped>
		div{		
			margin: 50px;
			text-align: center;
		}
		.seperator{
			margin: 150px 0;

		}
	</style>
	<div>
		<yield/>
	</div>
</content>
<timeline>
	<style scoped>
		ul{
			position: fixed;
			top: 0;
			bottom: 0;
			left: 5px;
			list-style: none;
			padding: 0;
			border-left: 2px dotted black;
		}
		li{
			font-size: 9px;
			padding: 0;
			padding-left: 10px;
			border-top: 1px solid black;
		}
		.indicator{
			border-top: 1px solid black;
			width: 100%;
			position: fixed;

		}
	</style>
	<ul>
		<li each="{x, y in points}" style="height: {Math.round(window.innerHeight/(parent.points.length+1))}px">{x}hz</li>
	</ul>	
	<div class="indicator" style="top: {viewHeight - ((viewHeight / totalHeight) * (window.scrollY))}px"></div>
	<script>
		this.points = [110,190,260,480, 1100,16000,2400,3800,5500]
		this.on('mount', ()=>{
			this.totalHeight = document.body.offsetHeight;
			this.viewHeight = window.innerHeight;
			
			window.addEventListener('scroll', ()=>{
				this.update();
			});
		});
	</script>
</timeline>