public class Jquery {

    public String strZip { get; set; }
    Public List<Account> acclist {get; set;}
    Public Jquery()
    {
     strZip = '12345';
     acclist = [Select id,
                      Active__c,Amount__c,CustomerPriority__c,
                      ExternalId__c,ListTenAcc__c,NEWPICK__c,NumberofLocations__c,
                      Pickulistu__c,PTO__c,
                      name from Account limit 10];
    }
}