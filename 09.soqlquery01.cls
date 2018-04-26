public class soqlquery01
{
    public static void demo()
    {
      //Invoice__c record should be created today and Customer__c should not be Nike
        List<Invoice__c> invList = [select id, name, Customer__r.name, status__c from invoice__c where CreatedDate = today and Customer__r.name != 'Nike'];
    
        System.debug('Total number of records returned : '+invList.size());
        
        for(Invoice__c inv: invList)
        {
            System.debug('The records are : '+inv);
        }
    
    }
    //soqlquery01.demo();
}