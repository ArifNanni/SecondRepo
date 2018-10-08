public with sharing class ABCD1 {
Schema.DescribeFieldResult fieldResult = Job_Application__c.TestPicklist__c.getDescribe();
List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
String countries{get;set;}
public ABCD1(){
 System.debug('+++++'+fieldResult);
 System.debug('-----'+fieldResult.getPicklistValues());
}
}