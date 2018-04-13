package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.bit.database.ConnectionManager;
import kr.co.bit.vo.MemberVO;

public class MemberDAO {
	
	
	public MemberVO searchById(String id) {
		
		ConnectionManager mgr = new ConnectionManager();
		Connection con =  mgr.getConnetion();
		Statement stmt = null;
		String sql = "select * from member_tbl where user_id= '"+id+"'";
		MemberVO vo = null;
		
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setPw(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setZipcode(rs.getString(5));
				vo.setAddr1(rs.getString(6));
				vo.setAddr2(rs.getString(7));
				vo.setTool(rs.getString(8));
				String temp = rs.getString(9);
				String[] langs = temp.split("-");
				String[] blank = {"","","",""};
				for(String lang : langs) {
					int n = Integer.parseInt(lang);
					blank[n] = lang;
				}
				vo.setLangs(blank);
				vo.setProject(rs.getString(10));
				
			}
			
			mgr.connectClose(con,stmt,rs);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	

		return vo;
	}
	
}
