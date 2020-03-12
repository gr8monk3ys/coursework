package tests;

import static org.junit.Assert.assertEquals;
import oop.ModNCounter2;

import org.junit.Test;
 
import edu.berkeley.eduride.EduRideTest.Name;

public class ModNCounter2Test {

	@Test
	@Name("Initial values")
	public void testInitialValues() {
		ModNCounter2 ctr = new ModNCounter2(3);
		assertEquals ("Wrong initial value for counter", 0, ctr.value());
		ctr = new ModNCounter2(3);
		ctr.reset();
		assertEquals ("Wrong value for counter after reset", 0, ctr.value());
	}
	
	@Test
	@Name("incrementing")
	public void testIncrementing() {
		ModNCounter2 ctr = new ModNCounter2(3);
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
	@Name("resetting")
	public void testResetting() {
		ModNCounter2 ctr = new ModNCounter2(3);
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
