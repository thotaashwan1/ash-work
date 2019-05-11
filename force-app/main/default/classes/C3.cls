public class C3 {
    List<Account> customer_Direct = [SELECT Name,Type,Phone,Industry FROM Account WHERE Type='Customer - Direct'];
    List<Account> customer_Channel = [SELECT Name,Type,Phone,Industry FROM Account WHERE Type='Customer - Channel'];
    
    public List<Account> getDirect(){
        return customer_Direct;
    }
    public List<Account> getChannel(){
        return customer_Channel;
    }

}