trigger Dame on M3__c (before insert) {

if(Trigger.isBefore && Trigger.isInsert)
{
 //Trigger.new[0].Picklist_value__c = 'C-A/B';
}

}