import java.util.Scanner;

public class RunShop {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		Shop shop = new Shop();
		shop.run();
		System.out.println("Ran with Cheese Total: " + Cheese.numCheese);
		input.close();
	}

}
