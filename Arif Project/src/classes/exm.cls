Public class exm
{

  Public void sample(List<Sobject> objList,List<String> fields)
  {
   Schema.SObjectType sObjectType = objList.getSObjectType();
   String str = sObjectType + '';
   Type t = Type.forName(str);
   System.debug(t.newInstance());
  }

    
    Public class wrapper
    {
     Public Account acc{get; set;}
     Public Integer a{get; set;}
     Public wrapper()
     {
      acc=new Account();
      a=0;
     }
     
     Public Integer get(String fieldName)
     {
      Object s=this;
      exm.wrapper df = (exm.wrapper)s;
      Integer str = df.a;
      
      return str;
     }
     
    
    }
}