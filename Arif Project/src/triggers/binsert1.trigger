trigger binsert1 on ChildD__c (before update,before delete) {

 if((Trigger.isUpdate || Trigger.isDelete) && Trigger.isBefore)
 {
 for(ChildD__c c:trigger.new)
 {
   c.Count__c = c.Count__c + 1;
  } 
  System.debug('+++++UPDATE++++++');
 } 
}