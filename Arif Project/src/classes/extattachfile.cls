Public class extattachfile{
    Public ContentVersion objAttachment{get; set;}
    Public Account objApplicant{get; set;}
    Public extattachfile(apexpages.standardcontroller stdCon){
        objAttachment = new ContentVersion();
        objApplicant = new Account();
    }
    Public void saveApplicant(){
        insert objApplicant;
       
        //objAttachment.ParentId = objApplicant.id;
        insert objAttachment;
    }
}
/*
ContentVersion cv = new ContentVersion();
        cv.ContentLocation = 'S';
       // cv.ContentDocumentId = contentDocumentId;
        
        //Body
String body = 'Arif sjldflasjhjfjsafsaf';
        cv.VersionData = Blob.valueOf(Body);
        
        
        cv.PathOnClient = 'txt';

        cv.Title = 'Arif';
       
        
        insert cv;
           System.debug('abcd'+cv.id);*/