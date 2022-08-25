public class FlowBuilderSeries {
    @invocableMethod(label = 'Welcome Message' description = 'This is a display message' category = 'Welcom')
    public static List<String> welcomeMessage(List<String> name) {
        String message = 'Welcome to the Flow builder Series';
        if(name !=null && name.size()>0){
            message = 'Welcome' + name.get(0) + 'Welcome to the Flow builder Series';
        }
        //List<String> myMessage = new List<String>('Welcome to the Flow builder Series');
        return new List<String>{};

    }
}