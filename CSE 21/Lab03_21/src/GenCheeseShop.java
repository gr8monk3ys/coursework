import java.text.DecimalFormat;
import java.util.Random;
import java.util.Scanner;

public class GenCheeseShop {

	static Scanner scan = new Scanner(System.in);

	static int MAXCHEESE = 20, MINCHEESE = 0;
	public static double origSubTotal = 0;
	public static double newSubTotal = 0;
	public static double total = 0;
	static int display;
	static DecimalFormat numberFormat = new DecimalFormat("#.00");

	public static void main(String[] args) {

		String[] names = new String[MAXCHEESE];
		double[] prices = new double[MAXCHEESE];
		double[] amounts = new double[MAXCHEESE];

		System.out.print("Enter the number of cheeses for the shop setup: ");
		MAXCHEESE = scan.nextInt();
		System.out.println("");

		if (MINCHEESE < MAXCHEESE && MAXCHEESE < 20) {
			names[0] = "Humboldt Fog";
			prices[0] = 25.00;
		}
		if (MAXCHEESE > 1) {
			names[1] = "Red Hawk";
			prices[1] = 40.50;
		}

		if (MAXCHEESE > 2) {
			names[2] = "Teleme";
			prices[2] = 17.25;
		}

		cheeseOptions(names, prices, amounts);
		System.out.println("");
		cheeseValue(amounts, names);
		printReceipt(display, prices, amounts, names);

		if (MAXCHEESE <= MINCHEESE) {
			System.out.println("");
			System.out.println("Original Sub Total:				$0.0");
			System.out.println("Specials...");
			System.out.println("None:				   		-$0.0");
			System.out.println("New Sub Total:					$0.0");
			System.out.println("Additional 10% Discount:			-$0.0");
			System.out.println("Final Total:					$0.0");
		}
	}

	public static void cheeseOptions(String names[], double[] prices, double[] amounts) {

		System.out.println("We sell " + MAXCHEESE + " kinds of cheese (in 0.5 lbs packets) ");
		System.out.println(names[0] + ": $" + prices[0] + " per pound.");

		if (1 < MAXCHEESE) {
			System.out.println(names[1] + ": $" + prices[1] + " per pound.");
		}
		if (2 < MAXCHEESE) {
			System.out.println(names[2] + ": $" + prices[2] + " per pound.");
		}
		Random ranGen = new Random(100);

		for (int i = 3; i < MAXCHEESE; i++) {
			names[i] = "Cheese Type " + (char) ('A' + i);
			prices[i] = ranGen.nextInt(1000) / 100.0;
			amounts[i] = 0;

			System.out.println(names[i] + ": $" + prices[i] + " per pound");
		}
	}

	public static void cheeseValue(double[] amount, String[] name) {
		for (int i = 0; i < MAXCHEESE; i++) {
			System.out.print("Enter the amount of " + name[i] + " in lbs: ");
			amount[i] = scan.nextDouble();
			while (amount[i] % 0.5 != 0 || amount[i] < 0) {
				if (amount[i] % 0.5 != 0) {
					System.out.print("Invalid input. Enter a value that's a multiple of 0.5 lbs");
					amount[i] = scan.nextDouble();
				} else if (amount[i] < 0) {
					System.out.print("Invalid input. Enter a value that's >= 0 ");
					amount[i] = scan.nextDouble();
				}
			}
		}
	}

	public static void displayAmount(double[] amount, double[] price, String[] name) {
		for (int i = 0; i < MAXCHEESE; i++) {
			System.out.printf("%.1f lb of %s @ $%.2f =$%.2f\n", amount[i], name[i], price[i], price[i] * amount[i]);
		}
	}

	public static double DiscountHumboldtFog(double[] prices, double[] amounts) {
		double discount = 0;
		discount = (((int) amounts[0] * prices[0]) / 2.0);
		return discount;
	}

	public static double DiscountRedHawk(double[] prices, double[] amounts) {
		double discount = 0;
		discount = (((int) (amounts[1] * prices[1]) / 1.5) * 0.5);
		return discount;
	}

	public static double subTotal(double[] prices, double[] amounts) {

		for (int i = 0; i < MAXCHEESE; i++) {
			origSubTotal += (prices[i] * amounts[i]);
		}
		return origSubTotal;
	}

	public static double newSubTotal(double[] prices, double[] amount, double subTotal) {
		newSubTotal = subTotal - DiscountHumboldtFog(prices, amount) - DiscountRedHawk(prices, amount);
		return newSubTotal;
	}

	public static double additionalDiscounts() {
		double addDiscount = 0;

		if (newSubTotal >= 150) {
			addDiscount = (0.10 * newSubTotal);
		}
		if (newSubTotal >= 250) {
			addDiscount = (0.25 * newSubTotal);
		}
		if (newSubTotal < 150) {
			addDiscount = (0 * newSubTotal);
		}
		return addDiscount;
	}

	public static void printDiscount(double[] prices, double[] amount) {
		if (amount[0] == 0 && amount[1] == 0) {
			System.out.println("None		   -$0.0");
		}
		if (amount[0] > 0) {
			System.out.println("Humboldt Fog (Buy one get one free): 		-$" + numberFormat.format(DiscountHumboldtFog(prices, amount)));
		}
		if (amount[1] > 0) {

			System.out.println(
					"Red Hawk (Buy one get one free): 		-$" + numberFormat.format(DiscountRedHawk(prices, amount)));
		}
	}

	public static double total(double[] prices, double[] amounts) {
		total = newSubTotal(prices, amounts, origSubTotal) - additionalDiscounts();
		return total;
	}

	public static void printReceipt(int display, double[] prices, double[] amounts, String[] names) {
		System.out.println("");
		System.out.print("Display the itemized list? (1 for yes) ");
		display = scan.nextInt();
		System.out.println("");
		if (display == 1) {
			displayAmount(amounts, prices, names);
			System.out.println("");
			System.out.println("Original Sub Total:				$" + subTotal(prices, amounts));
			System.out.println("Specials...");
			printDiscount(prices, amounts);
			System.out.println("New Sub Total:					$"
					+ numberFormat.format(newSubTotal(prices, amounts, origSubTotal)));
			System.out.println("Additional 10% Discount:			$-" + numberFormat.format(additionalDiscounts()));
			System.out.println("Final Total:					$" + numberFormat.format(total(prices, amounts)));
		} else if (display == 0) {
			System.out.println("Original Sub Total:				$" + subTotal(prices, amounts));
			System.out.println("Specials...");
			printDiscount(prices, amounts);
			System.out.println("New Sub Total:					$" + numberFormat.format(newSubTotal(prices, amounts, origSubTotal)));
			System.out.println("Additional 10% Discount:			$-" + numberFormat.format(additionalDiscounts()));
			System.out.println("Final Total:					$" + numberFormat.format(total(prices, amounts)));
		}
	}
}