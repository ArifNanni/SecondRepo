({
    fetchListOfRecordTypes: function(component, event, helper) {
        var action = component.get("c.fetchRecordTypeValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var arraylst =  response.getReturnValue();
                component.set("v.WrapOfRecordType", response.getReturnValue());
                if(arraylst.length > 0)
                {    
                    component.set("v.DefaultRecordTypeName",arraylst[0].LabelName);
                    if(arraylst.length == 1)
                    {         
                        helper.createAccountRecord(component, event, helper);            
                    }   
                    else
                    {
                        component.set("v.isOpen", true);     
                    }  
                }    
            } 
            else if (state == "INCOMPLETE") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();                   
            } else if (state == "ERROR") {
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            } 
        });
        $A.enqueueAction(action);
    },
    /* In this "createRecord" function, first we have call apex class method 
    * and pass the selected RecordType values[label] and this "getRecTypeId"
    * apex method return the selected recordType ID.
    * When RecordType ID comes, we have call  "e.force:createRecord"
    * event and pass object API Name and 
    * set the record type ID in recordTypeId parameter. and fire this event
    * if response state is not equal = "SUCCESS" then display message on various situations.
    */
    createRecord: function(component, event, helper) {
        helper.createAccountRecord(component, event, helper);
    },
    onGroup: function(component, event, helper) {
        var selected = event.getSource().get("v.text");
        component.set("v.DefaultRecordTypeName",selected);
    },
    openModal: function(component, event, helper) {
        // set "isOpen" attribute to true to show model box
        component.set("v.isOpen", true);
    },
    closeModal: function(component, event, helper) {
        // set "isOpen" attribute to false for hide/close model box 
        component.set("v.isOpen", false);
        helper.RedirectToTab(component, event, helper);
    }
    
})