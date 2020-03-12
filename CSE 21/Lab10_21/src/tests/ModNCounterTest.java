package tests;

import static org.junit.Assert.assertEquals;
import oop.ModNCounter;

import org.junit.Test;

import edu.berkeley.eduride.EduRideTest.Name;

public class ModNCounterTest {

	@Test
	@Name("Initial values")
	public void testInitialValues() {
		ModNCounter ctr = new ModNCounter(3);
		assertEquals ("Wrong initial value for counter", 0, ctr.value());
		ctr = new ModNCounter(3);
		ctr.reset();
		assertEquals ("Wrong value for counter after reset", 0, ctr.value());
	}
	
	@Test
	@Name("Incrementing")
	public void testIncrementing() {
		ModNCounter ctr = new ModNCounter(3);
		ctr.increment();
		assertEquals ("Wrong value after one increment", 1, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after two increments", 2, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after three increments", 0, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after four increments", 1, ctr.value());
	}
	
	
	@Test
	@Name("Resetting")
	public void testResetting() {
		ModNCounter ctr = new ModNCounter(3);
		for (int i=1; i<7; i++) {
			ctr.increment();
		}
		ctr.reset();
		assertEquals ("Wrong value for incremented counter after reset", 0, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after one increment", 1, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after two increments", 2, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after three increments", 0, ctr.value());
	}

}
