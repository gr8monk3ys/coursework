package tests;

import static org.junit.Assert.*;

import org.junit.Test;

import arraylist.TrackedArrayList;
 
import edu.berkeley.eduride.EduRideTest.Name;
import edu.berkeley.eduride.EduRideTest.Description;
import edu.berkeley.eduride.EduRideTest.hideWhenSuccessful;


@Description("TrackedArrayList: testing the functionality of maxSizeSoFar(). ")
public class TrackedArrayListTests {

	
	@Test
	@Name("Initial size")
	public void testInitialSize() {
		TrackedArrayList<String> ta = new TrackedArrayList<String>();
		assertEquals("maxSizeSoFar incorrect with new, empty array", 0, ta.maxSizeSoFar());

		
		
	}
	
	@Test
	@Name("Adding elements only")
	public void testAdding() {
		TrackedArrayList<String> ta = new TrackedArrayList<String>();
		ta.add("hee");
		assertEquals("maxSizeSoFar incorrect with 1 addition", 1, ta.maxSizeSoFar());
		
		TrackedArrayList<String> ta1 = new TrackedArrayList<String>();
		addTo(ta1, 7, "hi");
		assertEquals("maxSizeSoFar incorrect with 7 additions", 7, ta1.maxSizeSoFar());
		
		TrackedArrayList<String> ta2 = new TrackedArrayList<String>();
		addTo(ta2, 93, "ho");
		assertEquals("maxSizeSoFar incorrect with a large number of additions", 93, ta2.maxSizeSoFar());

	}
	
	
	@Test
	@Name("Adding and removing")
	public void testAddingRemoving() {
		TrackedArrayList<String> ta1 = new TrackedArrayList<String>();
	
		addTo(ta1, 9, "yo");
		ta1.remove("yo5");
		ta1.remove("yo8");
		addTo(ta1, 6, "yoohoo");
		ta1.remove("yo3");
		ta1.remove("yoohoo4");
		assertEquals("maxSizeSoFar incorrect after 9 additions, 2 removes, 6 additions, and 2 more removes", 13, ta1.maxSizeSoFar());
		addTo(ta1, 4, "three");
		assertTrue("maxSizeSoFar incorrect after a sequence of additions and removes", ta1.maxSizeSoFar() == 15);
		ta1.remove("three2");
		assertTrue("maxSizeSoFar incorrect after a sequence of additions and removes", ta1.maxSizeSoFar() == 15);
		
	}
	
	
	
	@Test
	@Name("Removes (when items aren't present)")
	public void testNotPresentRemoves() {
		TrackedArrayList<String> ta1 = new TrackedArrayList<String>();
		addTo(ta1, 11, "ba");
		ta1.remove("ba5");
		ta1.remove("blarg");
		addTo(ta1, 6, "foop");
		ta1.remove("samwise");
		ta1.remove("foop2");
		assertEquals("maxSizeSoFar incorrect after 11 additions, 1 sucessful removal, 6 additions, and 1 more successful removal", 16, ta1.maxSizeSoFar());
		addTo(ta1, 4, "notpresent");
		assertTrue("maxSizeSoFar incorrect after a sequence of additions and removes", ta1.maxSizeSoFar() == 19);
		ta1.remove("notpresent2");
		assertTrue("maxSizeSoFar incorrect after a sequence of additions and removes", ta1.maxSizeSoFar() == 19);

	}
	
	
	
	private static void addTo(TrackedArrayList<String> ta, int amount, String seed) {
		for (int i=0; i<amount; i++) {
			ta.add(seed + Integer.toString(i+1));
		}
	}
	
	
	
}
