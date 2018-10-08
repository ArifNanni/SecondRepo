public class uploadFile {
public String Type { get; set; }
public String fN { get; set; }
public blob file { get; set; }
public String title{get;set;}
public ContentVersion cv { get; set; }

public PageReference upload() {
ContentVersion cv = new ContentVersion();
cv.versionData = file;
cv.title = FN;
//cv.VersionData= EncodingUtil.Base64Decode(ConType);
cv.pathOnClient = '/file';
cv.FirstPublishLocationId = '0012800001Q0w0Y'; //Change id

try
{
insert cv;
//

system.debug('*********************Result'+cv.ContentBodyId);
system.debug('*********************Result'+cv.pathonClient);
}
catch (DMLException e)
{
ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading Document in Library'));
return null;
}
finally
{
cv= new ContentVersion();
}

ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Document uploaded successfully to library'));
return null;
}
}