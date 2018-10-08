Public with sharing class dummy
{
 public static void aa(List<Private__c> p)
 {
    // Private__c  p = [Select id,Text1__c from Private__c  where id = 'a1L0I00000BIBKh'];
    //  Private__c  p = new  Private__c();
   //   p.id = 'a1L0I00000BIBKh';
   //  p.id = 'a1L0I00000BIBL1';
     p[0].Private__c = 'a1L0I00000BIBKh';
     p[0].recordtypeid = '0120I000000TOBr';
    // p.Text1__c = '3';
    // update p;
 }
}