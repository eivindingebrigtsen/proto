<layout>
	<!-- Add Header -->
	<!-- Add Navigation -->
	<navs options={pages} alignright="true" ></navs>
	<!-- This is where the tag is mounted -->
	<div id="body-content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 push-md-4">
					<div id="root"></div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<p class="text-center"><small>Copyright © 2017 ACME inc</small></p>
	</footer>
	<!-- Add Footer -->
	<script>
		this.pages = [{
			link: '/home',
			name: 'Hjem'
		},{
			link: '/sannheten-om-fett-og-forbrenning',
			name: 'Magasin'
		},{
			link: '/landingsside',
			name: 'Produkt'
		},{
			link: '/kontakt-oss',
			name: 'Kontakt oss'
		}]
	</script>
</layout>