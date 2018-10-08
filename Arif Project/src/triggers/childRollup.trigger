trigger childRollup on Rollup_Child__c (before insert, after insert,before update,after update) {

if((trigger.isUpdate || trigger.isInsert) && trigger.isBefore)
{
  if(trigger.isUpdate)
  {
    System.debug('*ISBEFOREUPDATETRIGGER*');
  }
  if(trigger.isinsert)
  {
    System.debug('*ISBEFOREINSERTTRIGGER*');
  }
}

if((trigger.isUpdate || trigger.isInsert) && trigger.isAfter)
{
  if(trigger.isUpdate)
  {
    System.debug('*ISAFTERUPDATETRIGGER*');
  }
  if(trigger.isinsert)
  {
    System.debug('*ISAFTERINSERTTRIGGER*');
  }
}

}