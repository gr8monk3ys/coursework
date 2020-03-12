package tests;


import static org.junit.Assert.*;
import org.junit.Test;

import recursion.DigitCount;

public class DigitCountTest extends edu.berkeley.eduride.EduRideTest {


	
	@Test
	@Name("digitCount(\"0\")")
	public void digit_count_of_0() {
		assertEquals("digitCount(0) failed", "1", DigitCount.digitCount(0) +"");
	}
	
	@Test
	@Name("digitCount(\"8\")")
	public void digit_count_of_8() {
		assertEquals("digitCount(8) failed", "1", DigitCount.digitCount(8) +"");
	}
	
	@Test
	@Name("digitCount(\"1040\")")
	public void digit_count_of_1040() {
		assertEquals("digitCount(1040) failed", "4", DigitCount.digitCount(1040) +"");
	}
	
	@Test
	@Name("digitCount(\"314159\")")
	public void digit_count_of_314159() {
		assertEquals("digitCount(314159) failed", "6", DigitCount.digitCount(314159) +"");
	}

	
	@Test
	@Name("digitCount(\"314159265\")")
	@SuccessMessage("Well done!")
	public void digit_count_of_314159265() {
		assertEquals("digitCount(314159265) failed", "9", DigitCount.digitCount(314159265) +"");
	}
	
}
