package kr.com.ezen.mapper;

import org.apache.ibatis.annotations.Select;

public interface MemberMapper {
	
	@Select("select sysdate from dual")
	public void getTime();
}
