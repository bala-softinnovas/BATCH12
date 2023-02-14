public with sharing class AccountInvocable {

    @InvocableMethod(label='Close Opportunities'
    description='This method is going to update the stagename of all open opportunities under the given account to closed lost'
    category='Account')
    public static void closeOpportunities(List<Id> accountIds) {
        //query to get all the opps under the given accounts
        List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity 
                                WHERE AccountId IN :accountIds 
                                AND StageName NOT IN ('Closed Won', 'Closed Lost')];
        for(Opportunity opp : opps) {
            opp.StageName = 'Closed Lost';
        }
        if(!opps.isEmpty()) {
            try {
                update opps;
            } catch(Exception ex) {
                //create a log
            }
        }
    }
}
