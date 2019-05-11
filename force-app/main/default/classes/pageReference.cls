public class pageReference {
    List<Account> acts;
    public List<Account> getacts(){
        return acts;
    }
    
    public PageReference direct(){
        acts=[Select Name,Type,Phone,Industry from Account where Type='Customer - direct'];
        return null;
    }
    public PageReference channel(){
        acts=[Select Name,Phone,Type,Industry from Account where Type='Customer - Channel'];
        return null;
    }
    public PageReference acts(){
        acts=[Select Name,Phone,Type,Industry from Account];
        return null;
    }


}