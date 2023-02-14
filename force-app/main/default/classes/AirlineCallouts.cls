public with sharing class AirlineCallouts {
    
    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: POST
    @future(callout=true)
    public static void postAirline(Id airlineId) {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines/');
        request.setMethod('POST');

        //1.1 Get airline detail & prepare the same as json body
        Airline__c airline = [SELECT Name, Country__c, Established__c, Head_Quaters__c, Logo_URL__c, Name__c, 
                            Slogan__c, Website__c
                            FROM Airline__c
                            WHERE Id = :airlineId
                            LIMIT 1];
        AirlineWrapper wrap = convertToWrapper(airline);
        String body = JSON.serialize(wrap);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        Application_Log__c log = new Application_Log__c();
        log.Class_Method__c = 'AirlineCallouts: postAirline - ' + airlineId;
        log.Exception_Type__c = 'Success';
        log.Exception_Message__c = response.getStatusCode() + ' ' + response.getStatus();
        log.Stack_Trace__c = response.getBody();
        insert log;
    }

    private static AirlineWrapper convertToWrapper(Airline__c airline) {
        AirlineWrapper wrap = new AirlineWrapper();
        wrap.country = airline.Country__c;
        wrap.established = airline.Established__c;
        wrap.head_quaters = airline.Head_Quaters__c;
        wrap.id = airline.Name;
        wrap.logo = airline.Logo_URL__c;
        wrap.name = airline.Name__c;
        wrap.slogan = airline.Slogan__c;
        wrap.website = airline.Website__c;
        return wrap;
    }
}
