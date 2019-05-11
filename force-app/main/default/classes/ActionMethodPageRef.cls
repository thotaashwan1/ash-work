public class ActionMethodPageRef {
    public List<Account> acts = new List<Account>();
    
    public List<Account> default1 = [select Name, Phone, Industry, Type from Account];
    
    public List<Account> getdefault1(){
    return default1;
    }
    
    public pagereference direct(){
        acts = [select Name, Phone, Industry, Type from Account where Type='Customer - Direct'];
        return null;
    }
    
    public pagereference channel(){
        acts = [select Name, Phone, Industry, Type from Account where Type='Customer - Channel'];
        return null;
    }
    
    public List<Account> getacts(){
        return acts;
    }
}