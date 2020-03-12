package oop;

public class DecrementableCounter extends Counter {

	public void decrement() {
		myCount--;
		if (myCount <= 0) {
			myCount = 0;
		}
	}
}
