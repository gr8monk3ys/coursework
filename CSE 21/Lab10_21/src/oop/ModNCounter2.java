package oop;

public class ModNCounter2 extends Counter {

	private int cycleLength;

	public ModNCounter2(int m) {
		cycleLength = m;
	}

	public int value() {
		return myCount % cycleLength;
	}
}
