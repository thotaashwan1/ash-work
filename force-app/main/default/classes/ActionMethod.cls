public class ActionMethod {
    List<Account> Customer_Direct = [SELECT Name, Phone, Type, Industry FROM Account where Type='Customer - Direct'];
    List<Account> Customer_Channel = [SELECT Name, Phone, Type, Industry FROM Account where Type= 'Customer - Channel'];
    
    public List<Account> getDirect(){
        return Customer_Direct;
    
    }
    
    public List<Account> getChannel(){
        return Customer_Channel;
    
    }
}