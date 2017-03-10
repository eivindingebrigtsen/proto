<landingsside>
	<style scoped>
		.container{
			margin-top: 80px;
		}
	</style>
	<div class="container">

				<h1>Dette er en landingsside</h1>
				<formfield type="text" label="Ditt navn" formid="name"></formfield>
				<formfield type="email" label="Din epostaddresse" formid="email"></formfield>
				<p><button href="tusen-takk" onclick="{submit}" class="btn btn-lg btn-primary">Send inn</button></p>
	<script>
		this.submit = this.opts.submit;
	</script>
</landingsside>

<tusen-takk>
	<style scoped>
		.container{
			margin-top: 80px;
		}
	</style>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Tusen takk!</h1>
			</div>
		</div>
	</div>	
</tusen-takk>
