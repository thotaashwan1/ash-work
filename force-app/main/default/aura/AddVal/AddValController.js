({
	add : function(component) {
        var addval = component.get("v.num1")
        		+ component.get("v.num2");
        component.set("v.sum",addval)
		
	}
})