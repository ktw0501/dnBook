	function isEmpty(obj, msg) {
		obj.value = obj.value.trim();
		if(obj.value == ""){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	}