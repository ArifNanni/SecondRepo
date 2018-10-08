//**************************************************************************************/
@isTest()
public class AccountRoleAssignmentsBeforeTest
{

    @isTest()
    public static void unitTestSiemensAccountRoleAssignment1()
    {
        Test.startTest();
        Account acc1 = new Account();
        acc1.Name = 'TestAcc1';
        acc1.BillingCity = 'TestCity1';
        acc1.BillingState = 'California';
        acc1.ShippingCity = 'TestCity1';
        acc1.ShippingState = 'California';
        
        insert acc1;
        Siemens_Account_Role_Assignment__c accRleAssgnmnt3 = new Siemens_Account_Role_Assignment__c();
        accRleAssgnmnt3.Siemens_CompanyID__c = acc1.Id;
            accRleAssgnmnt3.Siemens_Roles__c = 'Architect';
            accRleAssgnmnt3.Siemens_Divisions__c = 'Building Technology';
            accRleAssgnmnt3.Siemens_Business_Unit__c = 'BT HQ';
            accRleAssgnmnt3.Siemens_Country__c = 'Afghanista';
            insert accRleAssgnmnt3;
           
       List<Siemens_Account_Role_Assignment__c> lst_AccRleAssgnmnts = new List<Siemens_Account_Role_Assignment__c>();
            
            Siemens_Account_Role_Assignment__c accRleAssgnmnt2 = new Siemens_Account_Role_Assignment__c();
            accRleAssgnmnt2.Siemens_CompanyID__c = acc1.Id;
            accRleAssgnmnt2.Siemens_Roles__c = 'Architect';
            accRleAssgnmnt2.Siemens_Divisions__c = 'Building Technology';
            accRleAssgnmnt2.Siemens_Business_Unit__c = 'BT HQ';
            accRleAssgnmnt2.Siemens_Country__c = 'Afghanistan';
            //insert accRleAssgnmnt;
            lst_AccRleAssgnmnts.add(accRleAssgnmnt2);
            
            Siemens_Account_Role_Assignment__c accRleAssgnmnt1 = new Siemens_Account_Role_Assignment__c();
            accRleAssgnmnt1.Siemens_CompanyID__c = acc1.Id;
            accRleAssgnmnt1.Siemens_Roles__c = 'Supplier';
            accRleAssgnmnt1.Siemens_Divisions__c = 'Building Technology';
            accRleAssgnmnt1.Siemens_Business_Unit__c = 'BT Central Items';
            accRleAssgnmnt1.Siemens_Country__c = 'Afghanistan';
            //insert accRleAssgnmnt;
            lst_AccRleAssgnmnts.add(accRleAssgnmnt1);
            
            List<Database.SaveResult> lst_SvRsults = Database.Insert(lst_AccRleAssgnmnts);
            
            for(Database.SaveResult sr : lst_SvRsults)
                System.Assert(sr.isSuccess() == True, 'The Account Role assignment did not insert properly, please check validation rules and other mechanisms');
        
            lst_AccRleAssgnmnts.clear();
            lst_SvRsults.clear();
            
            accRleAssgnmnt2.Siemens_Roles__c = 'OEM';
            accRleAssgnmnt1.Siemens_Roles__c = 'OEM';
            
            lst_AccRleAssgnmnts.add(accRleAssgnmnt2);
            lst_AccRleAssgnmnts.add(accRleAssgnmnt1);
            
            lst_SvRsults = Database.update(lst_AccRleAssgnmnts);
            
            for(Database.SaveResult sr : lst_SvRsults)                
                System.Assert(sr.isSuccess() == True, 'The Account Role assignment did not Update properly, please check validation rules and other mechanisms');
        Test.stopTest();
    }
    
    @isTest()
    public static void unitTestSiemensAccountRoleAssignment2()
    {
        Test.startTest();     
        
       Account acc2 = new Account();
        acc2.Name = 'TestAcc1';
        acc2.BillingCity = 'TestCity2';
        acc2.BillingState = 'California';
        acc2.ShippingCity = 'TestCity2'; 
        acc2.ShippingState = 'California';
        
        insert acc2;
        
        //Insert and Update Siemens_Account_Role_Assignment
        try
        {
            List<Siemens_Account_Role_Assignment__c> lst_AccRleAssgnmnts = new List<Siemens_Account_Role_Assignment__c>();
            
            Siemens_Account_Role_Assignment__c accRleAssgnmnt2 = new Siemens_Account_Role_Assignment__c();
            accRleAssgnmnt2.Siemens_CompanyID__c = acc2.Id;
            accRleAssgnmnt2.Siemens_Roles__c = 'Architect';
            accRleAssgnmnt2.Siemens_Divisions__c = 'Building Technology';
            accRleAssgnmnt2.Siemens_Business_Unit__c = 'BT HQ';
            accRleAssgnmnt2.Siemens_Country__c = 'Afghanistan';
            //insert accRleAssgnmnt;
            lst_AccRleAssgnmnts.add(accRleAssgnmnt2);
            
            Siemens_Account_Role_Assignment__c accRleAssgnmnt1 = new Siemens_Account_Role_Assignment__c();
            accRleAssgnmnt1.Siemens_CompanyID__c = acc2.Id;
            accRleAssgnmnt1.Siemens_Roles__c = 'Architect';
            accRleAssgnmnt1.Siemens_Divisions__c = 'Building Technology';
            accRleAssgnmnt1.Siemens_Business_Unit__c = 'BT HQ';
            accRleAssgnmnt1.Siemens_Country__c = 'Afghanistan';
            //insert accRleAssgnmnt;
            lst_AccRleAssgnmnts.add(accRleAssgnmnt1);
            
            List<Database.SaveResult> lst_SvRsults = Database.Insert(lst_AccRleAssgnmnts);
            
            for(Database.SaveResult sr : lst_SvRsults)
                System.Assert(sr.isSuccess() == True, 'The Account Role assignment did not insert properly, please check validation rules and other mechanisms');
        
            lst_AccRleAssgnmnts.clear();
            lst_SvRsults.clear();
            
            accRleAssgnmnt2.Siemens_Roles__c = 'OEM';
            accRleAssgnmnt1.Siemens_Roles__c = 'OEM';
            
            lst_AccRleAssgnmnts.add(accRleAssgnmnt2);
            lst_AccRleAssgnmnts.add(accRleAssgnmnt1);
            
            lst_SvRsults = Database.update(lst_AccRleAssgnmnts);
            
            for(Database.SaveResult sr : lst_SvRsults)                
                System.Assert(sr.isSuccess() == True, 'The Account Role assignment did not Update properly, please check validation rules and other mechanisms');
                              
        }catch(Exception e)
        {
            System.debug('--------------'+e);
        }
        
        Test.stopTest();
        
   }     
}