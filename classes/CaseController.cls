/***************************************************************************************************************************************************
 # Class Name  = "CaseController"
 # Author      = Madhava Pallala
 # Description = This class is used by the LWC component(OrderShippingTracking) to dispay the latest shipping statis in case Detail Page  .
                
 # Change Log :
 ============================================================================================================
 Date                     Changed By                        Change Description
 ============================================================================================================
 12/18/2021               Madhava Pallala                          Original Version
 
 
**************************************************************************************************************************************************/

public with sharing class CaseController {
    @AuraEnabled(cacheable=true)
    public static String  getOrderTrackingNumber(Id recordId) {
     String respBody;
     string trackingUrl='https://merzcommunities--mel.sandbox.my.salesforce-sites.com/services/apexrest/mockShipmentStatus?trackingNumber=';
        Case Kase=[SELECT Id,Order_Tracking__c FROM CASE WHERE Id=:recordId];
        if(Kase<>NULL){
           trackingUrl=trackingUrl+Kase.Order_Tracking__c; 
           
           //web service callout 
           
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(trackingUrl);
            //https://merzcommunities--mel.sandbox.my.salesforce-sites.com/services/apexrest/mockShipmentStatus?trackingNumber=anystringwilldo
            req.setMethod('GET');
            HttpResponse resp = http.send(req);
            respBody = resp.getBody();
        }
        return respBody;
        
     
  }
}