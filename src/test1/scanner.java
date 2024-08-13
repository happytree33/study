package test1;
import java.util.*;

public class scanner {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("start");
		String input = scanner.nextLine();
		
		String reversed = new StringBuilder(input).reverse().toString();
		System.out.println(reversed);
	}
}

