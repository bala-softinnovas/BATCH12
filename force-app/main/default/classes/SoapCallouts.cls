public with sharing class SoapCallouts {

    public static String[] parksCallout(String country) {
        ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
        String[] parks = parkService.byCountry(country);
        System.debug(parks);
        return parks;
    }

    public static Double doAddCallout(Double arg0, Double arg1) {
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double result = calcService.doAdd(arg0, arg1);
        System.debug(result);
        return result;
    }

    public static Double doMultiplyCallout(Double arg0, Double arg1) {
        CalculatorServices.CalculatorImplPort calcService = new CalculatorServices.CalculatorImplPort();
        Double result = calcService.doMultiply(arg0, arg1);
        System.debug(result);
        return result;
    }

}
