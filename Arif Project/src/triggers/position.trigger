trigger position on position__c (before insert) {
for( position__c p : Trigger.New)
{
List<position__c> mynew=[select position_name__c,skills_required__c from position__c where name=:p.name];
if(mynew.size()>0)
{
p.name.addError('position with name is existing');
}
}
}