import java.sql.*;
import java.util.Scanner;
import java.util.*;


public class Assignment9 {
	static final String DB_URL = "jdbc:mysql://10.10.12.108/TE31123db";  //Database Name 
	   static final String USER = "te31123";//Username
	   static final String PASS = "te31123";//Password
	   static final String QUERY = "SELECT Book_id, Title, Edition, noofcopies FROM lib_table";	
	public static void main(String arg[])
	{
		Connection connection=null;
		Statement stmt = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(DB_URL,USER,PASS);
			Statement statement;
			//A Statement object represents a primitive statement in which a single method is applied to a target and a set of arguments
			statement =connection.createStatement();
			ResultSet resultSet;
			
			//Create
			
			//table created!
			
			//Insert
			
			Statement st=connection.createStatement(); 
			String query1="INSERT INTO `TE31123db`.`lib_table` (`Book_id`, `Title`, `Edition`, `Noofcopies`)"
					+ " VALUES ('FH125', 'OOPs', '2021', '56')";
			st.executeUpdate(query1);
			System.out.println("Data inserted..");
			
			 //Inserted
			
			//Delete
			
//			stmt = (Statement) connection.createStatement();
//	          String query2 = "delete from  lib_table " +
//	          "where Book_id='GH901'";
//	          stmt.executeUpdate(query2);
//	          System.out.println("Record is deleted from the table successfully..................");
	          
			//Deleted
	          
	          //Update
	         
	          //Updated
	               
	               //Display 
			
			//Displayed!
			
			
//			Connection conn=DriverManager.getConnection(url,)
			
            statement.close();
            connection.close();
            Scanner sc=new Scanner(System.in);
            while(true) {
            	System.out.println("Menu-\n1.Create Table\n2.Read Table\n3.Update Table\n4.Delete Table\n5.Exit");
                System.out.println("Enter the choice - ");
                int ch=sc.nextInt();
                if(ch==1) {
                	System.out.println("Enter the Name of table - ");
                	String tablename=sc.next();
                	System.out.println("Enter the Number of Column in Table - ");
                	int n=sc.nextInt();
                	String query="CREATE TABLE "+ tablename+"(";
                	String column[]=new String[n];
                	for(int i=0;i<n;i++) {
                		System.out.println("Enter the Name of Column - ");
                		column[i]=sc.next();
                		System.out.println("Enter the Datatype for Column - ");
                		String Datatype=sc.next();
                		if(i!=n-1) {
                			query+=column[i]+" "+Datatype+" , ";
                			
                		}else {
                			query+=column[i]+" "+Datatype;
            			}
                	}
                	query+=");";
                	Statement s = connection.createStatement();  
        			s.execute(query);
        			System.out.println("Table Created...");
                }
                else if(ch==2) {
                	System.out.println("Enter the Name of Table to Read - ");
                	String tablename=sc.next();
        			resultSet=statement.executeQuery("SELECT *FROM "+tablename+";");
        			String Book_id;
        			String Title,Edition;
        			int Noofcopies;
        			while(resultSet.next()) {
        				Book_id=resultSet.getString("Book_id");
        				Title=resultSet.getString("Title").trim();
        				//trim() The trim() method removes whitespace from both ends of a string and returns a new string, without modifying the original string.
        				Edition=resultSet.getString("Edition");
        				Noofcopies=resultSet.getInt("Noofcopies");
        				System.out.println("Bood_id : "+ Book_id + " Title: " + Title  + " Edition: " + Edition + " Noofcpoies: "  + Noofcopies);
        			}
        			resultSet.close();
                }
                else if(ch==3) {
                	System.out.print("Enter the Name of Table to be Updated - ");
					String tableName = sc.next();
					String readTableQuery = "SELECT * FROM " + tableName + ";";
					resultSet = statement.executeQuery(readTableQuery);
					ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
					int colCount = resultSetMetaData.getColumnCount();
					for(int i=1; i<=colCount; i++) {
						System.out.print(i + " " + resultSetMetaData.getColumnName(i)+"\t"); 
					}
					System.out.println("Select the column Need to be updated - ");
					int colToUpdate = sc.nextInt();
					System.out.println("Enter the updated value - ");
					String afterUpdate = sc.next();
					System.out.println("Enter the updation rule - ");
					String updateRule = sc.next();
					String updateTableQuery = "UPDATE " + tableName + " SET " + 
					resultSetMetaData.getColumnName(colToUpdate) + "=" +  afterUpdate + " WHERE " +
					updateRule;
					System.out.println(updateTableQuery);
					statement.executeUpdate(updateTableQuery);
                }else if(ch==4) {
                	System.out.println("Enter the Book Id to Delete the Record - ");
                	String bookid=sc.next();
                	//Delete
        			stmt = (Statement) connection.createStatement();
        	          String query2 = "delete from  lib_table " +
        	          "where Book_id="+bookid;
        	          stmt.executeUpdate(query2);
        	          System.out.println("Record is deleted from the table successfully..................");
        			//Deleted
                	
                }else if(ch==5){
                	System.out.println("Exit");
					break;
                }
            }
		}
		catch (Exception exception) {
            System.out.println(exception);
        }
	} // function ends
} // class ends