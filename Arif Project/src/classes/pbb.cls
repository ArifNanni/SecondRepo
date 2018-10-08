public class pbb {
String gas = '00528000004OVFM';
id f ;
pb__c vg;
    public pbb(ApexPages.StandardController controller) {
       String ids = ApexPages.currentPage().getParameters().get('id');
       f= ids;
       vg = [Select id,ownerid from pb__c where id =:ids ];
    }
    
    public PageReference redirectToAccount(){
    vg.ownerId = gas;
    update vg;
        return new PageReference('/'+f);
    } 

}