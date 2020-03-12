package tests;

import static org.junit.Assert.assertEquals;
import oop.DecrementableCounter;

import org.junit.Test;

import edu.berkeley.eduride.EduRideTest.Description;
import edu.berkeley.eduride.EduRideTest.Name;
import edu.berkeley.eduride.EduRideTest.hideWhenSuccessful;

@Description("Tests for the decrementable counter")
public class DecrementableCounterTest {

	@Test
	@Name("Initial values")
	public void testInitialValues () {
		DecrementableCounter ctr;
		ctr = new DecrementableCounter();
		assertEquals ("Wrong initial value for counter", 0, ctr.value());
		
		ctr = new DecrementableCounter();		
		ctr.decrement();
		assertEquals ("Decrement should be ignored on a new counter", 0, ctr.value());

	}
			
	@Test
	@hideWhenSuccessful
	@Name("Increment")
	public void testIncrement () {
		DecrementableCounter ctr = new DecrementableCounter();
		
		ctr.increment();
		assertEquals ("Wrong value after one increments", 1, ctr.value());
		ctr.increment();
		assertEquals ("Wrong value after two increments", 2, ctr.value());	
	}
	
	
	@Test
	@Name("Decrement")
	public void testDecrement () {
		DecrementableCounter ctr;
		ctr = new DecrementableCounter();
		ctr.increment();
		ctr.increment();
		ctr.decrement();
		assertEquals ("Wrong value after two increments and a decrement", 1, ctr.value());
		ctr.decrement();
		assertEquals ("Wrong value after two increments and two decrements", 0, ctr.value());
		ctr.decrement();
		assertEquals ("Wrong value after two increments and three decrements", 0, ctr.value());
	}
	
	
	
	@Test
	@Name("Resetting")
	public void testResetting () {
		DecrementableCounter ctr;
		ctr = new DecrementableCounter();
		incrementAndReset(ctr);
		assertEquals("Decrement should be ignored on a reset counter", 0, ctr.value());

		ctr = new DecrementableCounter();
		incrementAndReset(ctr);
		ctr.increment();
		ctr.increment();
		ctr.decrement();
		assertEquals ("Wrong value after restting, two increments, and a decrement", 1, ctr.value());
		ctr.decrement();
		assertEquals ("Wrong value after restting, two increments, and two decrements", 0, ctr.value());
		ctr.decrement();
		assertEquals ("Wrong value after restting, two increments, and three decrements", 0, ctr.value());
	}
	
	
	private void incrementAndReset(DecrementableCounter ctr) {
		for (int i=0; i<7;i++) {
			ctr.increment();
		}
		ctr.reset();
	}
	
	
}
