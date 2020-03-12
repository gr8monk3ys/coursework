import java.io.FileNotFoundException;
import java.io.*;
import java.util.NoSuchElementException;
import java.util.Scanner;

public class FileParser {

	public static void main(String[] args) throws IOException {
		
		/*
		 * --------------------
		 * WORKING WITH STRINGS
		 * -------------------- 
		 */
		
		String str = "my string";
		
		System.out.print("Printing String object 'str' one character at a time: ");
		for(int i = 0; i < str.length(); i++)
			System.out.print(str.charAt(i));
		
		System.out.println("\n");
		
		System.out.println("ASCII value of character at position 2: " + (int)str.charAt(2));
		System.out.println("ASCII value of character at position 4: " + (int)str.charAt(4));
		System.out.println("Character at position 4:                " + str.charAt(4));
		
		char[] a = {'T', 'H', 'E'};
		/*
		 * If we attempt to make a String from the character array 'a' using the code
		 * 		String strA = (String)a;
		 * the compiler throws the error "Cannot cast from char[] to String"
		 */
		String strA = new String(a);
		System.out.println("\nString made from character array {'T', 'H', 'E'}: " + strA);
		
		char[] b = {84, 72, 69};
		String strB = new String(b);
		System.out.println("String made from character array {84, 72, 69}:    " + strB); // See ASCII table in Slide 8
		
		/*
		 * -----------------
		 * STRING COMPARISON
		 * -----------------
		 */
		
		String str1 = "hello";
		String str2 = str1;
		if(str1 == str2)
			System.out.println("\nReference variables str1 and str2 point to the same object");
		
		String str3 = "hello";
		String str4 = "hello"; // Does not create a new object
		if(str3 == str4) 
			System.out.println("Reference variables str3 and str4 point to the same object");
		
		String str5 = "hello";
		String str6 = new String("hello");
		if(str5 == str6) 
			System.out.println("Reference variables str5 and str6 point to the same object");
		if (str5.equals(str6))
			System.out.println("Reference variables str5 and str6 have the same value");
		
		/*
		 * -------------
		 * READING FILES
		 * -------------
		 */
		
		System.out.print("\nEnter the name of file to open: ");
		
		/*
		 * Make sure to specify the full path to the file with slash (/) as your directory separator. 
		 * For instance, C:/tmp/num.txt (in Windows).
		 * 
		 * Another option is to import the file to your project and simply specify the name of the file.
		 * To import the file, perform the following steps:
		 * 1. Right-click on the project name in the Package Explorer and select "Import..."
		 * 2. In the Import window, select "File System" and clict "Next >"
		 * 3. In the File System Import window, click "Browse..." and navigate to the directory where your
		 *    file is located (in the above example, C:/tmp) and click "Ok"
		 * 4. You will now notice the two windows in the File System Import window are populated, with the 
		 *    left showing the selected directory and the right showing the list of files in the selected 
		 *    directory. 
		 * 5. In the right-side window, click on the check-box next to the file you wish to read (num.txt in 
		 *    the example above) and click "Finish"
		 * 6. You will now see the file added to your project in the Package Explorer
		 * Now when you run the program, simply specify the file name (num.txt) when prompted.  
		 */
		Scanner kbd = new Scanner(System.in); 
		// You may also specify this java file to parse by entering "./src/FileParser.java" when prompted. 
		// Try it out! 
		String filename = kbd.next(); 
		kbd.close();
		
		int lineno = 0;
		
		// Read the entire file in one go
		System.out.println("Reading the entire file in one go ...");
		System.out.println("===========================================");
		try { // TRY it out 
			Scanner input = new Scanner(new FileReader(filename));
			
			input.useDelimiter("[\t \r]"); // Tab (\t) and/or space ( ) and/or carriage return (\r) delimited file	
			
			while(input.hasNext()) 
				System.out.println(input.next()); // Print each word in file
			
			input.close();
			System.out.println("===========================================\n");
		} catch(FileNotFoundException e) { // Catch Error 
			System.out.println(e); 
		} catch(NoSuchElementException e) { // Catch Error 
			System.out.println(e); 
		}
		
		// Read the file one line at a time
		System.out.println("Reading the file 1 line at a time ...");
		System.out.println("===========================================");
		try { // TRY it out 
			Scanner input = new Scanner(new FileReader(filename)); 
			
			while(input.hasNextLine()) { 
				Scanner line = new Scanner(input.nextLine()); 
				line.useDelimiter("[\t \r]"); // Tab (\t) and/or space ( ) and/or carriage return (\r) delimited file
				
				lineno++;
				
				System.out.println("--------READING-LINE-" + lineno + "--------");
				while(line.hasNext()) 
					System.out.println(line.next()); // Print each word in line
				
				line.close();
			}
			
			input.close();
			System.out.println("===========================================");
		} catch(FileNotFoundException e) { // Catch Error 
			System.out.println(e); 
		} catch(NoSuchElementException e) { // Catch Error 
			System.out.println(e); 
		}
	}
}
