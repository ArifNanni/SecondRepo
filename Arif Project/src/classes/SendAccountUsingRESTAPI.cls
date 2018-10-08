public class SendAccountUsingRESTAPI {
  
   private final String clientId = '3MVG9d8..z.hDcPLAIlnGaJHeogOhBBv9IekXICFWTUIZftHNYXT1KEYWFsaeRGZ5QkSf.HKIVDo1l04S2dAd';
   private final String clientSecret = '8891786244992446517';
   private final String username = 'arif4a6norg2@gmail.com';
   private final String password = 'Sharmila@786';
   
     public class deserializeResponse
     {
      public String id;
      public String access_token;
     }
     
     public String ReturnAccessToken ()
       {
          String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
          Http h = new Http();
          HttpRequest req = new HttpRequest();
          req.setBody(reqbody);
          req.setMethod('POST');
          req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
         // req.setEndpoint('https://ariforg2-dev-ed.my.salesforce.com/services/oauth2/token');
          
          HttpResponse res = h.send(req);
          String str = res.getbody();
          deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
          System.debug('++++Token+++++'+resp1.access_token);
          return resp1.access_token;
       }

}