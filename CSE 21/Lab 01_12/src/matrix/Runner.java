package matrix;

import java.util.ArrayList;
import static matrix.MatrixMultiply.*;

public class Runner {
	public static void main(String[] args) {
		
		testMatrix();	
	}

	// enter filenames such as "data/matrix1.txt"
	public static void testMatrix() {
		int[][] mat1 = readMatrix("data/matrix1.txt");
		printMatrix(mat1);
		int[][] mat2 = readMatrix("data/matrix2.txt");
		printMatrix(mat2);
		int[][] mult = multiply(mat1, mat2);
		writeMatrix(mult, "data/RESULT.txt");
		System.out.println("Wrote results to data/RESULT.txt");
		printMatrix(mult);
	}
}
