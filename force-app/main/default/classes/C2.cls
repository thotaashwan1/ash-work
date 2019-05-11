public class C2 {
    List<Account> acts = [SELECT Name,Type,Phone,Industry,Fax FROM Account];
    
    public List<Account> getacts(){
        return acts;
    }
    



}