//JSON: JavaScript Object Notation

//1 student Single Record
{
    "Name" : "Bala",
    "Age" : 30,
    "Title" : "Architect",
    "Salary" : 3000.50
}

//2 students detail in JSON format
[
    {
        "Name" : "Bala",
        "Age" : 30,
        "Title" : "Architect",
        "Salary" : 3000.50
    },
    {
        "Name" : "Arjun",
        "Age" : 40,
        "Title" : "Princial Architect",
        "Salary" : 20000.50
    }
]


//Get an account record and covert the same into JSON format
Account acc = [SELECT Name, Type, Industry, AnnualRevenue FROM Account WHERE AnnualRevenue != null AND Type != null AND Industry != null LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//Get 4 accounts and covert the same into JSON format
List<Account> accounts = [SELECT Name, Type, Industry, AnnualRevenue
                        FROM Account
                        WHERE AnnualRevenue != null
                        AND Type != null
                        AND Industry != null
                        LIMIT 4];
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);


//Callouts Test
RestCallouts.getAnimals();
RestCallouts.getAirlines();
RestCallouts.getEmployees();
RestCallouts.getCasesUsingNC();
RestCallouts.postAnimal();

SoapCallouts.parksCallout('India');
SoapCallouts.doAddCallout(8,7);

//Solution Design
1. Flow => Invocable Apex => Future Method (Callout)
2. Trigger => Future Method(Callout)

<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <env:Header />
    <env:Body>
        <m:byCountry xmlns:m="http://parks.services/">
            <arg0>United States</arg0>
        </m:byCountry>
    </env:Body>
</env:Envelope>