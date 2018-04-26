public class databaseinsertmethod
{
    public static void demo()
    {
        //Using Database Methods to insert records
        //All Invoices will be linked to this Customer record
        Customer__c cust = new Customer__c();
        cust.name = 'Test DEF';
        insert cust;
        
        //This List will be storing all Invoice record information
        List<Invoice__c> invList = new List<Invoice__c>();
        
        //First Invoice record
        Invoice__c inv1 = new Invoice__c();
        inv1.Amount_Paid__c = 1000.00;
        inv1.Status__c = 'Pending';
        //This is a mandatory field
        inv1.Customer__c = cust.id;
        invList.add(inv1);
        
        //Second Invoice record
        Invoice__c inv2 = new Invoice__c();
        inv2.Amount_Paid__c = 800.00;
        inv2.Status__c = 'Unpaid';
        inv2.Customer__c = cust.id;
        invList.add(inv2);
        
        //Third Invoice record with missing Customer__c field
        //We want this Invoice record to fail
        Invoice__c inv3 = new Invoice__c();
        inv3.Amount_Paid__c = 1000.00;
        inv3.Status__c = 'Pending';
        invList.add(inv3);
        
        //Boiler Plate Code 
        // Database.insert(ListName, false); 
        // False - Partial insert/update allowed
        // False - Failing records will not cause all list to roll back 
        
        // Database.saveresults[] for storing results
        // Check developer.salesforce.com for method SaveResult
        
        Database.saveresult[] srList = Database.insert(invList, false);
        
        for(Database.saveresult sr: srList)
        {
            if(sr.isSuccess())
            {
                System.debug('This Invoice record was successfully inserted : '+sr.getID());
            }            
        } 
        // Developer Console Window, databaseinsertmethod.demo();  
    }
}