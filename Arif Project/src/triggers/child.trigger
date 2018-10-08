trigger child on ChildTrigger__c (before insert, before update,after insert ,after update) {


if(trigger.isUpdate && trigger.isBefore)
{
System.debug('+++=Hi I am Update before');
}

if(trigger.isUpdate && trigger.isAfter)
{
recursionTest recursionTest1 = new recursionTest();
recursionTest1.test();

}

if(trigger.isInsert && trigger.isBefore)
{


System.debug('+++=Hi I am Insert before');
}

if(trigger.isInsert && trigger.isAfter)
{
List<UserChild__c> ui = [Select id,TestFiled__c from UserChild__c where UserR__c =: Userinfo.getuserid()];
ui[0].TestFiled__c  = 'qwerfd9';
update ui;


List<ChildTrigger__c> jk = [Select id from ChildTrigger__c  where id =: trigger.new[0].id];
jk[0].Number__c = 99999;
ChildTrigger__c v = new ChildTrigger__c();
v.ParentTrigger__c = 'a130I0000032T31';
if(constants.flag)

{
constants.flag = false;
insert v;
}
System.debug('+++=Hi I am Insert after');
}

}