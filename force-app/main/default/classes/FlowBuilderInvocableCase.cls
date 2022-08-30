public class FlowBuilderInvocableCase {
    @invocableMethod(label          = 'Send Email to contact'
                     description    = 'This metod will end an email to contact everytime a new case is crreated'
                     category       = 'Case')
    public static void sendEmailToContact(List<RequestVatiables> requestList) {
        
        String contactId = requestList.get(0).contactId;
        String caseNumber = requestList.get(0).caseNumber;

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[]{contactId}; //new String[] {'95i5jrtmfmfHGGV', '1000GdmGFGRRGFGF'}; //email Addtess
        message.subject = 'Casse new Message' + caseNumber;
        message.plainTextBody = 'This is the message text Body' + caseNumber;
        message.setSaveAsActivity(true);
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if(results[0].success){
            System.debug('The Email was Send Succesfuly');
        } else{
            System.debug('The Email failed to be send' + results[0].errors[0].message);
        }
    }
    public class RequestVatiables{
        @InvocableVariable(label = 'Record Id' description = 'The Id of the Case record' required = true)
        public String caseId;
        
        @InvocableVariable(label = 'Contact Record Id' description = 'The Id of the Contact record' required = true)
        public String contactId;
        
        @InvocableVariable(label = 'Case Number' description = 'The Case Number' required = true)
        public String caseNumber;
    }
}
