package com.avatar.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.avatar.web.entity.MemberClass;
import com.avatar.web.entity.MemberClassView;

public interface MemberClassDao {
	int insert(String memberId, String classId);

	String getClassId(String id);
	
	List<MemberClassView> getList(String classId);
	List<MemberClassView> getListPage(@Param("classId")String classId, @Param("page")int page, @Param("field")String field, @Param("query")String query);
	List<MemberClassView> getMemberList(int page, String field, String query);
	
	int getMemberCount();
	
	MemberClassView getHeader(String sessionId);

	MemberClassView getClassInfo(String id);

	int getStuCount(String classId);

	int updateDefaultClass(@Param("openerId")String openerId, @Param("classId")String classId);

	int getDefaultClass(@Param("openerId")String openerId);
	String getClassName(String classId);

	int updateSeatNo(String memberName, int seatNo);

	int getClassEmpty(String memberId);

	MemberClassView get(String memberId);

}
