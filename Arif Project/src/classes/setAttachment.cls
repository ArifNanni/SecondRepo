public class setAttachment {

    public String body { get; set; }

    public void setAttachment()
    {
        System.debug('coming here');
        String attachmentBody = ApexPages.currentPage().getParameters().get('attachmentBody');
        System.debug('attachment body is'+attachmentBody);
            if(attachmentBody  == null)
            System.debug('coming here');
          //  attachment.Body = EncodingUtil.base64decode(attachmentBody);
            
    }   

}