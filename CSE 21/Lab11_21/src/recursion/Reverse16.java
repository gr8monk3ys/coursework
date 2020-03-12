package recursion;

public class Reverse16 {

	public String reverse16(String s) {
		// This is the *bad* way to write reverse!  
		// You'll do better with reverse17, right?
		return s.substring(15, 16) +
				s.substring(14, 15) +
				s.substring(13, 14) +
				s.substring(12, 13) +
				s.substring(11, 12) +
				s.substring(10, 11) +
				s.substring(9, 10) +
				s.substring(8, 9) +
				s.substring(7, 8) +
				s.substring(6, 7) +
				s.substring(5, 6) +
				s.substring(4, 5) +
				s.substring(3, 4) +
				s.substring(2, 3) +
				s.substring(1, 2) +
				s.substring(0, 1);
	}
}
