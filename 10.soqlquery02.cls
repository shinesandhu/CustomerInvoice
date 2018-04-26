public class soqlquery02
{
    public static void demo()
    {
        //We'll be creating an Invoice__c record and linking it to Customer__c = Philips
        //Their is a Master-Detail relationship field on Invoice__c object called Customer__c
        Invoice__c inv = new Invoice__c();
        inv.Customer__c = [select id from Customer__c where name = 'Philips' limit 1].id;
        inv.Status__c = 'Pending';
        insert inv;
        
        System.debug('New Invoice record is '+inv);
    }
    //soqlquery02.demo();
}