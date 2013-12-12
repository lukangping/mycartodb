https://bugs.launchpad.net/ubuntu/+source/software-properties/+bug/516032

package com.huawei.demo.json;

public class Coordinate {

	public static double M_PI = Math.PI;
		//经纬度转墨卡托
		// 经度(lon)，纬度(lat)
	public static double[] lonLat2Mercator(double lon,double lat){
		double[] xy = new double[2];
		double x = lon *20037258.342789/180;
		double y = Math.log(Math.tan((90+lat)*M_PI/360))/(M_PI/180);
		y = y *20037258.34789/180;
		xy[0] = x;
		xy[1] = y;
		return xy;
	}
	
	//墨卡托转经纬度
	public static double[] Mercator2lonLat(double mercatorX,double mercatorY){
		double[] xy = new double[2];
		double x = mercatorX/20037258.34*180;
		double y = mercatorY/20037258.34*180;
		y= 180/M_PI*(2*Math.atan(Math.exp(y*M_PI/180))-M_PI/2);
		xy[0] = x;
		xy[1] = y;
		return xy;
	}
	
	public static void main(String[] args){
		double[] num = lonLat2Mercator(120.385222,36.061416);
		double x = num[0];
		double y = num[1];
		
		double[] lb = {x-25, y-25};
		double[] rb = {x+25, y-25};
		double[] rt = {x+25, y+25};
		double[] lt = {x-25, y+25};
		
		
		
		
		
		
		for(int i=0;i<num.length;i++)
		{
			System.out.println(num[i]);
		}
	// num = Mercator2lonLat(13401221.612072535,4309075.414032666);
	// for(int i=0;i<num.length;i++)
	// {
	// System.out.println(num[i]);
	// }
	}

}



package com.huawei.demo.json;

public class Geometry {
	
	String type;
	double[][][] coordinates;
	
	public Geometry(String type, double[][][] coordinates) {
		this.type = type;
		this.coordinates = coordinates;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double[][][] getCoordinates() {
		return coordinates;
	}
	public void setCoordinates(double[][][] coordinates) {
		this.coordinates = coordinates;
	}
	

}

package com.huawei.demo.json;

public class Property {
	
	int num;
	
	public Property(int num) {
		this.num = num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	

}


package com.huawei.demo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ImportData {

	public static void main(String[] args) {
		
		try {
			 
			Class.forName("org.postgresql.Driver");
//			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:mkyong", "username",
					"password");
//
//			String sql = "";  
//
//			Statement stmt = connection.createStatement();
//	        ResultSet rs = stmt.executeQuery(sql);
//	        while (rs.next()) {
//	            String coffeeName = rs.getString("COF_NAME");
//	            int supplierID = rs.getInt("SUP_ID");
//	            float price = rs.getFloat("PRICE");
//	            int sales = rs.getInt("SALES");
//	            int total = rs.getInt("TOTAL");
//	            System.out.println(coffeeName + "\t" + supplierID +
//	                               "\t" + price + "\t" + sales +
//	                               "\t" + total);
//        	}
			
			System.out.println("done.");

		} catch (Exception e) {
 
			e.printStackTrace();
			return;
 
		}

	}
	
}



package com.huawei.demo;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class JsonHelper {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		List list = new ArrayList();
		
		
		double[] a = {1, 2};
		double[] b = {3, 4};
		double[][] coord = {a, b};
		
		double[][][] coords = {coord};
		
		
		System.out.println(JSONArray.fromObject( coords ));
		
	}

}


