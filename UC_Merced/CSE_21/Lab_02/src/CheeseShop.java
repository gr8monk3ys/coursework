import java.util.Scanner;

public class CheeseShop {

	static Scanner scan = new Scanner(System.in);

	static double humboldtFog = 25.00;
	static double redHawk = 40.50;
	static double teleme = 17.25;

	public static void main(String[] args) {

		boolean showHumboldtFog = true;
		boolean showRedHawk = true;
		boolean showTeleme = true;

		System.out.println("We sell three types of cheese (in 0.5 lb packages ");
		System.out.println("Humboldt Fog $25.00 per pound");
		System.out.println("Red Hawk $40.50 per pound");
		System.out.println("Teleme $17.25 per pound");
		System.out.println("");

		System.out.println("Enter the amount of Humboldt Fog in lbs: ");
		double humboldtFogAmt = scan.nextDouble();
		
		if (humboldtFogAmt == 0) {
			showHumboldtFog = false;
		}
		while(humboldtFogAmt % 0.5 != 0 || humboldtFogAmt < 0) {
			if(humboldtFogAmt % 0.5 != 0) {
				System.out.println("Invalid input. Enter a value that's a multiple of 0.5 lbs");
				humboldtFogAmt = scan.nextDouble();
			}
			else if(humboldtFogAmt < 0) {
				System.out.println("Invalid input. Enter a value that's >= 0 ");
				humboldtFogAmt = scan.nextDouble();
			}
		}

		System.out.println("Enter the amount of Red Hawk in lbs: ");
		double redHawkAmt = scan.nextDouble();
		
		if (redHawkAmt == 0) {
			showRedHawk = false;
		}
		while(redHawkAmt % 0.5 != 0 || redHawkAmt < 0) {
			if(humboldtFogAmt % 0.5 != 0) {
				System.out.println("Invalid input. Enter a value that's a multiple of 0.5 lbs");
				redHawkAmt = scan.nextDouble();
			}
			else if(redHawkAmt < 0) {
				System.out.println("Invalid input. Enter a value that's >= 0 ");
				redHawkAmt = scan.nextDouble();
			}
		}

		System.out.println("Enter the amount of Teleme in lbs: ");
		double telemeAmt = scan.nextDouble();
		
		if (telemeAmt == 0) {
			showTeleme = false;
		}
		while(telemeAmt % 0.5 != 0 || telemeAmt < 0) {
			if(telemeAmt % 0.5 != 0) {
				System.out.println("Invalid input. Enter a value that's a multiple of 0.5 lbs");
				telemeAmt = scan.nextDouble();
			}
			else if(telemeAmt < 0) {
				System.out.println("Invalid input. Enter a value that's >= 0 ");
				telemeAmt = scan.nextDouble();
			}
		}

		double subTotal = (humboldtFog * (humboldtFogAmt * 2)) + (redHawk * (redHawkAmt * 1.5))
				+ (teleme * (telemeAmt));

		double total = subTotal
				- (DiscountHumboldtFog(humboldtFogAmt, humboldtFog) + DiscountRedHawk(redHawkAmt, redHawk));

		System.out.println("Display item size listed?");
		int display = scan.nextInt();
		if (display == 1) {
			if (humboldtFogAmt > 0 || redHawkAmt > 0 || telemeAmt > 0) {
				displayHumboldtFog(humboldtFogAmt, showHumboldtFog, 2, "Humboldt Fog ");
				displayRedHawk(redHawkAmt, showRedHawk, 1.5, "Red Hawk ");
				displayHumboldtFog(telemeAmt, showTeleme, 1, "Teleme ");
				System.out.println("");
				System.out.println("Sub Total:				$" + subTotal);
				System.out.println("Discounts...");
				printDiscount(humboldtFogAmt, redHawkAmt);
				System.out.println("Total:					$" + total);
			} else if (humboldtFogAmt == 0 && redHawkAmt == 0 && telemeAmt == 0) {
				System.out.println("No items were purchased.");
				System.out.println("");
				System.out.println("Sub Total:				$" + subTotal);
				System.out.println("Discounts...");
				printDiscount(humboldtFogAmt, redHawkAmt);
				System.out.println("Total:					$" + total);
			}
		} else if (display == 0) {
			System.out.println("");
			System.out.println("Sub Total:				$" + subTotal);
			System.out.println("Discounts...");
			printDiscount(humboldtFogAmt, redHawkAmt);
			System.out.println("Total:					$" + total);
		}
	}

	public static double DiscountHumboldtFog(double cheeseAmt, double cheesePrice) {
		double discount = (cheeseAmt * cheesePrice);
		return discount;

	}

	public static double DiscountRedHawk(double cheeseAmt, double cheesePrice) {
		double discount = (cheeseAmt * cheesePrice) - (((cheeseAmt) * cheesePrice) / 2);
		return discount;
	}

	public static void printDiscount(double humboldtFogAmt, double redHawkAmt) {
		if (humboldtFogAmt == 0 && redHawkAmt == 0) {
			System.out.println("None		   -$0.0");
		}
		if (humboldtFogAmt >= 0.5) {
			System.out.println(
					"Humboldt Fog (Buy one get one free): -$" + DiscountHumboldtFog(humboldtFogAmt, humboldtFog));
		}
		if (redHawkAmt >= 1) {
			System.out.println("Red Hawk (Buy two get one free): -$" + DiscountRedHawk(redHawkAmt, redHawk));
		}
	}

	public static double displayHumboldtFog(double cheese, boolean show, double multiplier, String cheeseName) {
		if (show == true) {
			System.out.println((cheese * multiplier) + " of " + cheeseName + "@ " + humboldtFog + " = "
					+ (humboldtFog * (cheese * multiplier)));
		} else {
			System.out.print("");
		}
		return cheese;
	}
	
	public static double displayRedHawk(double cheese, boolean show, double multiplier, String cheeseName) {
		if (show == true) {
			System.out.println((cheese  + ((int)cheese * 0.5)) + " of " + cheeseName + "@ " + redHawk + " = "
					+ (redHawk * (cheese * multiplier)));
		} else {
			System.out.print("");
		}
		return cheese;
	}
}