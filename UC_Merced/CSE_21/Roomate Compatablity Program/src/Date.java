
public class Date {

	int year;
	int month;
	int day;

	public Date(int year, int month, int day) {
		if (1900 <= year && year >= 3000) {
			this.year = year;
		}
		if (1 <= month && month >= 12) {
			this.month = month;
		}
		if (1 <= day && day >= 31) {
			this.day = day;
		}
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDay() {
		return day;
	}

	public int compare(Date dt) {
		int yearsDifferenceInDays = Math.abs(dayOfYear() - dt.getYear()) * 365;
		int daysDifference = yearsDifferenceInDays / 30;
		int totalDifference = yearsDifferenceInDays - daysDifference;
		return totalDifference;
	}
	public int dayOfYear() {
		int totalDays = 0;
		switch (month) {
		case 12: totalDays += 30;
		case 11: totalDays += 31;
		case 10: totalDays += 30;
		case 9 : totalDays += 31;
		case 8 : totalDays += 31;
		case 7 : totalDays += 30;
		case 6 : totalDays += 31;
		case 5 : totalDays += 30;
		case 4 : totalDays += 31;
		case 3 : totalDays += 28;
		case 2 : totalDays += 31;
		}
		totalDays += day;
		return totalDays;
		}	
}