trigger techm on M2__c (before insert, before update,after insert ,after update) {
if(trigger.isUpdate && trigger.isAfter)
{
M2__c  c = new M2__c() ;
c.Name = 'SwingJ';
c.M1__c = 'a150I00000DwQ5y';
insert c;

}


}