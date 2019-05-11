Public class AccountsList{
    List<Account> acts = [SELECT Name, Phone, Type, Industry FROM Account];
    
    public List<Account> getacts(){
        return acts;
    }

}