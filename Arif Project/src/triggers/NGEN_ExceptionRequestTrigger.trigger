/**************************************************************************************
Trigger Name:  NGEN_ExceptionRequestTrigger
Version     : 1.0 
Created Date    : 20 July 2017
Function    : Trigger on ExceptionRequest object to call the handler methods
Modification Log :
* Developer                   Date                   Description
* ----------------------------------------------------------------------------                 
* Arif                     20 July 2017              Original Version
*************************************************************************************/
trigger NGEN_ExceptionRequestTrigger  on NGEN_ExceptionRequest__c (before insert, after insert, before update,
                                                 after update, before delete, after delete) {
   NGEN_ExceptionRequestHandler handler = new NGEN_ExceptionRequestHandler();
    /*  if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            handler.beforeInsert(trigger.New);
        } 
        if (Trigger.isUpdate) {
            handler.beforeUpdate(trigger.NewMap, trigger.OldMap);
        }
        if (Trigger.isDelete) {
          // Call class logic here!
        }
    }*/
    

    if (Trigger.IsBefore) {
        if (Trigger.isInsert) {
            handler.AfterInsert(trigger.New);         
        } 
        if (Trigger.isUpdate) {
            handler.AfterUpdate(trigger.NewMap, trigger.OldMap);      
        }
        if (Trigger.isDelete) {
          // Call class logic here!
        }
    }
}