trigger timee on Recordtype__c (before insert) {

for(Recordtype__c  nu :  trigger.new)
{
  nu.recordtypeId = '0120I000000TO50';
}
}