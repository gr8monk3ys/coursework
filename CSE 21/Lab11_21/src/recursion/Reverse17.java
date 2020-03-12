package recursion;

public class Reverse17 extends Reverse16 {

	// Assume there is a correct reverse16 method (inherited from Reverse16)

	// Fill-in reverse17 using the result of a call to reverse16
	public String reverse17(String s) {
		
		if (s.length() == 1) {
			return s.toString();
		} else {
			return reverse17(allButFirst(s)) + s.charAt(0);
		}
	}

	//////// HELPER METHODS YOU MIGHT FIND USEFUL

	// Returns a string containing all the characters except the first
	public static String allButFirst(String s) {
		return s.substring(1);
	}

	// returns a string containing all the characters except the last
	public static String allButLast(String s) {
		return s.substring(0, s.length());
	}

	// Use this to test your reverse17 method by running this class manually
	public static void main(String[] args) {
		Reverse17 obj = new Reverse17();
		System.out.println(obj.reverse17("disinterestedness"));
		System.out.println(obj.reverse17("uniformitarianism "));
		System.out.println(obj.reverse17("pseudohydrophobia"));
	}

}
