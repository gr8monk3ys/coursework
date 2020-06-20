package oop;

public class Counter {

	public int myCount = 0;

	public void increment() {
		myCount++;
	}

	public int value() {
		return myCount;
	}

	public void reset() {
		myCount = 0;
	}

}
