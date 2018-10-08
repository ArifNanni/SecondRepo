Public class HTTPMOCkUP
{
  Public HTTPMOCkUP()
  {
  
  }
  
  Public void makeRequest()
  {
   HttpRequest req = new HttpRequest();
   Http http = new Http();
   HttpResponse httpRes = http.send(req);
     if(httpRes.getStatusCode() == 200){
       Integer a = 10;
       Integer b = 20;
       System.debug('A+B'+(a+b));
     }
  }
}