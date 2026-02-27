import java.util.Scanner;

public class RunShop {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		
		System.out.println("Enter the number of Cheeses for shop setup: ");
		int max = input.nextInt();
		
		ShopArr shop = new ShopArr();
		
		shop.init(max);
		shop.run();
		System.out.println("Ran with Cheese Total: " + max);
		input.close();
	}

}
