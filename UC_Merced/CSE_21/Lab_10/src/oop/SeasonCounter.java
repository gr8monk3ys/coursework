package oop;

public class SeasonCounter extends ModNCounter2 {

	private static String[] names = { "spring", "summer", "fall", "winter" };

	public SeasonCounter() {
		super(4);
	}

	@Override
	public String toString() {
		return names[myCount % 4];
	}
}
