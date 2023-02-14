@isTest
public with sharing class SoapCalloutsTest {
    
    @isTest
    private static void parksCalloutTest() {
        //1. Set the mock
        ParksServicesMock mock = new ParksServicesMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Test the mock
        String country = 'Turkiye';
        String[] parks = SoapCallouts.parksCallout(country);

        //3. Do asserts
        System.assertEquals(2, parks.size());
    }

    @isTest
    private static void doAddCalloutTest() {
        //1. Set the mock
        DoAddCalloutMock mock = new DoAddCalloutMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Test the mock
        Double result = SoapCallouts.doAddCallout(10, 5);

        //3. Do asserts
        System.assertEquals(15, result);
    }
}
