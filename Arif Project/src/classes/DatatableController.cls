public class DatatableController {
       @AuraEnabled
       public static List<Account> getCases() {
           
           return [SELECT Id ,Name FROM Account limit 500];
       } 
       }