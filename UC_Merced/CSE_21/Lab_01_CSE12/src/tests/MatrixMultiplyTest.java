package tests;

import static org.junit.Assert.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.NoSuchElementException;
import java.util.Scanner;


import matrix.MatrixMultiply;

import org.junit.Test;

import edu.berkeley.eduride.EduRideTest;
import edu.berkeley.eduride.EduRideTest.Description;
import edu.berkeley.eduride.EduRideTest.Name;

// CONTAINS SOLUTIONS -- JAR THIS

@Description("Tests for writing and reading matrices")
public class MatrixMultiplyTest extends EduRideTest{

	
	
	
	
	///////////////////////// reading
	
	@Test
	@Name("Reading the matrix")
	public void testReadMatrix() {
		testRead1x1();
		testRead1x2();
		testRead2x1();
		testRead2x2();
	}
	

	private static void testRead1x1() {
		int [ ] [ ]	correct = {{4}};
		int [ ] [ ] computed = MatrixMultiply.readMatrix("lib/tests/1x1.txt");
		assertEquals ("matrix row length incorrect", correct.length, computed.length);
		assertEquals ("matrix col length incorrect", correct[0].length, computed[0].length);
		for (int r=0; r<correct.length; r++) {
			for (int c=0; c<correct[0].length; c++) {
				assertEquals ("matrix values incorrect", correct[r][c], computed[r][c]);
			}
		}
	}
	

	private void testRead2x2 ( ) {
		int [ ] [ ]	correct = {{1, 2}, {3, 4}};
		int [ ] [ ] computed = MatrixMultiply.readMatrix("lib/tests/2x2.txt");
		assertEquals ("matrix row length incorrect", correct.length, computed.length);
		assertEquals ("matrix col length incorrect", correct[0].length, computed[0].length);
		for (int r=0; r<correct.length; r++) {
			for (int c=0; c<correct[0].length; c++) {
				assertEquals ("matrix values incorrect", correct[r][c], computed[r][c]);
			}
		}
	}
	

	private void testRead2x1 ( ) {
		int [ ] [ ]	correct = {{1}, {3}};
		int [ ] [ ] computed = MatrixMultiply.readMatrix("lib/tests/2x1.txt");
		assertEquals ("matrix row length incorrect", correct.length, computed.length);
		assertEquals ("matrix col length incorrect", correct[0].length, computed[0].length);
		for (int r=0; r<correct.length; r++) {
			for (int c=0; c<correct[0].length; c++) {
				assertEquals ("matrix values incorrect", correct[r][c], computed[r][c]);
			}
		}
	}


	private void testRead1x2 ( ) {
		int [ ] [ ]	correct = {{1, 2}};
		int [ ] [ ] computed = MatrixMultiply.readMatrix("lib/tests/1x2.txt");
		assertEquals ("matrix row length incorrect", correct.length, computed.length);
		assertEquals ("matrix col length incorrect", correct[0].length, computed[0].length);
		for (int r=0; r<correct.length; r++) {
			for (int c=0; c<correct[0].length; c++) {
				assertEquals ("matrix values incorrect", correct[r][c], computed[r][c]);
			}
		}
	}
	



	
	
	///////////////////////////
	
	
	
	
	
	
	@Test
	@Name("Writing the matrix")
	public void testWriteMatrix() {
		try {
			// TODO delete all files in output dir
			File dir = new File("lib/tests/output/");
			for (File file : dir.listFiles()) {
				file.delete();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			fail("Problem with testing framework; files not closed?  Sorry");
		}

		// testem
		int [ ] [ ]	mat11 = {{9}};
		MatrixMultiply.writeMatrix(mat11, "lib/tests/output/out11.txt");
		compare(mat11, "lib/tests/output/out11.txt");
		int [ ] [ ]	mat12 = {{6, 5}};
		MatrixMultiply.writeMatrix(mat12, "lib/tests/output/out12.txt");
		compare(mat12, "lib/tests/output/out12.txt");
		int [ ] [ ]	mat21 = {{3}, {93}};
		MatrixMultiply.writeMatrix(mat21, "lib/tests/output/out21.txt");
		compare(mat21, "lib/tests/output/out21.txt");
		int [ ] [ ]	mat22 = {{23,45}, {13,23}};
		MatrixMultiply.writeMatrix(mat22, "lib/tests/output/out22.txt");
		compare(mat22, "lib/tests/output/out22.txt");
		
		
	}
	

	
	
	private void compare(int[][] correct, String filename) {
		try {
			FileReader fr = new FileReader(filename);
			Scanner filescan = new Scanner(fr);
			int correctNumRows = correct.length;
			int correctNumCols = correct[0].length;
			String firstline = filescan.nextLine();
			checkHeader(correctNumRows, correctNumCols, firstline);
			
			ArrayList<String> lines = new ArrayList<String>();
			while (filescan.hasNextLine()) {
				lines.add(filescan.nextLine());
			}
			assertEquals("writeMatrix() didn't output the correct number of lines for the matrix body", correctNumRows, lines.size());
			for(int j=0; j<correctNumRows;j++) {
				compareRow(correct[j], lines.get(j));
			}
			
		} catch (FileNotFoundException e) {
			fail("writeMatrix() didn't create a file.");

		}
		
		

	}
	
	
	private void checkHeader(int correctRows, int correctCols, String header) {
		Scanner sc = new Scanner(header);
		ArrayList<Integer> ints = new ArrayList<Integer>();
		while (sc.hasNextInt()) {
			ints.add(sc.nextInt());
		}
		assertEquals("writeMatrix() didn't write the first line correctly -- it didn't have the right length", ints.size(), 2);
		assertEquals("writeMatrix() didn't write the number of rows correctly", correctRows, ints.get(0).intValue());
		assertEquals("writeMatrix() didn't write the number of columns correctly", correctCols,  ints.get(1).intValue());
	}
	
	
	private void compareRow(int[] correct, String row) {
		int correctNumCols = correct.length;
		Scanner sc = new Scanner(row);
		ArrayList<Integer> intArraylist = new ArrayList<Integer>();
		while (sc.hasNextInt()) {
			intArraylist.add(sc.nextInt());
		}
		assertEquals("writeMatrix() didn't write a row of the matrix correctly -- it didn't have the right length", correctNumCols , intArraylist.size());
		
		int[] readArr = new int[intArraylist.size()];
		for (int i=0; i<readArr.length; i++) {
			readArr[i] = intArraylist.get(i).intValue();
		}
		// TODO this doesn't use the errorMsg?!?  so, write a loop and do this ourselves, sigh
		assertArrayEquals("writeMatrix() didn't write the values of a row correctly", correct, readArr);

	}

}
