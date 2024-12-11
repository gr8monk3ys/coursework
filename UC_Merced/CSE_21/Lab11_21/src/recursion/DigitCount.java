package recursion;

public class DigitCount {

	public static void main(String[] args) {
		int num = 1;
		for (int i = 1; i < 14; i++) {
			num = num * i;
			System.out.println("Digit count of " + num + " is: " + digitCount(num));
		}
	}

	// Fix the bug in digitCount, so that it returns correct values.
	// You only need to change one line.
	public static int digitCount(int value) {
		if (value == 0) {
			return 0;
		} else {
			return 1 + digitCount(value / 10);
		}
	}
}
