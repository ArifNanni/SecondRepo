trigger abcd on Queueable__c (after insert,after update,after undelete,before delete,after delete) {
 /* if( (trigger.isInsert || trigger.isUpdate) && trigger.isAfter)
  {
   // new queuable().abcd();
  }*/
   if(Trigger.isdelete)
  {
    System.debug('++++'+trigger.new.size());
   for(Queueable__c g  : trigger.new)
   {
    System.debug('+++++'+g.Id);
   }
  } 
 
}