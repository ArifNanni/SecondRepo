public class InputFileUsingHtmlJavaScript{
    public String filename{get;set;}
    public blob body{get;set;}
    public void doAttachment(){ 
        Attachment at=new Attachment();
   at.Name='filename';
   System.debug('BODY::'+body);
   at.Body=Blob.valueOf(ApexPages.currentPage().getParameters().get('body'));
   at.Parentid='0010I00001uHBnZ';//Needs to add your record id below which you need attachment ;
   Insert at;
   }
}