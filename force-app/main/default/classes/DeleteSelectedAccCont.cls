public class DeleteSelectedAccCont 
{

    public String getWrapobj() {
        return null;
    }



    List<wrapperAccCont> wrapobj{get;set;}
    
    public DeleteSelectedAccCont(){
    wrapobj = new List<wrapperAccCont>();
    List<Contact> cont = new List<Contact>([Select Id, Name, AccountId, Email, Phone from Contact]);
    
    
    for(integer i=0; i<cont.size(); i++){
            Boolean check = false;
            wrapobj.add(new wrapperAccCont(check, String.valueof(i+1), cont[i]));
    }
    
    }
    
    public class wrapperAccCont{
    
    public Boolean chkBox{get;set;}
    public String sNo{get;set;}
    public Contact conts{get;set;}
    
        public wrapperAccCont(){
        
        }
        
        public wrapperAccCont(Boolean b, String s, Contact c){
        
        this.chkBox = b;
        this.sNo = s;
        this.conts = c;
        
        }
        
        public wrapperAccCont(String s, Contact c){
        
        this.chkBox = false;
        this.sNo = s;
        this.conts = c;
        
        }    
    
    
    } 

   
}