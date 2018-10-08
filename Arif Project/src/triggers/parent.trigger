trigger parent on ParentTrigger__c (before insert, before update,after insert , after update) {
 
 if(trigger.isInsert && trigger.isUpdate)
 {
    System.debug('+++*Parent');
 }

}