({
      fetchListOfRecordTypes: function(component, event, helper) {
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            var arraylst =  response.getReturnValue();
            component.set("v.lstOfRecordType", response.getReturnValue());
            if(arraylst.length == 1)
            {         
                component.set("v.DefaultRecordTypeName",arraylst[0]);
              //  helper.createAccountRecord(component, event, helper);            
            }   
            else
            {
                component.set("v.isOpen", true);  
                component.set("isNotDefault",true);
                alert('++++'+component.find(arraylst[0]));
                component.find(arraylst[0]).set("v.value", true);            
            }           
        });
        $A.enqueueAction(action);
    },
	 onGroup: function(component, event, helper) {
        var selected = event.getSource().get("v.text");
        alert(selected);
    },
    closeModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpen", false);
        helper.RedirectToTab(component, event, helper);
    },
    openModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpen", true);
    }
})