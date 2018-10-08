trigger M5 on M5__c (before insert,after insert,before update,after  update) {

if(Trigger.isInsert)
{
 System.debug('++++++++insert');
}
if(Trigger.isUpdate)
{
 System.debug('++++++++update');
}

}