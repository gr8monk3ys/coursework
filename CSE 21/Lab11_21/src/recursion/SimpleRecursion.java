package recursion;

/*  This recursive method is a slightly augmented 
	version of the program in the last step: it only makes a recursive
	call under certain conditions. There are three calls that print to the 
	console. See if you can predict what will get printed and in what order.
 */
public class SimpleRecursion {

	// version 1
	public static void recur1(int k) {
		System.out.println("Entering recur with k = " + k);
		if (k <= 3) {
			System.out.println("Recursing with k = " + k);
			recur1(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	// version 2
	public static void recur2(int k) {
		System.out.println("Entering recur with k = " + k);
		System.out.println("count = " + k);
		if (k != 9) {
			recur2(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	// version 3
	public static void recur3(int k) {
		System.out.println("Entering recur with k = " + k);
		if (k == 5) {
			System.out.println("count = " + k);
			recur3(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	// version 4
	public static void recur4(int k) {
		System.out.println("Entering recur with k = " + k);
		if (k < 6) {
			System.out.println("count = " + k);
			recur4(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	// version 5
	public static void recur5(int k) {
		System.out.println("Entering recur with k = " + k);
		if (k == 7) {
			recur5(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	// version 6
	public static void recur6(int k) {
		System.out.println("Entering recur with k = " + k);
		if (k != 8) {
			System.out.println("count = " + k);
			recur6(k + 1);
		}
		System.out.println("Leaving recur with k = " + k);
	}

	public static void main(String[] args) {
		recur1(0);
		System.out.println();
		System.out.println("----------------------");
		System.out.println();
		recur2(0);
		System.out.println();
		System.out.println("----------------------");
		System.out.println();
		recur3(0);
		System.out.println();
		System.out.println("----------------------");
		System.out.println();
		recur4(0);
		System.out.println();
		System.out.println("----------------------");
		System.out.println();
		recur5(0);
		System.out.println();
		System.out.println("----------------------");
		System.out.println();
		recur6(0);
	}
}
