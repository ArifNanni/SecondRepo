@isTest
Public class HTTPMOCkUPTest
{

  @isTest
  Public static void testMethod1()
  {
   HTTPMOCkUP obj = new HTTPMOCkUP();
   String strResponse='{"meta":{"requestId":"99cdaa1a-abf3-4cc3-b469-d6a6131d43bd","responseStatus":{"logReference":"99cdaa1a-abf3-4cc3-b469-d6a6131d43bd","code":"999999","description":"Host Error","type":"Error","message":"Host System Error (005:999999)"},"additionalStatus":[{"code":"RAT-001","type":"Error","message":"Account previously transferred. Account previously transferred. (Tracking# EXMOKRAT-9004).","logReference":"99cdaa1a-abf3-4cc3-b469-d6a6131d43bd"}]}}';
   Test.setMock(HttpCalloutMock.class, new CM_TestHttpCalloutMock(strResponse,200));
   Test.startTest();
   obj.makeRequest();
   Test.stopTest();
  }
}