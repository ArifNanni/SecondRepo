trigger pb on processbuilder__c (before insert,after insert) {

if(trigger.isInsert)
{
 
  System.debug('@@@insert');
  if(trigger.isBefore)
  {
  for(processbuilder__c a: trigger.new)
  {
    System.debug('+++before insert'+trigger.new);
    a.Text__c = 'Nannuuu';
  }
  }
  if(trigger.isAfter)
  {
  for(processbuilder__c a: trigger.new)
  {
    System.debug('+++after insert'+trigger.new);
  //  a.Text__c = 'Nannuuu';
  }
  }
}


if(trigger.isUpdate)
{

  System.debug('@@@update');
}
}