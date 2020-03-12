package tests;

import static org.junit.Assert.*;

import org.junit.Test;
import recursion.*;

public class Reverse17Test extends edu.berkeley.eduride.EduRideTest {

	class R16checker extends Reverse17 {
		public boolean isCalled = false;
		public boolean makeItFail = false;

		public String reverse16(String s) {
			isCalled = true;
			if (makeItFail) {
				return "thisismeanttobetotallywrong";
			} else {
				return super.reverse16(s);
			}
		}
	}

	class R17checker extends R16checker {
		public String reverse17(String s) {
			return super.reverse17(s);
		}
	}

	private String real_reverse(String s) {
		return new StringBuffer(s).reverse().toString();
	}

	@Test
	@Name("Uses reverse16()")
	@hideWhenSuccessful
	public void calls_reverse16() {
		R17checker r17 = new R17checker();
		String s = "1234567890abcdefg";
		String exp = real_reverse(s);
		r17.makeItFail = false;
		String act = r17.reverse17(s);
		r17.makeItFail = true;
		String act_shouldfail = r17.reverse17(s);
		// make sure reverse16 is called
		assertTrue("Your method never calls reverse16!", r17.isCalled);
		
		// make sure they use the reverse16 answer, if they get the overall answer right
		// if they didn't get the overall answer right, the other test will fail, so this
		// one can succeed (i.e., assume they are trying to use reverse16 properly)
		boolean usedrev16sanswer = true;
		if (exp.equals(act)) {
			usedrev16sanswer = !(exp.equals(act_shouldfail));
		} 
		assertTrue("Your method doesn't use reverse16 in its answer!", usedrev16sanswer);
	}

	@Test
	@Name("Correctly reverses")
	@SuccessMessage("Good job!")
	public void reverses_correctly() {
		Reverse17 r17 = new Reverse17();
		assertEquals("reverse17(\"disinterestedness\") failed!",
				real_reverse("disinterestedness"),
				r17.reverse17("disinterestedness"));
		assertEquals("reverse17(\"uniformitarianism\") failed!",
				real_reverse("uniformitarianism"),
				r17.reverse17("uniformitarianism"));
		assertEquals("reverse17(\"pseudohydrophobia\") failed!",
				real_reverse("pseudohydrophobia"),
				r17.reverse17("pseudohydrophobia"));
	}

}
