@isTest()
public class NGEN_ExceptionRequestHandlerTest{

  public static NGEN_ExceptionRequest__c Excep = new NGEN_ExceptionRequest__c();
    
     public static void setUpData()
       {
            Excep.NGEN_ExceptionSubType__c = 'Change Fees Due to Health Conditions';
            Excep.NGEN_ExceptionType__c = 'Expatriate / Repatriation Travel';
 
   
       }
    
    @isTest()
        public static void showAllRecords(){
        setUpData();
        insert Excep;
        Excep.NGEN_ExceptionSubType__c = 'Change Fees Due to Health Conditions';
            Excep.NGEN_ExceptionType__c = 'Expatriate / Repatriation Travel';
        update Excep;
        }
    
  }