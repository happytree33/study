package test1;

import java.util.*;
import java.util.stream.*;

public class test {
	public static void main(String[] args) {
		
		int[] a = {1, 3, 5, 6, 7, 8, 10};
		
		int length = a.length;		
		
		System.out.println(length);
		System.out.println("=========");
		System.out.println("test123".length());			
		
		System.out.println(a[2]);
		//System.out.println(a[2:4]); 자바에선 이렇게 슬라이스 기능 X
		int[] slicedArray = Arrays.copyOfRange(a, 2, 5);

		System.out.println("slicedArray =>" + Arrays.toString(slicedArray));
		// [5,6,7] 나온다. 끝에는 -1을 해야 한다. 3번째 자리 부터 5번째 자리까지.	
		
		String word = "test";
		String b = a.getClass().getName();
		
		System.out.println(b);
		
		System.out.println("test");
		System.out.println("test2");
		
		HashMap<String, Integer> map = new HashMap<>();
		
		// 데이터 추가
		map.put("Apple", 3);
		map.put("Banana", 2);
		map.put("Cherry", 5);
		
		System.out.println("map ==>" + map);
		// {Apple=3, Cherry=5, Banana=2} 이렇게 나온다.
		
		int c = map.get("Apple");
		System.out.println(c);
		
		for (Map.Entry<String, Integer> entry : map.entrySet()) {
			String key = entry.getKey();
			Integer value = entry.getValue();
			System.out.println("key : " + key + " / value : " + value);
		}
		
		IntStream.range(1,5).forEach(System.out::println);
		//1
		//2
		//3
		//4
		// 이렇게 출력 된다.
		
	}
}
