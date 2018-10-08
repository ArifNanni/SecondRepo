trigger Abcc on Postion__c (before insert) { 
list<Postion__c> j=new list<Postion__c>() ;
j=trigger.new;
System.debuG('ARIFNANNI'+j.size());
for(Postion__c ja:j)
{
List<Postion__c> acc=[select name from Postion__c limit  2];
System.debuG('NANNIARIF'+ja.Functional_Area__c);
System.debuG('ARIFNANNI'+ja.name);
IF(ja.Max_Pay__c == 7861)
{ja.Max_Pay__c.addError('noooooooooooooo');}
IF(ja.Min_Pay__c == 786)
{ja.Min_Pay__c.addError('Yesssssssssss');}
}
}