public class setdirect {

    public String abc{get; set;}


public setdirect ()
{
  abc=null;
  System.debug('++Constructor');

}

public pagereference save()
{
PageReference pageRef = new PageReference('/apex/setredirect1');
pageref.setRedirect(true);

pageref.getParameters().put('id1', abc);


return pageRef ;

}

}