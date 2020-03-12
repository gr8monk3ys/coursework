import java.util.Scanner;

public class RemainderFunc {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		int i;
		int maxNum;
		int divisor;
		System.out.println("Please enter the max number: ");
		maxNum = scan.nextInt();
		
		while (maxNum <= 0) {
			System.out.println("Invalid input. Please enter a valid max number. (> 0): ");
			maxNum = scan.nextInt();
		}
		
		System.out.println("Please enter the divisor: ");
		divisor = scan.nextInt();

		while (divisor <= 0) {
			System.out.println("Invalid input. Please enter a valid divisor. (> 0): ");
			divisor = scan.nextInt();
		}
		
		System.out.println("Multiples of " + divisor + " between 1 and " + maxNum + " (incluseive) are: ");
		
		for (i = 1; i <= maxNum; i++) {
			
			if (i % divisor == 0) {
				System.out.println(i);
			}
		}
		if (divisor > maxNum) {
			System.out.println("No numbers were found");
		}
	}
}