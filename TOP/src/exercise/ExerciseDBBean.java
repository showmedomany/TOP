package exercise;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class ExerciseDBBean implements ExerciseDao {

	@Override
	public int searchPart(int part) {
		return SqlMapClient.getSession().selectOne("Exercise.searchPart", part);
	}

	@Override
	public List<Map<String, Object>> selectExerciseList(int part_id) {
		return SqlMapClient.getSession().selectList("Exercise.selectExerciseList", part_id);
	}
	
}
