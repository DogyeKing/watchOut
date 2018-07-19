package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			System.out.println("DBCP 연결 성공");
		} catch (Exception e) {
			System.out.println("DBCP 연결 오류");
			e.printStackTrace();
		}
	}

	// 페이징 10개씩
	public ArrayList<Board> getList(int pageNum) {
		String sql = "SELECT BDID, BDTITLE, MEMID, BDDATE, BDCONTENT, " + "PAGECOUNT "
				+ "FROM(SELECT /*+INDEX_DESC(BOARD_WO BOARD_WO_PK)"
				+ " */BDID, BDTITLE, MEMID, BDDATE, BDCONTENT, ROWNUM PAGECOUNT "	
				+ "FROM BOARD_WO WHERE BDID > 0 AND ROWNUM <= ? AND BDUSED = 1) WHERE " + "PAGECOUNT > ?";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum * 10);
			pstmt.setInt(2, pageNum * 10 - 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { // return boolean
				Board board = new Board();
				board.setBdID(rs.getInt("bdID"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setMemID(rs.getString("memID"));
				board.setBdDate(rs.getString("bdDate"));
				board.setBdContent(rs.getString("bdContent"));
				list.add(board);
			}
		} catch (Exception e) {
			System.out.println("getList sql error");
			e.printStackTrace();
			return null;
		}
		return list;
	}

	public int write(Board board) {
		String sql = "INSERT INTO BOARD_WO VALUES(board_seq.nextval, ?, ?, sysdate, ?, 1, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getMemID());
			pstmt.setString(3, board.getBdContent());
			pstmt.setString(4, board.getBdIP());
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			System.out.println("write sql error");
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public boolean nextPage(int pageNum) {
		String sql = "SELECT BDID, BDTITLE, MEMID, BDDATE, BDCONTENT, " + "PAGECOUNT "
				+ "FROM(SELECT /*+INDEX_DESC(BOARD_WO BOARD_WO_PK)"
				+ " */BDID, BDTITLE, MEMID, BDDATE, BDCONTENT, ROWNUM PAGECOUNT "
				+ "FROM BOARD_WO WHERE BDID > 0 AND ROWNUM <= ? AND BDUSED = 1) WHERE " + "PAGECOUNT > ?";
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum * 10);
			pstmt.setInt(2, pageNum * 10 - 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("nextPage sql error");
			e.printStackTrace();

		}
		return false;
	}

	public Board getBoard(int bdID) {
		String sql = "SELECT * FROM BOARD_WO WHERE BDID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bdID); // 첫번째 물음표
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Board board = new Board();
				board.setMemID(rs.getString("memID"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setBdDate(rs.getString("bdDate"));
				board.setBdContent(rs.getString("bdContent"));
				return board;
			}
		} catch (Exception e) {
			System.out.println("getBoard sql error");
			e.printStackTrace();
		}
		return null;
	}

	public int delete(int bdID) {
		String sql = "UPDATE BOARD_WO SET BDUSED = 0 WHERE BDID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bdID);
			pstmt.executeUpdate();
			return 1; // 정상
		} catch (Exception e) {
			System.out.println("delete sql error");
			e.printStackTrace();
		}

		return -1; // 실패
	}

	public int update(Board board) {

		String sql = "UPDATE BOARD_WO SET BDTITLE = ?, BDCONTENT = ? WHERE BDID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getBdContent());
			pstmt.setInt(3, board.getBdID());
			pstmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			System.out.println("update sql error");
			e.printStackTrace();
		}

		return -1; // 실패
	}
	
	public ArrayList<Board> getRealTimeData() {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT BDID, BDTITLE, memID, RANK\r\n" + 
				"FROM (\r\n" + 	
				"SELECT BDID, BDTITLE, memID, RANK() OVER(ORDER BY BDID DESC) RANK\r\n" + 
				"FROM BOARD_WO where BDUSED = 1\r\n" + 
				"ORDER BY BDID DESC\r\n" + 
				")\r\n" + 
				"WHERE RANK < 4 ";
		
		System.out.println("getRealTime : "+sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setBdID(rs.getInt("bdID"));
				b.setBdTitle(rs.getString("bdTitle"));
				b.setMemID(rs.getString("memID"));
				list.add(b);
			}
			pstmt.close();
			rs.close();
			conn.close();
			return list;
			
		} catch (Exception e) {
			System.out.println("에러 나네?");
			e.printStackTrace();
		}
		return null;
	}
     
		
	
				
		
	
	// 게시물 검색하기
	   public ArrayList<Board> search(String content){
	        ArrayList<Board> list = new ArrayList<Board>();
	        String sql = "SELECT *\r\n" + 
	              "FROM BOARD_WO\r\n" + 
	              "WHERE MEMID = LOWER(?) OR MEMID = UPPER(?) OR BDCONTENT LIKE ? OR BDTITLE LIKE ?" ;            
	        try {
	           pstmt = conn.prepareStatement(sql);
	           pstmt.setString(1, content);
	           pstmt.setString(2, content);
	           pstmt.setString(3, "%"+content+"%");
	           pstmt.setString(4, "%"+content+"%");
	           rs = pstmt.executeQuery();
	           while(rs.next()) {
	              Board board = new Board();
	              board.setBdID(rs.getInt("bdID"));
	              board.setBdTitle(rs.getString("bdTitle"));
	              board.setMemID(rs.getString("memID"));
	              board.setBdDate(rs.getString("bdDate"));
	              board.setBdContent(rs.getString("bdContent"));
	              list.add(board);
	           }
	        } catch (Exception e) {
	           System.out.println("searchID sql error");
	           e.printStackTrace();
	           return null; //오류나면 null뜸
	        }      
	        return list;
	     }         

}
