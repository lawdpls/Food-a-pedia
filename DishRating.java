import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DishRating {
		
		public HashMap<String, Double> rateTable = new HashMap<String, Double>();
		
		private ArrayList<String> res = new ArrayList<String>();
		private int count=0;
		private int dId;
		private int currentC;
		
	    @SuppressWarnings("resource")
		public static void main(String[] args) {

	    	new DishRating(1,3);
//	    	GetRelation test = new GetRelation();
//	    	test.start(10,11);
//	    	System.out.println(test.relativity);
	    	
//	    	Scanner in = new Scanner(System.in);
//	    	input = in.nextInt();
//	    	BuildRelation build = new BuildRelation(input);
	    }
	    
	    public DishRating(int c, int d) {
	    	this.currentC = c;
	    	this.dId = d;
	    	build();
	    }
	    
	    public void build() {
	    	
	    	Connection con = null;
	        PreparedStatement pst = null;
	        PreparedStatement pst2 = null;
	        ResultSet resList = null;
	        ResultSet rateList = null;

	        String url = "jdbc:mysql://127.0.0.1:3306/Fooda?useSSL=false";
	        String user = "root";
	        String password = "rime1990424";
	        
	        try {
	            
	            con = DriverManager.getConnection(url, user, password);
	            pst = con.prepareStatement("select distinct re.name from Restaurant re, Rating ra, Dish d where (d.Dish_Id = "+ dId +")and d.Dish_Id=ra.Dish_Id and ra.R_Id=re.R_Id");
	            resList = pst.executeQuery();
	            
	            pst2 = con.prepareStatement("select re.name, ra.Customer_Id, ra.CustomerRate from Restaurant re, Rating ra, Dish d where (d.Dish_Id="+ dId +")and d.Dish_Id=ra.Dish_Id and ra.R_Id=re.R_Id order by re.name");
	            rateList = pst2.executeQuery();
	            count = rateList.last() ? rateList.getRow() : 0;
	            rateList.beforeFirst();
	            
	            BuildRelation rela = new BuildRelation(currentC);
	            
//	            for (int i=0 ; i<count;i++){
//	            	rateList.next();
//	            	System.out.println(rela.relaTable.get(rateList.getInt(2)));
//	            }
	            
//	            String colname1 = meta.getColumnName(4);
	            while (resList.next()) {
	            	res.add(resList.getString(1));
	            }
	            resList.beforeFirst();
	            
	            for (int i=0; i<res.size(); i++) {
	            	double rate = 0;
	            	double divider = 0;
	            	rateList.beforeFirst();
	            	for (int j=0; j<count; j++) {
	            		rateList.next();
	            		if (res.get(i).equals(rateList.getString(1)) && rateList.getInt(2) != currentC) {
	            			rate += rateList.getInt(3)*rela.relaTable.get(rateList.getInt(2));
	            			divider += rela.relaTable.get(rateList.getInt(2));
//	            			System.out.println(rateList.getInt(2));
	            		}
	            	}
	            	rate = rate/divider;
	            	rateTable.put(res.get(i), rate);
	            }

	            System.out.println(rateTable);
	            
	            
	        } catch (SQLException ex) {
	                Logger lgr = Logger.getLogger(GetRelation.class.getName());
	                lgr.log(Level.SEVERE, ex.getMessage(), ex);

	        } finally {

	            try {
	                if (resList != null) {
	                    resList.close();
	                }
	                if (rateList != null) {
	                    rateList.close();
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

