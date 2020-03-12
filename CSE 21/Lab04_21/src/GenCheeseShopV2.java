import java.util.Random;
import java.text.DecimalFormat;
import java.util.Scanner;

public class GenCheeseShopV2 {

	static Scanner sc = new Scanner(System.in);
	static DecimalFormat numFormat = new DecimalFormat("#.00");

	/*
	 * Displays the intro message informing the user of various cheeses sold while
	 * populating the names and prices arrays, and initializing the amounts array.
	 */
	public static void intro(String[] names, double[] prices, double[] amounts) {
		if (0 < prices.length && prices.length < 20) {
			names[0] = "Humboldt Fog";
			prices[0] = 25.00;
		}
		if (prices.length > 1) {
			names[1] = "Red Hawk";
			prices[1] = 40.50;
		}

		if (prices.length > 2) {
			names[2] = "Teleme";
			prices[2] = 17.25;
		}
		System.out.println("We sell " + names.length + " kinds of cheese (in 0.5 lbs packets) ");
		if (0 < prices.length) {
			System.out.println(names[0] + ": $" + prices[0] + " per pound.");

			if (1 < prices.length) {
				System.out.println(names[1] + ": $" + prices[1] + " per pound.");
			}
			if (2 < prices.length) {
				System.out.println(names[2] + ": $" + prices[2] + " per pound.");
			}
			Random ranGen = new Random(100);

			for (int i = 3; i < names.length; i++) {
				names[i] = "Cheese Type " + (char) ('A' + i);
				prices[i] = ranGen.nextInt(1000) / 100.0;
				amounts[i] = 0;

				System.out.println(names[i] + ": $" + prices[i] + " per pound");
			}
		} else {

		}
	}

	/*
	 * Gets the amount of each cheese the user would like to purchase and populates
	 * the amounts array with the user inputs. Performs with input validation
	 * (amount >= 0 and multiple of 0.5).
	 */
	public static void getAmount(Scanner sc, String[] names, double[] amounts) {
		for (int i = 0; i < names.length; i++) {
			System.out.print("Enter the amount of " + names[i] + " in lbs: ");
			amounts[i] = sc.nextDouble();
			while (amounts[i] % 0.5 != 0 || amounts[i] < 0) {
				if (amounts[i] % 0.5 != 0) {
					System.out.print("Invalid input. Enter a value that's a multiple of 0.5 lbs: ");
					amounts[i] = sc.nextDouble();
				} else if (amounts[i] < 0) {
					System.out.print("Invalid input. Enter a value that's >= 0: ");
					amounts[i] = sc.nextDouble();
				}
			}
		}
	}

	/*
	 * Displays the itemized list of all cheeses bought or a special message if none
	 * were purchased.
	 */
	public static void itemizedList(String[] names, double[] prices, double[] amounts) {
		for (int i = 0; i < names.length; i++) {
			System.out.printf("%.1f lb of %s @ $%.2f =$%.2f\n", amounts[i], names[i], prices[i],
					prices[i] * amounts[i]);
		}

	}

	/*
	 * Calculates the Original Sub Total, which is the price*amount of each cheese
	 * added together. Returns the Original Sub Total.
	 */
	public static double calcSubTotal(double[] prices, double[] amounts) {
		double origSubTotal = 0;
		for (int i = 0; i < prices.length; i++) {
			origSubTotal += (prices[i] * amounts[i]);
		}
		return origSubTotal;
	}

	/*
	 * Calculates discounts based on special offers on Humboldt Fog and Red Hawk,
	 * stores them in disSpecials[0] and disSpecials[1], and returns the array.
	 */
	public static double[] discountSpecials(double[] amounts, double[] prices) {
		double[] disSpecials = new double[amounts.length];
		if (0 < prices.length && prices.length < 20) {
			double humboldtDiscount = 0;
			humboldtDiscount += (((int) amounts[0] * prices[0]) / 2.0);
			disSpecials[0] = humboldtDiscount;
		}

		if (prices.length > 1) {
			double redHawkDiscount = 0;
			redHawkDiscount += ((int)((amounts[1]  ) / 1.5) * prices[1] * 0.5);
			disSpecials[1] = redHawkDiscount;
		}
		return disSpecials;
	}

	/*
	 * Displays the Original Sub Total, discounts based on specials, and the New Sub
	 * Total. Returns the New Sub Total.
	 */
	public static double printSubTotals(double subTotal, double[] disSpecials) {
		System.out.println("Original Sub Total:				$" + numFormat.format(subTotal));
		System.out.println("Specials...");
		if (subTotal == 0) {
			System.out.println("None		   		-$0.0");
		}
		if (disSpecials.length > 0 && disSpecials[0] > 0) {
			System.out.println("Humboldt Fog (Buy one get one free): 		-$" + numFormat.format(disSpecials[0]));
		}
		if (disSpecials.length > 1 && disSpecials[1] > 1) {
			System.out.println("Red Hawk (Buy two get one free): 		-$" + numFormat.format(disSpecials[1]));
		}
		double newSubTotal = subTotal;
		for (int i = 0; i < disSpecials.length; i++) {

			newSubTotal -= disSpecials[i];
		}
		return newSubTotal;
	}

	/*
	 * Calculates the additional discount based on the New Sub Total and displays
	 * the Final Total.
	 */
	public static void printFinalTotal(double newSubTotal) {

		System.out.println("New Sub Total:					$" + numFormat.format(newSubTotal));
		double addDiscount = 0;

		if (newSubTotal >= 150) {
			addDiscount = ( newSubTotal * 0.10);
		}
		if (newSubTotal >= 250) {
			addDiscount = (newSubTotal * 0.25);
		}
		if (newSubTotal < 150) {
			addDiscount = (newSubTotal * 0);
		}
		System.out.println("Additional 10% Discount:			-$" + numFormat.format(addDiscount));
		System.out.println("Final Total:					$" + numFormat.format((newSubTotal - addDiscount)));
	}

	/*
	 * Program starts here
	 */
	public static void main(String[] args) {

		final int MAXCHEESE;
		System.out.print("Enter the number of Cheeses for shop setup: ");
		MAXCHEESE = sc.nextInt();

		// DO NOT CHANGE ANYTHING BELOW
		String[] names = new String[MAXCHEESE];
		double[] prices = new double[MAXCHEESE];
		double[] amounts = new double[MAXCHEESE];

		intro(names, prices, amounts);

		getAmount(sc, names, amounts);

		double subTotal = calcSubTotal(prices, amounts);

		if (MAXCHEESE != 0) {
			System.out.print("\nDisplay the itemized list? (1 for yes) ");
			int display = sc.nextInt();

			if (display == 1) {
				itemizedList(names, prices, amounts);
			}
		}

		double newSubTotal = printSubTotals(subTotal, discountSpecials(amounts, prices));

		printFinalTotal(newSubTotal);

		sc.close();
	}
}