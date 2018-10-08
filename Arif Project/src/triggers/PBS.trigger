trigger PBS on PB__c (before insert,before update,after insert,after update) {

if(Trigger.isUpdate)
{
  if(Trigger.isAfter)
  {
   System.debug('++++UUafter'+trigger.new[0].Text1__c);
   System.debug('++++UUafter'+trigger.new[0].ByPass__c);
  }
  if(Trigger.isBefore)
  {
   System.debug('++++UUbefore'+trigger.new[0].Text1__c);
   System.debug('++++UUbefore'+trigger.new[0].ByPass__c);
  }
  
}

if(Trigger.isInsert)
{
  if(Trigger.isAfter)
  {
   System.debug('++++IIafter'+trigger.new[0].Text1__c);
   System.debug('++++IIafter'+trigger.new[0].ByPass__c);
  }
  if(Trigger.isBefore)
  {
   System.debug('++++IIbefore'+trigger.new[0].Text1__c);
   System.debug('++++IIbefore'+trigger.new[0].ByPass__c);
  }
  
}
}