import java.util.HashMap;
import java.util.Scanner;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BuildRelation {
	
	static HashMap<Integer, Double> relaTable = new HashMap<Integer, Double>();
	static ArrayList<Integer> others = new ArrayList<Integer>();
	static int cCount = 0;
	static int input = 0;
	
    @SuppressWarnings("resource")
	public static void main(String[] args) {

//      GetRelation test = new GetRelation();
//    	test.start(1,5);
//    	System.out.println(test.relativity);
    	
    	Scanner in = new Scanner(System.in);
    	input = in.nextInt();
    	BuildRelation build = new BuildRelation();
    	build.build(input);
    }
    
    public void build(int in) {
    	
    	Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String url = "jdbc:mysql:"URL"?useSSL=false";
        String user = "Your Username";
        String password = "Your PW";
        
        try {
            
            con = DriverManager.getConnection(url, user, password);
            pst = con.prepareStatement("select Customer_Id from Customer");
            rs = pst.executeQuery();
            cCount = rs.last() ? rs.getRow() : 0;
            rs.beforeFirst();
            
//            ResultSetMetaData meta = rs.getMetaData();

//            String colname1 = meta.getColumnName(4);
            for (int i=0; i<cCount; i++) {
            	rs.next();
            	if (rs.getInt(1) != in) {
            		others.add(rs.getInt(1));
            	}
            }
            
            for (int i=0; i<others.size(); i++) {
            	GetRelation test = new GetRelation();
            	test.start(in, others.get(i));
            	relaTable.put(others.get(i), test.relativity);
            }
            System.out.println(relaTable);
            
            
        } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(GetRelation.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(GetRelation.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
            }
        }
    	
    }
}
