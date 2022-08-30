public class InvocableFlowDeleteOpportunity {
	@InvocableMethod(label='Delete Related Opportunities' 
                     description='Delete Related Opportunities for the given record ID' 
                     category='Account')
    public static void deleteOpportunities(List<String> ids){
        List<String> listOppIds = new List<String>();
        //ids = {'0001EfRRvR004'}
        //Id accountId = ids.get(0);
        List<Opportunity> oppLists = [SELECT Id, name 
                                     FROM Opportunity 
                                     WHERE AccountId =: ids 
                                     AND StageName = 'Closed Won'];
        
        for(Opportunity opp:oppLists){
            listOppIds.add(opp.name);
        }
        System.debug('Opportunities List' + oppLists);
        
        if (listOppIds.contains('0068d000008wos9AAA')){
            System.debug('The Opportunity is in the list = True');
        }
    }
}