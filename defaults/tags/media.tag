<youtube>
	<div class="video">
		<div id="{opts.name}"></div>		
		<script>
			this.on('mount', ()=>{
				setTimeout(()=>{
				  var player;
				  player = new YT.Player(this.opts.name, {
				    videoId: this.opts.video, 
				    width: this.opts.width || 320,               
				    height: this.opts.height || 220,              
				    playerVars: {
				      autoplay: this.opts.autoplay == 'off' ? 0 : 1,
				      controls: this.opts.controls == 'off' ? 0 : 1,        
				      showinfo: this.opts.controls == 'on' ? 1 : 0,        
				      modestbranding: this.opts.modestbranding == 'off' ? 0 : 1,  
				      loop: this.opts.loop == 'off' ? 0 : 1,
				      fs: 0,              
				      cc_load_policy: 0, 
				      iv_load_policy: 3,  
				      autohide: 0,
				      playlist: this.opts.next || this.opts.video
				    },
				    events: {
				      onReady: function(e) {
				        e.target.mute();
				      }
				    }
				  });
				},100)

			})

		</script>
	</div>
</youtube>
