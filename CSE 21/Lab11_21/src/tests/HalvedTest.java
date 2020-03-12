package tests;

import static org.junit.Assert.*;
import org.junit.Test;
import recursion.Halved;

public class HalvedTest extends edu.berkeley.eduride.EduRideTest {



	public class HRecursionTest extends Halved {
		public int called = 0;
		public int halved(int n) {
			called++;
			return super.halved(n);
		}
	}
	
	public class HPredicate extends Halved {
		
		int called = 0;
		
		// this is supposed to mimic what their halved() returns when called once
		public boolean halvedPredicate(int n) {
			called = 0;
			int val = halved(n);
			return (val == 0);
		}
		
		@Override
		public int halved(int n) {
			called++;
			if (called > 1) {
				// this is the 2nd time through, yo
				return 99;
			} else {
				//first time through...
				return super.halved(n);
			}
		}
	}
	
	
	@Test
	@Name("Uses recursion")
	@hideWhenSuccessful
	public void uses_recursion() {
		HRecursionTest hp = new HRecursionTest();
		hp.halved(30);
		assertTrue("Your procedure isn't using recursion!",(hp.called >= 15 ));
		hp.called = 0;
		hp.halved(8);
		assertTrue("Your procedure isn't using recursion!",(hp.called >= 4));
	}
	
	@Test
	@Name("halved(\"0\")")
	public void halved_called_with_0() {
		Halved h = new Halved();
		assertEquals("halved(0) failed", "0", h.halved(0) + "");
	}
	
	@Test
	@Name("halved(\"1\")")
	public void halved_called_with_1() {
		Halved h = new Halved();
		assertEquals("halved(1) failed", "0", h.halved(1) + "");
	}
	
	@Test
	@Name("halved(\"2\")")
	public void halved_called_with_2() {
		Halved h = new Halved();
		assertEquals("halved(2) failed", "1", h.halved(2) + "");
	}
	
	@Test
	@Name("halved(\"5\")")
	public void halved_called_with_5() {
		Halved h = new Halved();
		assertEquals("halved(5) failed", "2", h.halved(5) + "");
	}

	@Test
	@Name("halved(\"9999\")")
	@SuccessMessage("Good job!")
	public void halved_called_with_9999() {
		Halved h = new Halved();
		assertEquals("halved(9999) failed", "4999", h.halved(9999) + "");
	}
}
