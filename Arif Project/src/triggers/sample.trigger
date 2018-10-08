trigger sample on Dobut__c (before insert) {
if(trigger.isInsert && trigger.isBefore)
{
constants.lstca.addall(trigger.new);
System.debug('intrigger'+constants.lstca);
Account acc = [Select id from Account limit 1];
update acc;
}

}