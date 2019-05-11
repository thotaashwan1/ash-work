public class Ext1 {
    public Ext1(Apexpages.StandardController abc){
        
    }
    List<Campaign> camps = [Select Name,status,StartDate,EndDate from campaign where Status='Completed'];
    
    public List<Campaign> getcamps(){
    return camps;      
    }
    
}