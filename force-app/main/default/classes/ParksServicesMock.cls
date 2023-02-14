public with sharing class ParksServicesMock implements WebServiceMock {
    public void doInvoke(Object a, Object b, Map<String,Object> response, String d, String e, String f, String g, String h, String i) {
        ParksServices.byCountryResponse response_x = new ParksServices.byCountryResponse();
        response_x.return_x = new List<String>{'US National Park', 'Turkiye National Park'};
        response.put('response_x', response_x);
    }
}
