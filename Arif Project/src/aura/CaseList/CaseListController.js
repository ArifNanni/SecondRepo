({
	doInit : function(component, event) {
        var action = component.get("c.getAll");
        action.setCallback(this, function(a) {
            component.set("v.cases", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    tester: function(component, event, helper) {
        var el = (event.target.correspondingUseElement)?event.target.correspondingUseElement:event.target;



       
       alert(el.getAttribute("title"));
                  //here is your ID
}
    
    
})