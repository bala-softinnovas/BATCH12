public with sharing class DoAddCalloutMock implements WebServiceMock {
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String f, String g, String h, String i) {
        CalculatorServices.doAddResponse response_x = new CalculatorServices.doAddResponse();
        response_x.return_x = 15;
        response.put('response_x', response_x);
    }
}
