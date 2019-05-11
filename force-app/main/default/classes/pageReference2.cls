public class pageReference2 {
    List<Account> acts;
    public list<Account> getacts(){
        return acts;
    }
    public PageReference allaccounts(){
    acts = [SELECT Name,Industry,Phone,Fax,Type from Account];
    return null;
    }
    
    public PageReference direct(){
        acts = [SELECT Name,Industry,Phone,Fax,Type from Account where Type= 'Customer - Direct'];
        return null;
    }
    
    public PageReference channel(){
        acts = [SELECT Name,Industry,Phone,Fax,Type from Account where Type='Customer - Channel'];
        return null;
    }


}