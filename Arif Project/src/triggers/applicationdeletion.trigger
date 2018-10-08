trigger applicationdeletion on position__c (before insert) {
List<String> mynames = new List<String>();
for( position__c p : Trigger.New)
{ 
mynames.add(p.name);
}
list<job_applications__c> myapplications = [select position__c from job_applications__c where position__c in: mynames];
delete myapplications;
}