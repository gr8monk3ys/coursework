package tests;

import static org.junit.Assert.*;

import java.util.Stack;
import org.junit.Test;
import recursion.*;

public class ReverseTest extends edu.berkeley.eduride.EduRideTest {

	// keeps track of reverse calls, to test whether reverse calls itself
	class ReverseChild extends Reverse {
		public Stack<String> calls = new Stack<String>();

		public String reverse(String s) {
			calls.push(s);
			String ret = super.reverse(s);
			return ret;
		}
	}

	// tests whether reverse makes use of its own return value.
	// do we really need this? It would be hard to write something that calls
	// itself
	// recursively but then doesn't use the result!
	class ReverseBrokenChild extends Reverse {
		public String initialParam;

		// this class breaks reverse3, to make sure the student is using it.
		public String reverse(String s) {
			if (s.equals(initialParam)) {
				// we are in the initial call -- let it try once
				return super.reverse(s);
			} else {
				// break it here by returning value unchanged
				return s;
			}
		}
	}

	private String real_reverse(String s) {
		return new StringBuffer(s).reverse().toString();
	}


	@Test
	@Name("reverse(\"abcde\")")
	public void correctly_reversed_abcde() {
		String s = "abcde";
		Reverse r = new Reverse();
		assertEquals("reverse(\""+s+"\") failed", real_reverse(s), r.reverse(s));
	}


	@Test
	@Name("Testing a long string")
	public void correctly_reverses_public_static_void_pain() {
		String s = "public static void pain";
		Reverse r = new Reverse();
		assertEquals("reverse(\""+s+"\") failed", real_reverse(s), r.reverse(s));
	}

	@Test
	@Name("reverse(\"Z\")")
	public void correctly_reverses_Z() {
		String s = "Z";
		Reverse r = new Reverse();
		assertEquals("failed with call reverse(\""+s+"\") ", real_reverse(s), r.reverse(s));
	}

	@Test
	@Name("Mystery string")
	public void correctly_reverses_not_revealed() {
		Reverse r = new Reverse();
		String s = "Computing science is no more about computers than astronomy is about telescopes -- Edsger W. Dijkstra";
		String out = r.reverse(s);
		assertTrue(
				"failed with mystery string!",
				out.equals(real_reverse(s)));
	}

	@Test
	@Name("reverse(\"\")")
	public void correct_when_empty() {
		Reverse r = new Reverse();
		String empty = "";
		try {
			String out = r.reverse(empty);
			assertEquals("reverse(\"\") [the empty string] failed",
					"", out);
		} catch (Exception e) {
			fail("Your reverse method broke when passed an empty string!");
		}

	}

	@Test
	@Name("Uses recursion")
	public void uses_recursion() {
		String s = "Computing science is no more about computers than astronomy is about telescopes -- Edsger W. Dijkstra";
		ReverseChild rc = new ReverseChild();
		rc.reverse(s);
		assertTrue(
				"Your reverse method never calls itself.  It isn't recursive!",
				(rc.calls.size() > 1));
		// todo

	}

}
