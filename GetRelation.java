import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GetRelation {
    
    public int count = 0;
    public double relativity = 0;
    public ArrayList<Integer> u1 = new ArrayList<Integer>();
    public ArrayList<Integer> u2 = new ArrayList<Integer>();
    	
    public void start(int q, int w) {
    
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://*URL*/*DBName*?useSSL=false";
        String user = *Your Username*;
        String password = *Your Password*;

        try {
            
            con = DriverManager.getConnection(url, user, password);
            pst = con.prepareStatement("select tag.* from(select r.* from rating r where r.Dish_Id in (select r2.Dish_Id from Rating r2 where r2.Customer_Id = "+ q +") and r.R_Id in (select r3.R_Id from Rating r3 where r3.Customer_Id = "+ q +") and (r.Customer_Id = "+ q +" or r.Customer_Id = "+ w +"))as tag inner join (select r.Dish_Id, r.R_Id from rating r where r.Dish_Id in (select r2.Dish_Id from Rating r2 where r2.Customer_Id = "+ q +") and r.R_Id in (select r3.R_Id from Rating r3 where r3.Customer_Id = "+ q +") and (r.Customer_Id = "+ q +" or r.Customer_Id = "+ w +") group by Dish_Id, R_Id Having Count(*) > 1) as gag on tag.Dish_Id=gag.Dish_Id and tag.R_Id=gag.R_Id");
            rs = pst.executeQuery();
            count = (rs.last() ? rs.getRow() : 0)/2;
            
            ResultSetMetaData meta = rs.getMetaData();

            String colname1 = meta.getColumnName(4);
//            System.out.println(colname1 + '\n');
//            System.out.println(count);
            
            rs.beforeFirst();
            for (int i=0; i<count; i++) {
            	rs.next();
            	rs.next();
            	u1.add(Integer.parseInt(rs.getString(4)));
            }
            
            rs.beforeFirst();
            rs.next();
            for (int i=0; i<count; i++) {
            	u2.add(Integer.parseInt(rs.getString(4)));
            	rs.next();
            	rs.next();
            }
            
            for (int i=0; i<count; i++) {
            	relativity += (5.0 - Math.abs(u1.get(i)-u2.get(i)))/5.0;
            }
            relativity /= count;
//            System.out.println(relativity);
            
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
