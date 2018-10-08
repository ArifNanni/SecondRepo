({
	 RedirectToTab : function(component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/500/o"
        });
        urlEvent.fire();
    }    
})