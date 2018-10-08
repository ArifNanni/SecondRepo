trigger binsert on MasterD__c (before update,before delete) {

 if((Trigger.isUpdate || Trigger.isDelete) && Trigger.isBefore)
 {
  System.debug('+++++UPDATE++++++');
 } 
}