/**
@Author     :   Arif Md
@Name       :   CM_TestHttpCalloutMock
@CreateDate :   01/25/2018
@Description:   Mock Response class for HTTP callouts
@Version    :   1.0
*/
/**********************************************************************************************************************
* Modification Log              Developer               Code Review             Date            Description
* ---------------------------------------------------------------------------------------------------------------------
* 1.0                           Arif Md                                  01/25/2018      Version 1.0
***********************************************************************************************************************/
public with sharing class CM_TestHttpCalloutMock implements HttpCalloutMock{
    String strMockResponseBody;
    Integer intMockResponseCode;
    public CM_TestHttpCalloutMock(String strRespnseBody, Integer intResponseCode){
        this.strMockResponseBody = strRespnseBody;
        this.intMockResponseCode = intResponseCode;
    }
    public HTTPResponse respond(HTTPRequest req) {
        String sResp= strMockResponseBody;
        HttpResponse response = new HttpResponse();
        response.setBody(sResp);   
        response.setStatusCode(intMockResponseCode);    
        return response;
    }
}