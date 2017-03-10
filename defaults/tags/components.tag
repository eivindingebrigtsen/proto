<alert>
	<div class="alert {alert-success: opts.type == 'success', alert-info: opts.type == 'info', alert-warning: opts.type == 'warning', alert-danger: opts.type == 'danger', }" role="alert">
		<yield></yield>
	</div>
</alert>

<badge>
	<span class="badge {badge-default: !opts.type,  badge-primary: opts.type == 'primary', badge-success: opts.type == 'success', badge-info: opts.type == 'info', badge-warning: opts.type == 'warning', badge-danger: opts.type == 'danger', badge-pills: opts.pills}">
		<yield></yield>
	</span>
</badge>
<carousel>
	<div class="carousel slide" data-ride="carousel" id="carousel-{(opts.slides||[]).length}">
		<ol class="carousel-indicators" if="{opts.indicators}">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">

			<div class="carousel-item active">
				<img class="d-block img-fluid" src="..." alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="..." alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="..." alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>

	</div>
</carousel>