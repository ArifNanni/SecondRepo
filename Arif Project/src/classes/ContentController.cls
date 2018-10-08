public class ContentController {
    public transient blob file { get; set; }
    public transient String text1 {get; set;}
    public ContentController()
    {
      text1 ='Nanni';
    }
    public PageReference upload() {
        ContentVersion v = new ContentVersion();
        v.versionData = file;
        v.title = 'testing upload';
        v.pathOnClient ='/somepath.txt';
        insert v;
        text1 = text1 + 'Arif';
       // return new PageReference('/' + v.id);
       return null;
    }
}