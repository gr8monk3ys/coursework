import java.util.*;
import java.text.DecimalFormat;

public class ShopArr {

	// Instance Variables
	private Cheese[] cheese;
	static DecimalFormat numFormat = new DecimalFormat("#.00");

	// Initialize method
	void init(int max) {

		// Create max number of Cheese pointers
		cheese = new Cheese[max];

		if (max > 0) {
			cheese[0] = new Cheese();
			cheese[0].setName("Humboldt Fog");
			cheese[0].setPrice(25.00);
		}

		if (max > 1) {
			cheese[1] = new Cheese("Red Hawk");
			cheese[1].setPrice(40.50);
		}

		if (max > 2) {
			cheese[2] = new Cheese("Teleme", 17.25);
			// cheese[2].setName("Wrong Name");
		}
		Random ranGen = new Random(100);

		if (max > 3) {
			for (int i = 3; i < max; i++) {
				cheese[i] = new Cheese("Cheese Type " + (char) ('A' + i));
				cheese[i].setPrice(ranGen.nextInt(1000) / 100.0);
			}
		}
	}

	public ShopArr() {
		init(10);
	}

	public ShopArr(int max) {
		init(max);
	}

	/*
	 * Displays the intro message informing the user of various cheeses sold and
	 * Gets the amount of each cheese the user would like to purchase.
	 */
	private void intro(Scanner input) {
		System.out.println("We sell " + cheese.length + " kinds of Cheese (in 0.5 lb packages)");
		for (int i = 0; i < cheese.length; i++) {
			System.out.println(cheese[i].getName() + ": $" + cheese[i].getPrice() + " per pound");
		}

		for (int i = 0; i < cheese.length; i++) {
			System.out.print("Enter the amount of " + cheese[i].getName() + " in lbs: ");
			cheese[i].setAmount(input);
			while (cheese[i].getAmount() % 0.5 != 0 || cheese[i].getAmount() < 0) {
				if (cheese[i].getAmount() % 0.5 != 0) {
					System.out.print("Invalid input. Enter a value that's a multiple of 0.5 lbs: ");
					cheese[i].setAmount(input);
				} else if (cheese[i].getAmount() < 0) {
					System.out.print("Invalid input. Enter a value that's >= 0: ");
					cheese[i].setAmount(input);
				}
			}
		}
	}

	/*
	 * Displays the itemized list of all cheeses bought or a special message if none
	 * were purchased.
	 */
	private void itemizedList() {
		double amt = 0, price = 0;
		for (int i = 0; i <= cheese.length; i++) {
			if (amt == 0) {
				System.out.println("No items were purchased.");
				System.out.println();
			} else if ((amt = cheese[i].getAmount()) > 0) {
				price = cheese[i].getPrice();
				System.out.printf("%.1f lb of %s @ $%.2f = $%.2f\n", amt, cheese[i].getPrice(), price, price * amt);
			}
		}

	}

	/*
	 * Calculates the Original Sub Total, which is the price*amount of each cheese
	 * added together. Returns the Original Sub Total.
	 */
	private double calcSubTotal() {
		double subTotal = 0;
		for (int i = 0; i < cheese.length; i++) {
			subTotal += cheese[i].getAmount() * cheese[i].getPrice();
		}
		return subTotal;
	}

	/*
	 * Calculates discounts based on special offers on Humboldt Fog and Red Hawk,
	 * stores them in disSpecials[0] and disSpecials[1], and returns the array.
	 * Minor changes from Lab 07 (identical logic).
	 */
	private double[] discountSpecials() {
		double[] disSpecials = { 0, 0 };

		if (cheese.length > 0) {
			double hfAmt = cheese[0].getAmount();
			if (hfAmt > 0) {
				disSpecials[0] += (((int) hfAmt * cheese[0].getPrice()) / 2.0);
			}
		}
		if (cheese.length > 1) {
			double rhAmt = cheese[1].getAmount();
			if (rhAmt > 0) {
				disSpecials[1] += ((int) ((rhAmt) / 1.5) * cheese[1].getPrice() * 0.5);
			}
		}

		return disSpecials;
	}

	/*
	 * Displays the Original Sub Total, discounts based on specials, and the New Sub
	 * Total. Returns the New Sub Total. Identical to Lab 07.
	 */
	private double printSubTotals(double subTotal, double[] disSpecials) {
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
	 * the Final Total. Identical to Lab 07.
	 */
	private void printFinalTotal(double newSubTotal) {
		System.out.println("New Sub Total:					$" + numFormat.format(newSubTotal));
		double addDiscount = 0;

		if (newSubTotal >= 150) {
			addDiscount = (newSubTotal * 0.10);
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

	private void printFree() {
		double amt;
		System.out.println();
		System.out.println("Today is your lucky day!");
		for (int i = 0; i < cheese.length; i++)
			if ((amt = cheese[i].getAmount()) > 0)
				System.out.println(amt + " lb of " + cheese[i].getName() + " @ $0 = $" + 0);
		System.out.println("Total Price: FREE!!!\n");
	}

	public void run() {

		Scanner input = new Scanner(System.in);
		intro(input);
		double subTotal = calcSubTotal();

		System.out.println();
		System.out.print("Display the itemized list? (1 for yes): ");
		int list = input.nextInt();
		if (list == 1)
			itemizedList();

		int free = (new Random()).nextInt(100);
		// System.out.println("Random num is " + free);
		if (free != 0) {
			double newSubTotal = printSubTotals(subTotal, discountSpecials());
			printFinalTotal(newSubTotal);
		} else {
			printFree();
			return;
		}

		System.out.println();
		System.out.print("Do you wish to redo your whole order? (1 for yes): ");
		int redo = input.nextInt();

		System.out.println();

		if (redo == 1)
			run();
		else
			System.out.println("Thanks for coming!");
	}
}
