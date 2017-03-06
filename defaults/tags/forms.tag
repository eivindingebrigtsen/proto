<formfield>
	
	<div class="form-group {has-success:isValid}" if="{opts.type != 'select' && opts.type != 'textarea' }">
		<label for="{opts.formid}">{opts.label} <small if="{opts.optional}">(valgfri)</small></label>
		<input type="{opts.type || 'text'}" class="form-control {form-control-success: isValid, form-control-warning: !isValid}" id="{opts.formid}" aria-describedby="{opts.formid}-help" placeholder="{opts.placeholder}" onchange={pushDataToParent} onkeyup="{validateInput(opts.type)}" onblur="{validateInput(opts.formid)}" />
		<small if="{opts.helptext}" id="{opts.formid}-help" class="form-text text-muted">{opts.helptext}</small>
	</div>

	<div class="form-group {has-success:isValid}" if="{opts.type == 'select'}">
		<label for="{opts.formid}">{opts.label}</label>
		<select id="{opts.formid}" class="form-control {form-control-success: isValid, form-control-warning: !isValid}" aria-describedby="{opts.formid}-help" onchange={pushDataToParent} value="{opts.value}" onblur="{validateSelect}">
			<option value="" disabled="" selected="">Vennligst velg…</option>
			<option each="{opts.options}" value="{id}">{name}</option>
		</select>
	</div>
	<div class="form-group" if="{opts.type == 'file'}">
		<label class="custom-file" for="file-{opts.formid}">
	  		<input type="file" id="file-{opts.formid}" class="custom-file-input">
	  		<span class="custom-file-control"></span>
		</label>
	</div>
	<div class="form-group" if="{opts.type == 'textarea'}">
		<label for="{opts.formid}">{opts.label}</label>
		<textarea id="{opts.formid}" class="form-control {form-control-success: isValid, form-control-warning: !isValid}" aria-describedby="{opts.formid}-help" onchange={pushDataToParent}>
		</textarea>
	</div>
		<script>
		let validations = {
			'text' : (v)=>{
				// more than 3 characters
				return v.replace(/\s/g,'').length >= 3
			},
			'phone': (v) => { 
				// searching for 8 digits
				return v.match(/\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*/g,'') 
			},
			'email': (v) => { 
				// searching something @ place . tld
				return v.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/) 
			},
			'orgid': (v) => { 
				// searching 
				return v.match(/\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*\d\s*/g,'')
			}
			// ADD MORE AS WE NEED
		}

		this.validateSelect = (e)=>{
			this.isValid = true;
		}
		this.validateInput = (type, optional)=>{
			return (e)=>{
				let value = e.target.value;
				if(type && validations[type] && validations[type](value)){
					this.isValid = true;
				}else if(!validations[type] && validations['text'](value)){
					this.isValid = true;
				}else{
					this.isValid = false;
				} 
			}
		}
		this.pushDataToParent = (e)=>{
			if(!this.parent.data){
				this.parent.data = {};
			}
			console.log(this.parent.data);
			this.parent.data[e.target.id||e.target.name] = e.target.value;
			this.parent.submit(e);
		}
		</script>
</formfield>
