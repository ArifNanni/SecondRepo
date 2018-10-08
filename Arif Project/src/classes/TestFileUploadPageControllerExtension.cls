public class TestFileUploadPageControllerExtension
{
    //reference to standard controller
    private Transient ApexPages.StandardController controller {get;set;}
    
    public TestFileUploadPageControllerExtension(ApexPages.StandardController controller) {
        this.controller = controller;
    }
    
    public void doAttach() {
        System.Debug('##################################');
        //get uploaded document
        Document doc = (Document)this.controller.getRecord();
        System.Debug('doc: '+doc);
        
        //create attachment from document
        Attachment a = new Attachment();
        a.Body = doc.Body;
        a.ContentType = doc.ContentType;
        a.Name = doc.Name;
        a.ParentId = '0010I00001uHBnZ'; //hard coded account id
        
        Database.SaveResult sr = Database.Insert(a);
        System.Debug('Attachment SaveResult: '+sr);
 
       // doc.body = null; // Ensure that the blob is not included automatically in the serialized image of the standard controller.
    }
}