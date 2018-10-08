trigger parentRollup on Rollup_Parent__c  (before insert, after insert,before update,after update) {

if((trigger.isUpdate || trigger.isInsert) && trigger.isBefore)
{
  if(trigger.isUpdate)
  {
    System.debug('*PARENTISBEFOREUPDATETRIGGER*');
  }
  if(trigger.isinsert)
  {
    System.debug('*PARENTISBEFOREINSERTTRIGGER*');
  }
}

if((trigger.isUpdate || trigger.isInsert) && trigger.isAfter)
{
  if(trigger.isUpdate)
  {
    System.debug('*PARENTISAFTERUPDATETRIGGER*');
  }
  if(trigger.isinsert)
  {
    System.debug('*PARENTISAFTERINSERTTRIGGER*');
  }
}

}