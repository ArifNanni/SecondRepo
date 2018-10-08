@isTest()
public class OpportunityTeamMemberBeforeTest
{   
   // static List<Siemens_Account_Role_Assignment__c> lst_AccRleAssgnmnts; //= new List<Siemens_Account_Role_Assignment__c>();
    static List<Database.SaveResult> lst_SvRsults;
    public static Opportunity opp1 =  new Opportunity();
    public static Account acc1 = new Account();
    public static OpportunityTeamMember otm = new OpportunityTeamMember();
    public static User user = new User();
    public static void setUPData()
    {
    
     //acc1 = new Account();
               acc1.Name = 'TestAcc1';
        //acc1.BillingCountry = 'Aruba';
      //  acc1.BillingCity = 'TestCity1';
       // acc1.BillingState = 'California';
       // acc1.ShippingCity = 'TestCity1';
       // acc1.ShippingState = 'California'; 
       insert acc1;
        
        opp1.Name = 'TestOpp';
        opp1.StageName = 'Qualification';
        opp1.CloseDate=Date.newInstance(2017,12,31);
        opp1.Accountid = acc1.id ;
        insert opp1;
        
        Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
       // User user = new User();
        
        user.FirstName = 'Test';
        user.LastName = 'Name';
        user.CompanyName = 'IT Test Company';
        user.MobilePhone = '123-456-7890';
        
        user.Username = 'acbcd@gmail.com';
        user.Email = 'acbcd@gmail.com';
  user.Alias = 'test';
        user.CommunityNickname = 'test1';
        user.TimeZoneSidKey = 'America/New_York';
        user.LocaleSidKey = 'en_US';
        user.EmailEncodingKey = 'UTF-8';
        user.ProfileId = profileId.Id;
        user.LanguageLocaleKey = 'en_US';
        
        user.Street = '123 Test St';
        user.City = 'Testcity';
        user.State = 'va';
        user.PostalCode = '23223';
        user.Country = 'USA';
        
        insert user;

        
        //otm.TeamMemberRole = 'Sales Rep';
       // otm.UserId = user.id;
        //otm.OpportunityId = opp1.id;
        //otm.OpportunityAccessLevel = 'Edit';
        //insert otm;
        
        
     // opp1.Type = 'Product';
     // opp1.Account = 'TestAcc1';
     // opp1.StageName = '0 Lead Management';
     // opp1.Siemens_Status__c = '0 In Prepartion';
     // opp1.Estimated_OI__c = 5/12/2017 ;
     // 
      
     }
     
        @IsTest(SeeAllData=true)
    public static void unitTest1()
    {
            setUPData(); 
            otm.TeamMemberRole = 'Sales Rep';
        otm.UserId = user.id;
        otm.OpportunityId = opp1.id;
        otm.OpportunityAccessLevel = 'Edit';
        insert otm;
            }
}