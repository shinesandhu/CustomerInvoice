public class undeleterecord
{
    public static void demo()
    {
        //For Undeleting the records must be in Recycle bin
        // ALL ROWS search Parent and Child records. Also checks for deleted or archived records
        List<Customer__c> undeleteList = [select id, name from Customer__c where name like 'Nike%' all rows];
        undelete undeleteList;
        System.debug('Records undeleted? '+undeleteList.size());
        //Open Execute Anonymous Window, undeleterecord.demo();  
    }
}