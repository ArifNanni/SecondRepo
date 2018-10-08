public class S4SWrapperRecordTypeData
    {
       @AuraEnabled Public String LabelName {get;set;}
       @AuraEnabled Public String Description {get;set;} 
        
        Public S4SWrapperRecordTypeData(String LabelName , String Description)
        {
            this.LabelName = LabelName ;
            this.Description = Description;
        }    
    }