package tests;

import static org.junit.Assert.*;

import oop.SeasonCounter;

import org.junit.Test;

import edu.berkeley.eduride.EduRideTest.Name;

public class SeasonCounterTest {

	@Test
	@Name("Initial values")
	public void testInitialValues() {
		SeasonCounter ctr = new SeasonCounter ( );
		assertEquals ("Wrong initial value for counter", "spring", ctr.toString());
		ctr.reset();
		assertEquals ("Wrong value for counter after reset", "spring", ctr.toString());
	}
	
	@Test
	@Name("Incrementing")
	public void testIncrementing() {
		SeasonCounter ctr;
		ctr = new SeasonCounter ( );

		ctr.increment();
		assertEquals ("Wrong value after one increment", "summer", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after two increments", "fall", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after three increments", "winter", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after four increments", "spring", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after five increments", "summer", ctr.toString());
	}
	

	@Test
	@Name("Resetting")
	public void testResetting() {
		SeasonCounter ctr;
		ctr = new SeasonCounter ( );
		for (int i=0;i<9;i++) {
			ctr.increment();
		}
		ctr.reset();
		assertEquals ("Wrong value for counter after reset", "spring", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after one increment", "summer", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after two increments", "fall", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after three increments", "winter", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after four increments", "spring", ctr.toString());
		ctr.increment();
		assertEquals ("Wrong value after five increments", "summer", ctr.toString());

	}

}
