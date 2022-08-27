public class InvocableFlowDeleteOpportunity {
	@InvocableMethod(label='Delete Related Opportunities' 
                     description='Delete Related Opportunities for the given record ID' 
                     category='Account')
    public static void deleteOpportunities(List<String> ids){
        List<Opportunity> oppList = [SELECT Id 
                                     FROM Opportunity 
                                     WHERE AccountId =: ids 
                                     AND StageName = 'Closed Won'];
        delete oppList;
    }
}