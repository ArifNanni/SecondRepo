public class setdirect1 {

    public String abcde { get; set; }

    


public setdirect1 ()
{
  
  System.debug('**Constructor'+ApexPages.currentPage().getParameters().get('id1'));
  abcde = ApexPages.currentPage().getParameters().get('id1');
}



}