public class ClosedOps {
    List<Opportunity> Closed_Ops = [Select Name,Type,StageName,closeDate from Opportunity where StageName IN ('Closed Won','Closed Lost')];
    
    public List<Opportunity> getClosed_Ops(){
        return Closed_Ops;
    }

}