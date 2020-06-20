package arraylist;

import java.util.ArrayList;

public class ArrayListRunner {
	
	// Use this class to run your code

	public static void main(String[] args) {
		
		testArrayList();
	}

	
	
	public static void testArrayList() {
		
		ArrayList<String> words = new ArrayList<String>();
		words.add ("a");
		words.add ("b");
		words.add ("c");
		words.remove ("b");
		words.add ("d");
		words.remove ("a");
		words.add ("e");
		words.remove ("b");
		words.add ("d");
		words.remove ("c");
		words.remove ("d");
		
		System.out.println(words.toString());
	}
}
