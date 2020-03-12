import java.text.DecimalFormat;
import java.util.*;

public class Shop {

	static Scanner input = new Scanner(System.in);
	static double discountRate = 0;

	public static int setupShop(double[] prices, String[] names, double[] discAmount) {

		System.out.print("Please enter the number of items to setup shop: ");
		int numItems = input.nextInt();
		System.out.println();

		for (int i = 1; i <= numItems; i++) {
			System.out.print("What is the name of the " + numSuffix(i) + " item? (One Word): ");
			names[i] = input.next();
			System.out.print("Enter the per package price of " + names[i] + ": ");
			prices[i] = input.nextDouble();
			System.out.print(
					"Enter the number of packages ('x') to qualify for Special Discount (buy 'x' get 1 free)/n for "
							+ names[i] + ",or 0 if no Special Discount offered: ");

			discAmount[i] = input.nextInt();

		}

		System.out.println();
		System.out.print("Enter the dollar amount to qualify for Additional Discount (or 0 if none offered): ");
		double minVal = input.nextInt();
		if (minVal == 0) {
			System.out.print("");
		} else {
			System.out.print("Enter the Additional Discount rate (e.g., 0.1 for 10%): ");
			discountRate = input.nextDouble();
			if (discountRate < 0 || discountRate > 0.5) {
				System.out.print("Invalid input. Enter a value > 0 and <= 0.5: ");
				discountRate = input.nextDouble();
			}
		}
		System.out.println();
		return numItems;
	}

	private static String numSuffix(int i) {
		int rem = i % 10;
		switch (rem) {
		case 0:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
			return (i + "th");
		case 1:
			if (i % 100 != 11)
				return (i + "st");
			else
				return (i + "th");
		case 2:
			if (i % 100 != 12)
				return (i + "nd");
			else
				return (i + "th");
		case 3:
			if (i % 100 != 13)
				return (i + "rd");
			else
				return (i + "th");
		default:
			break;
		}
		return "";
	}

	public static void buyItems(int[] amounts, double[] prices, int numItems, String[] names) {
		for (int i = 1; i <= numItems; i++) {
			System.out.print("Enter the number of " + names[i] + " packages to buy: ");
			amounts[i] = input.nextInt();
			while (amounts[i] < 0) {
				System.out.println("Invalid input. Enter a value >= 0: ");
				amounts[i] = input.nextInt();
			}
		}
	}

	public static void listOfItems(int[] amounts, double[] prices, int numItems, String[] names) {

		double totPrice = 0;

		for (int i = 1; i <= numItems; i++) {
			totPrice = (prices[i] * amounts[i]);
			if (amounts[i] == 0) {
				System.out.print("");
			} else {
				DecimalFormat df = new DecimalFormat("0.00");
				String fTotPrice = df.format(totPrice);
				System.out.println(amounts[i] + " packages of " + names[i] + " @  $" + prices[i] + " = $" + fTotPrice);
			}
		}
		if (totPrice == 0) {
			System.out.print("No Items were Purchased");
		}
	}

	public static double specialDisc(int[] amounts, double[] prices, double[] discAmount) {
		double specDisc = 0;
		for (int i = 1; i <= amounts.length; i++) {
			specDisc += ((int) ((amounts[i] * discAmount[i]) / discAmount[i] + 1) * (prices[i] * 2));
			if (discAmount[i] == 0) {
				System.out.println("No Special Discounts applied");
				System.out.println();
				break;
			}
		}
		return specDisc;
	}

	public static void checkOut(int[] amounts, double[] prices, double specDisc) {
		double subTotal = 0;

		for (int i = 0; i < amounts.length; i++) {
			subTotal = prices[i] * amounts[i] + subTotal;
		}

		if (subTotal >= discountRate) {
			DecimalFormat df = new DecimalFormat("0.00");
			double disc = (specDisc);
			String formatDisc = df.format(disc);
			double newSub = (subTotal - specDisc);
			String formatnewSub = df.format(newSub);
			double newDisc = ((newSub * (discountRate)));
			String formatnewDisc = df.format(newDisc);
			double total = newSub - newDisc;
			String formatTotal = df.format(total);
			System.out.println("Original Sub Total:\t $" + (double) subTotal);
			System.out.println("Special Discounts:\t-$" + formatDisc);
			System.out.println("New SubTotal:\t\t $" + formatnewSub);
			System.out.println("Additional " + ((int) (discountRate * 100)) + "% Discount:-$" + formatnewDisc);
			System.out.println("Final Sub Total: \t $" + formatTotal);
			System.out.println();
			System.out.println("Thanks for coming!");

		} else if (subTotal < discountRate) {
			System.out.println();
			System.out.println("Thanks for coming!");
			System.out.println("Subtotal: $" + subTotal);
			System.out.println("You did not Qualify for an Additional Discount");
			System.out.println("Total: $" + subTotal);
		}
	}

	public static void main(String[] args) {

		int numItems = 0;
		double specDisc = 0;
		int max = 1000;
		String[] names = new String[max];
		double[] discAmount = new double[max];
		double[] prices = new double[max];
		int[] amounts = new int[max];
		boolean[] setup = new boolean[3];

		// setup[0] = shop is not setup yet
		// setup[1] = no items were bought
		// setup[2] = done

		do {
			System.out.println("This program supports 4 functions:");
			System.out.println("1. Setup Shop");
			System.out.println("2. Buy");
			System.out.println("3. List Items");
			System.out.println("4. Checkout");
			System.out.print("Please choose the function you want: ");
			int choice = input.nextInt();

			switch (choice) {
			case 1: {
				if (setup[0] == false) {
					System.out.println();
					numItems = setupShop(prices, names, discAmount);
					setup[0] = true;
				}
				setup[0] = true;
				break;
			}
			case 2: {
				if (setup[0] == true) {
					System.out.println();
					buyItems(amounts, prices, numItems, names);
					System.out.println();
					setup[1] = true;
				} else {
					System.out.println();
					System.out.print("Shop is not setup yet!");
					System.out.println();
					System.out.println();
					break;
				}
				setup[1] = true;
				break;
			}
			case 3: {
				if (setup[0] == true && setup[1]) {
					System.out.println();
					listOfItems(amounts, prices, numItems, names);
					System.out.println();
					break;

				}
				if (setup[0] == true && setup[1] == false) {
					System.out.println();
					System.out.println("You have not bought anything");
					System.out.println();
					break;
				}
				if (setup[0] == false) {
					System.out.println();
					System.out.println("Shop is not setup yet!");
					System.out.println();
					break;
				}
			}
			case 4: {
				if (setup[0] == true) {
					checkOut(amounts, prices, specDisc);
					setup[2] = true;
					break;
				}
				if (setup[0] == false) {
					System.out.println();
					System.out.println("Shop is not setup yet!");
					System.out.println();
					break;
				}
			}
			}

			if (choice > 4) {
				System.out.println();
				System.out.println("Error do not know the function: " + choice);
				System.out.println();
			}

			if (setup[2] == true) {
				System.out.println("-------------------------------------------------");
				System.out.println("Would you like to re-run? (1 for yes, 0 for no) ");
				System.out.println("-------------------------------------------------");

				int redo = input.nextInt();
				if (redo == 1) {
					main(args);
				} else {
					System.exit(0);
				}
			}
		} while (true);
	}
}