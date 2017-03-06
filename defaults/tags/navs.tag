<navs>
	<ul class="nav {'justify-content-center': !isFalsy(opts.aligncenter), ' justify-content-end': !isFalsy(opts.alignright), 'flex-column': !isFalsy(opts.vertical), 'nav-tabs': !isFalsy(opts.tabs), 'nav-pills': !isFalsy(opts.pills), 'nav-fill': !isFalsy(opts.fill), 'nav-justified': !isFalsy(opts.justified)}">
		<li class="nav-item" each="{opts.options}">
			<a class="nav-link {active: location.pathname.match(link) }" href="{link}">{name}</a>
		</li>
	</ul>
	<script>
		this.isFalsy = (val)=>{
			if(!val){ return true }
			if(val == 'off'){ return true }
			if(val == 'false'){ return true }
			return false;
		}
	</script>
</navs>