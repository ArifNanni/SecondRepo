Public class recursionTest
{
public static boolean  ty= true;

public void test()
{
System.debug('+++=Hi I am Update after');
    if(ty){
    List<ChildTrigger__c> jk = [Select id from ChildTrigger__c  where id =: trigger.new[0].id];
    jk[0].Number__c = 99999;
    recursionTest.ty = false;
    //constants.flag = false;
    update jk;
   }
 }  

}