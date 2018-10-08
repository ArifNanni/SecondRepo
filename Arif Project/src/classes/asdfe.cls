public  class asdfe {

    public asdfe(Sharing_Rule_obj controller) {
            List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
            System.debug('ccontroller+++=+++'+lstShare );
    }

public List<Sharing_Rule_obj__c > lst {get; set;}
public Sharing_Rule_obj__c  st {get; set;}
    public asdfe()
    {
      System.debug('I am normal constructor');
    }

    public asdfe(ApexPages.StandardController controller) {
      st= (Sharing_Rule_obj__c)controller.getRecord();
      st = [select Company__c from Sharing_Rule_obj__c where id =: st.id];
         System.debug('I am standard constructor'+st);
    }

 public asdfe(ApexPages.StandardSetController controller) {
    controller =  new ApexPages.StandardSetController(Database.getQueryLocator([ Select Company__c from Sharing_Rule_obj__c ]));
     this.lst = controller.getRecords();
    System.debug('I am standardset constructor'+controller.getRecords());
    } 
    

}