public class MultipleContinutationController {
    
    // Unique label for the first request
    public String requestLabel1;
    // Unique label for the second request
    public String requestLabel2;
    
    public String requestLabel3;
    public String requestLabel4;
    // Result of first callout
    public String result1 {get;set;}
    // Result of second callout
    public String result2 {get;set;}
    // Endpoints of long-running service
    private static final String LONG_RUNNING_SERVICE_URL1 = 'http://inqstatsapi.inqubu.com?api_key=27b3c066fcedd91a&data=population&countries=us';
    private static final String LONG_RUNNING_SERVICE_URL2 = 'http://inqstatsapi.inqubu.com?api_key=27b3c066fcedd91a&data=population&countries=gb';
    
    private static final String LONG_RUNNING_SERVICE_URL3 = 'http://inqstatsapi.inqubu.com?api_key=27b3c066fcedd91a&data=population&countries=us';
    private static final String LONG_RUNNING_SERVICE_URL4 = 'http://inqstatsapi.inqubu.com?api_key=27b3c066fcedd91a&data=population&countries=gb';
    
    public List<JSON2Apex> jsonApexURL1 {get;set;}
    public List<JSON2Apex> jsonApexURL2 {get;set;}
    
    // Action method
    public Object startRequestsInParallel() {
        // Create continuation with a timeout
        Continuation con = new Continuation(60);
        // Set callback method
        con.continuationMethod='processAllResponses';
        
        // Create first callout request
        HttpRequest req1 = new HttpRequest();
        req1.setMethod('GET');
        req1.setEndpoint(LONG_RUNNING_SERVICE_URL1);
        
        // Add first callout request to continuation
        this.requestLabel1 = con.addHttpRequest(req1);     
        
        // Create second callout request
        HttpRequest req2 = new HttpRequest();
        req2.setMethod('GET');
        req2.setEndpoint(LONG_RUNNING_SERVICE_URL2);
        
        // Add second callout request to continuation
        this.requestLabel2 = con.addHttpRequest(req2);     
        /*
        HttpRequest req3 = new HttpRequest();
        req3.setMethod('GET');
        req3.setEndpoint(LONG_RUNNING_SERVICE_URL3);
        
        // Add second callout request to continuation
        this.requestLabel3 = con.addHttpRequest(req3);   
        
        HttpRequest req4 = new HttpRequest();
        req4.setMethod('GET');
        req4.setEndpoint(LONG_RUNNING_SERVICE_URL4);
        
        // Add second callout request to continuation
        this.requestLabel4 = con.addHttpRequest(req4);   
        */
        // Return the continuation
        System.debug('+++CON::Object'+con);
        return con;  
        
    }
    
    // Callback method.
    // Invoked only when responses of all callouts are returned.
    public Object processAllResponses() {   
        System.debug('CALLBACK');
        // Get the response of the first request
        HttpResponse response1 = Continuation.getResponse(this.requestLabel1);
        this.result1 = response1.getBody();
        jsonApexURL1 = (List<JSON2Apex>) System.JSON.deserialize(response1.getBody(), List<JSON2Apex>.class);
        // Get the response of the second request
        HttpResponse response2 = Continuation.getResponse(this.requestLabel2);
        this.result2 = response2.getBody();
        jsonApexURL2 = (List<JSON2Apex>) System.JSON.deserialize(response2.getBody(), List<JSON2Apex>.class);
        
        // Return null to re-render the original Visualforce page
        return null;
    }
    
    public class JSON2Apex {
        public String countryCode{get;set;}
        public String countryName{get;set;}
        public List<Population> population{get;set;}
    }
    
    public class Population {
        public String year{get;set;}
        public String data{get;set;}
    }
    
    
    public static List<JSON2Apex> parse(String json) {
        return (List<JSON2Apex>) System.JSON.deserialize(json, List<JSON2Apex>.class);
    }
}