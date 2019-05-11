public class GetterSetterActionMethod {
    List<Account> acts;
    public String keyword;
    
    public List<Account> getacts(){
        return acts;
    }
    public String getkeyword(){
        return keyword;
    }
    public void setkeyword(String s){
        keyword=s;
    }
    public PageReference find(){
        acts=[Select Name,Type,Phone,Industry from Account where Industry=:keyword];
        return null;
    }

}