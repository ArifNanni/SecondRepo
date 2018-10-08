public class VFOBJ {

    public VF__c VF { get; set; }
    public String str1 { get; set; }
    public String str2 { get; set; }
    public String str3 { get; set; }
    
    public VFOBJ()
    {
     VF = [Select id,Text1__c,Text2__c,Text3__c from VF__c where id = 'a1E0I000000S52c'];
     str1=VF.Text1__c;
     str2=VF.Text2__c;
     str3=VF.Text3__c;
    }
 
}