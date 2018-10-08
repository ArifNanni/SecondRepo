trigger casetrigger on position__c (before update) {
for(position__c c:trigger.New)
{
if(c.status__c == 'new position'|| c.status__c =='pending approval' || c.status__c =='open approved')
{
c.OwnerId=c.CreatedById;
}
}
}