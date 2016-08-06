package exercise;

import java.util.List;
import java.util.Map;

public interface ExerciseDao {
	
	public int searchPart(int part);
	
	public List<Map<String, Object>> selectExerciseList(int part_id);
	
}
