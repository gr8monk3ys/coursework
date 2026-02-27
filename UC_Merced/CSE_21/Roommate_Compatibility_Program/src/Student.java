
public class Student {

	String name;
	char gender;
	Date birthDate;
	Preference pref;
	boolean matched;

	public Student(String name, char gender, Date birthDate, Preference pref) {
		this.name = name;
		this.gender = gender;
		this.birthDate = birthDate;
		this.pref = pref;
	}

	public String getName() {
		return name;
	}

	public char getGender() {
		return gender;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public Preference getPref() {
		return pref;
	}

	public boolean getMatched() {
		return matched;
	}

	public void setMatched(boolean matched) {
		this.matched = matched;
	}

	public int compare(Student st) {
		int score = (60 - birthDate.compare(st.birthDate)) + (40 - pref.compare(st.pref));

		if (score < 0) {
			return 0;
		} else if (score >= 100) {
			return 100;
		}
		if (gender != st.gender) {
			return 0;
		}
		return score;
	}
}
