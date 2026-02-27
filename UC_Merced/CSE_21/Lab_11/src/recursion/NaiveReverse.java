package recursion;

/* Some naive solutions to reverse a string. You should fill-in reverse6 below.
 *
 * Reminder: s.substring(n1, n2) returns the string that starts at position n1
 * and ends at position (n2-1). For example, if s contains the string "abcde",
 * s.substring(1, 4) returns "bcd".
 */
public class NaiveReverse {

	// Returns the reverse of a string of length 1 (trivial).
	public String reverse1(String s) {
		return s;
	}

	// Returns the reverse of a string of length 2.
	public String reverse2(String s) {
		return (s.substring(1, 2) + s.substring(0, 1));
	}

	// Returns the reverse of a string of length 3.
	public String reverse3(String s) {
		return (s.substring(2, 3) + s.substring(1, 2) + s.substring(0, 1));
	}

	// ... reverse4 and reverse5 will be similar

	// Fill-in reverse6, which takes a String of length 6 and returns its reverse.
	// Do not use while or for loops.
	public String reverse6(String s) {
		return (s.substring(0, 1) + s.substring(1, 2) + s.substring(2, 3) + s.substring(3, 4) + s.substring(4, 5)
				+ s.substring(5, 6));

	}

	// ... and more could go here... reverse612() would be awfully long...

	// Use this to test your reverse methods by running this class manually
	public static void main(String[] args) {
		NaiveReverse obj = new NaiveReverse();
		System.out.println(obj.reverse1("A"));
		System.out.println(obj.reverse2("21"));
		System.out.println(obj.reverse3("CSE"));
		System.out.println(obj.reverse6("course"));
	}

}
