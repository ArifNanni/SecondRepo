public  class Sharing_Rule_obj {
public Sharing_Rule_obj ()
{
List<Sharing_Rule_obj__c> lstShare = [ Select Company__c from Sharing_Rule_obj__c ];
System.debug('controller+++=+++'+lstShare );
}
}