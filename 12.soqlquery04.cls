public class soqlquery04
{
    public static void demo()
    {
         //We're using Child record to fetch the Parent record
        //We're using Invoice__c records which are created today, to find the Customer__c record
        //Here Customer__r.name gives us Parent record information
        // SOQL query Child > Parent
        
        List<Invoice__c> invList = [select id, name, Customer__r.name, CreatedDate from Invoice__c where CreatedDate = today];
        
        for(Invoice__c inv: invList)
        {
            System.debug('The Customer record is : '+inv.Customer__r.name);
        }        
    }
    //soqlquery04.demo();
}