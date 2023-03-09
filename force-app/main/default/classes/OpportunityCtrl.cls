public with sharing class OpportunityCtrl {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getTopOpportunities(String stage) {
        return [SELECT Name, Type, Amount, CloseDate
            FROM Opportunity
            WHERE StageName = :stage
            AND Amount != null
            WITH SECURITY_ENFORCED
            ORDER BY Amount DESC
            LIMIT 5];
    }
}
