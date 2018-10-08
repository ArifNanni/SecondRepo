({
    createAccountRecord: function(component, event, helper) {
        var RecordTypeName = component.get("v.RecordTypeName");
        var arraylist =  component.get("v.WrapOfRecordType");
        var recordTypeLabel =  component.get("v.DefaultRecordTypeName");
        if(recordTypeLabel == RecordTypeName)
        {
            var evt = $A.get("e.force:navigateToComponent");
            evt.setParams({
                componentDef : "c:myComponent",
                componentAttributes: {
                    contactName : "Arif"
                }
            });
            evt.fire();         
        }    
        else
        {    
            var action = component.get("c.getRecTypeId");        
            action.setParams({
                "recordTypeLabel": recordTypeLabel
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var createRecordEvent = $A.get("e.force:createRecord");
                    var RecTypeID  = response.getReturnValue();
                    createRecordEvent.setParams({
                        "entityApiName": 'Account',
                        "recordTypeId": RecTypeID,
                        "panelOnDestroyCallback": function(event) {
                            if(arraylist.length == 1)
                            { 
                                component.set("v.isOpen", false);
                                helper.RedirectToTab(component, event, helper);             
                            }  
                        }
                    });
                    createRecordEvent.fire();
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
        }    
    },
    RedirectToTab : function(component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "/001/o"
        });
        urlEvent.fire();
    }    
})