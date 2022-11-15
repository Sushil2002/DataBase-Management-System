import java.util.*;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
public class MongoConnectivity {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			/*->*/MongoClient mongoClient = new MongoClient("localhost");
            String dbName = "t31123db";  //Database Name
            System.out.println("Database: " + dbName);
           /*->*/ DB db = mongoClient.getDB(dbName);
            String collectionname = "Students";
            System.out.println("Collection name : Students");
            /*->*/DBCollection s = db.getCollection(collectionname);
            Scanner sc = new Scanner(System.in);
            int opt = 0;
            while(opt!=5)
            {
            	System.out.println("------MENU------");
            	System.out.println("1. Insert in collection");
            	System.out.println("2. Read from collection");
            	System.out.println("3. Update in collection");
            	System.out.println("4. Delete from collection");
            	System.out.println("5. EXIT");
            	opt = sc.nextInt();
            	if(opt==1)
            	{
            		System.out.println("Enter the roll no of student : ");
            		int rol = sc.nextInt();
            		System.out.println("Enter the name of student : ");
            		String name = sc.next();
            		System.out.println("Enter the class of student : ");
            		String cls = sc.next();
            		BasicDBObject document = new BasicDBObject();
//            		BasicDBObject->append(String key, Object val) Add a key/value pair to this object
        	        document.append("Rollno", rol);
        	        document.append("Name", name);
        	        document.append("Class", cls);
        	        s.insert(document);
        	        System.out.println("Document inserted successfully");
            	}
            	else if(opt == 2)
            	{
            		System.out.println("\nEnties in Students collection :");
                    DBCursor cur = s.find();
                    while(cur.hasNext())
                    {
                    	System.out.println(cur.next());
                    }
            	}
            	else if(opt == 3)
            	{
            		System.out.println("Enter the roll no of student :");
            		int rol = sc.nextInt();
            		BasicDBObject document = new BasicDBObject();
        	        document.append("Rollno", rol);
            		DBCursor cur = s.find(document);
            		System.out.println("\nEntry Details : ");
            		System.out.println(cur.next());
            		System.out.println("\nEnter the new name of student : ");
            		String name = sc.next();
            		BasicDBObject docu = new BasicDBObject("$set", new BasicDBObject().append("Name", name));
        	        s.update(document, docu);
        	        System.out.println("Document updated successfully");
            	}
            	else if(opt == 4)
            	{
            		System.out.println("Enter the roll no of student : ");
            		int rol = sc.nextInt();
            		BasicDBObject document = new BasicDBObject();
        	        document.append("Rollno", rol);
            		DBCursor cur = s.find(document);
            		System.out.println("\nEntry Details : ");
            		System.out.println(cur.next());
            		s.remove(document);
            		System.out.println("Document deleted successfully");
            	}
            	else
            	{
            		System.out.println("THANKYOU");
            		break;
            	}
            	System.out.println("\n");
            }
            mongoClient.close();
            sc.close();
             
        } 
		catch (Exception ex) {
			System.out.println(ex);
        }

	}

}
