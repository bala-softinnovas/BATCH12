public with sharing class RestCallouts {

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: GET
    public static HttpResponse getAirlines() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert the response body into List of Airline__c
            List<AirlineWrapper> wrappers = (List<AirlineWrapper>)JSON.deserialize(jsonString, List<AirlineWrapper>.class);
                //convert the wrappers into List<Airline__c>
                List<Airline__c> airlines = new List<Airline__c>();
                for(AirlineWrapper aw : wrappers) {
                    if(aw.id != null && aw.id.length() < 3) {
                        Airline__c airline = new Airline__c();
                        airline.Name = aw.id;
                        airline.Country__c = aw.country;
                        airline.Established__c = aw.established;
                        airline.Head_Quaters__c = aw.head_quaters;
                        airline.Logo_URL__c = aw.logo;
                        airline.Name__c = aw.name;
                        airline.Slogan__c = aw.slogan;
                        airline.Website__c = aw.website;
                        airlines.add(airline);
                    }                    
                }
                try {
                    insert airlines;
                } catch(Exception ex) {
                    System.debug(ex.getMessage());
                }
        }
        return response;
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: GET
    public static HttpResponse getEmployees() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if(response.getStatusCode() == 200) {
            String jsonString = response.getBody();
            //Convert the jsonString into Employee Response class
            EmployeeResponse empRes = (EmployeeResponse)JSON.deserialize(jsonString, EmployeeResponse.class);
            List<EmployeeResponse.EmployeeWrapper> wrappers = empRes.data;
                //Covert each EmployeeWrapper into Employee__c sObject record
                List<Employee__c> employees = new List<Employee__c>();
                for(EmployeeResponse.EmployeeWrapper wrap : wrappers) {
                    Employee__c emp = new Employee__c();
                    emp.Name = String.valueOf(wrap.id);
                    emp.Username__c = wrap.username;
                    emp.Employee_Name__c = wrap.name;
                    emp.Email__c = wrap.email;
                    emp.Gender__c = wrap.gender;
                    emp.Designation__c = wrap.designation;
                    emp.Phone_Number__c = wrap.phone_number;
                    emp.Complete_Address__c = wrap.complete_address;
                    employees.add(emp);
                }
                try {
                    insert employees;
                } catch(Exception ex) {
                    System.debug(ex.getMessage());
                }
        }
        return response;
    }

    //Endpoint: https://itte-dev-ed.my.salesforce.com/services/apexrest/Cases/5006F00003CKYzOQAX
    //Http Method: GET
    public static HttpResponse getCasesUsingNC() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_Dev_Account/services/apexrest/Cases/5006F00003CKYzOQAX');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        System.debug(response.getStatusCode());
        System.debug(response.getStatus());
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: POST
    public static HttpResponse postAnimal() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        String body = '{"name":"mighty moose"}';
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4. Process HttpResponse
        if(response.getStatusCode() == 201) {
            System.debug('Request has been processes successfully!');
        } else {
            System.debug('Something went wrong while creating animal information: ' + response.getBody());
        }
        return response;
    }
}
