package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
   
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public MemberDAO() {
      try {
         Context initContext = new InitialContext();
         Context envContext  = (Context)initContext.lookup("java:/comp/env");
         DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
         conn = ds.getConnection();
         System.out.println("DBCP 연결 성공");
      } catch (Exception e) {
         System.out.println("DBCP 연결 오류");
         e.printStackTrace();
      }         
   }
   
   public int join(Member member) {
      String sql ="INSERT INTO MEM VALUES(?,?,?,?,?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member.getMemID());
         pstmt.setString(2, member.getMemPW());
         pstmt.setString(3, member.getMemName());
         pstmt.setString(4, member.getMemGender());
         pstmt.setString(5, member.getMemEmail());
         pstmt.executeUpdate();//commit 이랑 같음         
          return 1; //회원가입 성공
      } catch (Exception e) {
         System.out.println("join sql error");
         e.printStackTrace();
      }
      return -1; //DB 오류      
   }
   
   public int login(String memID, String memPW) {
      String sql ="SELECT MEMPW FROM MEM WHERE MEMID = '"+memID+"' and MEMPW = '"+memPW+"'" ;
      System.out.println("login sql : "+sql);
      
      try {
         Statement stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         if(rs.next()) {//next쓰면 한칸 내려옴, 많이내릴려면 while을 돌려야함
            return 1;//로그인 성공
         }else {
            return 0;//로그인 실패
         }
      } catch (Exception e) {
         System.out.println("login sql error");
         e.printStackTrace();
      }
      return -2;//DB 오류
   }
   
   //이름, 성별, 이메일
   public Member select(String memID) { 

      String sql ="SELECT MEMNAME, MEMGENDER, MEMEMAIL FROM MEM WHERE MEMID = ?";
      try {
         pstmt = conn.prepareStatement(sql);//DB 연결
         pstmt.setString(1, memID);//?에 넣는 값
         rs = pstmt.executeQuery();//DB에서 가져온 결과를 rs에 담아 놓음
         
         //rs의 커서가 0번지에 있음.
         //rs.next() 함수 호출 커서가 1씩 증가
         //return boolean(true, false)
         if(rs.next()) { //데이터가 1행 이상이라면 while사용
        	 Member m = new Member();	 
        	 m.setMemName(rs.getString("MEMName"));
        	 m.setMemGender(rs.getString("MEMGender"));
        	 m.setMemEmail(rs.getString("MEMEmail"));
        	 return m;
         }
         
           
      } catch (Exception e) {
         System.out.println("select sql error");
         e.printStackTrace();
      }
      return null;
   }
}