package DAO;

import common.JDBConnect;
import dto.MemberDTO;

//JDBConnect상속
public class MemberDAO extends JDBConnect {

	public MemberDAO() {
		super();
	}
	//checkMember메서드
	public String checkMember(String id) {
		// 검색한다 id를 멤버테이블에서 조건은 내가넣는 id값일때
		String sql = "select id from member where=id"; 
		// return할 String타입 result
		String result = "";
		try {
			// psmt에 member2에 접속한 데이테베이스의 세팅한 sql구문을만들고 동적쿼리문 으로 생성한후 삽입
			psmt = con.prepareStatement(sql);
			// 만들어진 member2데이터베이스와 연동된 곳에 ? 자리 1번쨰에 파라미터로 넘겨받은 id값을 세팅
			psmt.setString(1, id);
			// 동적쿼리문의 실행결과를 저장하기위한 ResultSet객체의 저장
			// exectueQuert()-쿼리실행메서드
			rs = psmt.executeQuery();
			// rs에담긴 요소가 없을때까지 도는 while문
			// rs에 담긴요소가 없을때까지 String id2자리에 rs줄의 첫번쨰 칼럼으로 설정해둔 id칼럼을 끌어와서
			// Stringid2에 담고 그걸로넘겨받은 파라미터와 같을시에 result의기존회원이라는 문자열을 담고 브레이크 후 리턴
			while (rs.next()) {
				
				String id2 = rs.getString(1);
				if (id.equals(id2)) {
					result = "기존회원";
					break;
				}
				result = "";
			}

		} catch (Exception e) {
			System.out.println("오류" + e.getMessage());
		}
		return result;
	}
	// member2테이블에 9개 필드값 파라미터 받고 추가하는메서드
	public void insertMember(String id, String password, String name, String gender, String birth, String mail,
			String phone, String address, String registday) {
		// 멤버테이블벨류값을?*9개설정해두고 insert into구문으로 넣는 sql문
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";

		try {
			// con=데이터베이스member2
			// 그안에 prepareStatement로 위에세팅해놓은 sql구문넣어서 만든후 psmt객체의 저장.
			// 물음표 순서대로 인덱스 번호와 필드값의 순서에 맞춰 삽입후
			// 테이블의 변화를 주었기때문에 executeUpdate()메서드로 실행
			// 이때 executeUpdate()메서드는 추가되는 행이나 열의 결과를 int타입으로 반환함
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			psmt.setString(3, name);
			psmt.setString(4, gender);
			psmt.setString(5, birth);
			psmt.setString(6, mail);
			psmt.setString(7, phone);
			psmt.setString(8, address);
			psmt.setString(9, registday);
			psmt.executeUpdate();
			System.out.println("회원추가 성공");

		} catch (Exception e) {
			System.out.println("데이터 추가 실패." + e.getMessage());
		}
	}
	//파라미터로 받는 id와 pw로 비교하기
	public String loginMember(String id, String pw) {
		//리턴시킬 String타입 result;
		String result = "";
		// set으로 저장시키고 get으로 불러올 dto객체
		MemberDTO dto = new MemberDTO();
		// 실행할 쿼리구문, "검색한다 모든요소를 멤버 테이블에서 id가 내가정하는값이면서 패스워드가 일치할시."
		String qery = "select * from member where id =? and password=?";
		try {
			//psmt객체의 con으로 member2테이블과연동한 데이터베이스에서 prepareStatement문을이용해서(quey)값을
			//넣고생성
			psmt = con.prepareStatement(qery);
			// ?자리에 id,pw를 인덱스순서에맞게따라기입
			psmt.setString(1, id);
			psmt.setString(2, pw);
			// 단순검색문이기때문에 executeQuery();
			// 실행요소후 검색결과후 rs에 저장.
			rs = psmt.executeQuery();
			//만약 rs에읽을요소가있다면.
			if(rs.next()) {
				//dto새로운 객체의 id값을 칼럼으로 받아와서 다시 세팅시킴.
				//dto새로운 객체의 pw값을 칼럼으로 받아와서 다시 세팅시킴.
				dto.setId(rs.getString(1));
				dto.setPassword(rs.getString(2));
				// 리턴할result타입에"로그인성공" 담기
				result="로그인성공";
			}else {
				//아니면 null값담기
				result="";
			}

		} catch (Exception e) {
			System.out.println("같은 아이디값 불러오지못함\n" + e.getMessage());
		}
		//마지막리턴
		return result;
	}
}
