public with sharing class EmployeeCtrl {
    
    @AuraEnabled
    public static List<Employee__c> searchEmployees(String searchKey) {
        searchKey = '%' + searchKey + '%';
        return [SELECT Employee_Name__c, Designation__c, Email__c
                FROM Employee__c
                WHERE Employee_Name__c LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}