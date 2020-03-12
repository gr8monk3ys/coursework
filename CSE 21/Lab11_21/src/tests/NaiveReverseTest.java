package tests;
import static org.junit.Assert.*;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Random;

import org.junit.Test;
import recursion.NaiveReverse;

import edu.berkeley.eduride.EduRideTest.Expected;


public class NaiveReverseTest extends edu.berkeley.eduride.EduRideTest {

	
	private String real_reverse(String s) {
		return new StringBuffer(s).reverse().toString();
	}	




	// we'd like to ensure they don't have any loops, and no use of Java library reverse...
	// But how!?!
	
	

	@Test
	@Name("Reverse6(\"abcdef\")")
	@Description("This test runs your <tt>reverse6</tt> on the string \"abcdef\" and checks if it properly returns \"fedcba\".")
	public void reverse_abcdef() {
		String tst = "abcdef";
		
		NaiveReverse nr = new NaiveReverse();
		String obs = nr.reverse6(tst);
		String exp = real_reverse(tst);
		assertEquals(exp, obs);
	}
	
	@Test
	@Name("Reverse6(\"lolwtf\")")
	@Description("This test runs your <tt>reverse6</tt> on the string \"lolwtf\" and checks if it properly returns \"ftwlol\".")
	public void reverse_lolwtf() {
		String tst = "lolwtf";
		
		NaiveReverse nr = new NaiveReverse();
		String obs = nr.reverse6(tst);
		String exp = real_reverse(tst);
		assertEquals(exp, obs);
	}
	
	
	@Test
	@Name("Mystery test")
	@Expected("???")
	@Description("This test runs your <tt>reverse6</tt> on the 6 character string (that we won't reveal) and checks if it properly returns.")
	public void reverse_hidden1() {
		String[] tsts = {"yefcZu", "floc23","4lfic9","jsp32s","l29dhf","kw8css","ls8f6d", "ls8wsw","sud86q","ww4rsf","9rejf7"};
		Random r = new Random();
		String tst = tsts[r.nextInt(tsts.length)];
		NaiveReverse nr = new NaiveReverse();
		String obs = nr.reverse6(tst);
		String exp = real_reverse(tst);
		assertTrue("The mystery string was not correctly reversed", obs.equals(exp));
	}
	

	
	
	
	


	
}
