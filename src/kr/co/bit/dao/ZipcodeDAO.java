package kr.co.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.bit.database.ConnectionManager;
import kr.co.bit.vo.ZipcodeVO;

public class ZipcodeDAO {

	public ArrayList<ZipcodeVO> searchDong(String dong){
		
		ArrayList<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		ZipcodeVO vo = null;
		ConnectionManager mgr = new ConnectionManager();
		Connection con = mgr.getConnetion();
		String sql = "Select * from ZIPCODE_TBL where dong like '%" + dong +"%'";
		PreparedStatement pstmt = null;
		
		
		if(con==null) {
			
			System.out.println("접속실패");
		}
		else if(con!=null) {
			try {
				pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				
					while(rs.next()) {
						
						vo= new ZipcodeVO();
						vo.setSeq(rs.getString(1));
						vo.setZipcode(rs.getString(2));
						vo.setSido(rs.getString(3));
						vo.setGugun(rs.getString(4)==null?"":rs.getString(4));
						vo.setDong(rs.getString(5));
						vo.setRi(rs.getString(6));
						vo.setBldg(rs.getString(7)==null?"":rs.getString(7));
						vo.setBunji(rs.getString(8)==null?"":rs.getString(8));
						list.add(vo);
					}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					
					mgr.connectClose(con,pstmt,null);
				}
		
			}
		return list;
	}
}
