package oop;

/**
 * A counter class that cycles its internal value back to 0 when it reaches a
 * maximum value.
 * 
 * e.g., A (new) ModNCounter with a cycleLength (maximum) of 5 will have an
 * internal value of 2 after increment() is called 7 times
 */
public class ModNCounter extends Counter {

	private int cycleLength;

	public ModNCounter(int n) {
		cycleLength = n;
	}

	public void increment() {
		if (cycleLength >= myCount) {
			reset();
		} else if (cycleLength <= myCount) {
			cycleLength++;
		}
	}
}