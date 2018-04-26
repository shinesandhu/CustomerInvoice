public class insertrecord
{
    public static void demo()
    {
        // In this case, we're inserting Parent record, Child record and linking both records to each other.
        // Invoice Name is Auto generated
        // Custom Objects with some Custom fields
                
        Customer__c cust = new Customer__c();
        cust.name = 'Test ABC';
        insert cust;
        
        Invoice__c inv = new Invoice__c();
        inv.Amount_Paid__c = 1000.0;
        inv.Description__c = 'Customer named Test ABC';
        inv.Status__c = 'Pending';
        //Master - Detail relationship field
        inv.Customer__c = cust.id;
        insert inv;
        
        System.debug('Customer Info: '+cust);
        System.debug('Invoice Info: '+inv);
        
        //Call from Developer Console (Open Execute Anonymous Window)
        //insertrecord.demo();
          
    }
}