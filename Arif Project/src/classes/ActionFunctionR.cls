public class ActionFunctionR {

  public String text1 {get; set;}
 public Transient String text2 {get; set;}
 public List<Account> acclist {get; set;}

    
  Public ActionFunctionR()
   {
    text1 = 'Text1';
    text2 = 'Text2';
    acclist = [Select id,
                      Active__c,Amount__c,CustomerPriority__c,
                      ExternalId__c,ListTenAcc__c,NEWPICK__c,NumberofLocations__c,
                      Pickulistu__c,PTO__c,
                      name from Account limit 1000];
   // ex = '5';
   }

    public PageReference save() {
      System.debug('TEXT1'+text1);
      System.debug('TEXT2'+text2);
        return null;
    }


 
    public void first()
    {
    //  System.debug('+++++I am first'+ex);
    }
    
    public void second()
    {
     // System.debug('Ex+++'+ex);
     // ex = '10';
      System.debug('::TEXT1'+text1);
      System.debug('::TEXT2'+text2);
      text2 = text2 + 'Nannu';
      System.debug('+++++I am Second');
    }
}