public class soqlquery05
{
    public static void demo()
    {
         //Let's find Average Amount for Customer Nike using Aggregate function
         //AggregateResult is a read-only sObject and is only used for query results.      
         //Check Apex Developer Guide for AggregateResult Array
         //Can calculate MAX, MIN and AVG result

         
         //Here aver is Alias and our search is from Child > Parent record
         AggregateResult[] avgArray =
         [select avg(Amount_Paid__c) aver from Invoice__c where Customer__r.name = 'Nike'];  
         
         System.debug('Let\'s see what\'s stored in avgArray : '+avgArray);
    
        //This is Object and not SObject
        Object avgAmount = avgArray[0].get('aver');
        System.debug('The Average Amount for Customer is : '+avgAmount);

    
    }
    //soqlquery05.demo();
}