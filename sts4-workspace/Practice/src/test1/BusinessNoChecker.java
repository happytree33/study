package test1;

import java.util.Random;

public class BusinessNoChecker {
	    public static void main(String[] args) {
	        //String testNumber = "211-88-11329"; 
	    	Random random = new Random();
	   /* 수동체크 방법
	    	String testNumber = generateNumber(random);
	
	        boolean result = isBusinessRegistrationNo(testNumber);
	        System.out.println("business number : " + testNumber);
	        System.out.println("result : " + result);
	        */
	    	
	    	// 자동으로 true 찾을 때 까지
	    	boolean found = false;
			int count = 0;	    	
			
	    	while(!found) {
	    		
	    		String testNumber = generateNumber(random);
	    		testNumber = testNumber.replace("-", "");
	    		//String testNumber = "2118852348";
	    		boolean result =isBusinessRegistrationNo(testNumber);
	    		count++;
	    		
	    		//2118852348 이라면 211-88-52348 로.
	    		String front = testNumber.substring(0, 3);
	    		String middle = testNumber.substring(3, 5);
	    		String end = testNumber.substring(5, 10);	    		
	    		
		        System.out.println("business number : " + front + "-" + middle + "-" + end);
		        System.out.println("result : " + result);
		        
	    		if (result) {
	    			// 몇 번 수행했는지 로직 추가.
	    	        System.out.println("count : " + count);	    			
	    	        System.out.println("finish");
	    	        found = true;
	    		}
	    		
	    	}   	
	    }
	
		
		public static boolean isBusinessRegistrationNo(String bizRegNo) {
			
		    if (bizRegNo.length() != 10)
		      return false; 
		    int share = (int)(Math.floor((to_int(bizRegNo.charAt(8)) * 5)) / 10.0D);
		    int rest = to_int(bizRegNo.charAt(8)) * 5 % 10;
		    int sum = to_int(bizRegNo.charAt(0)) + to_int(bizRegNo.charAt(1)) * 3 % 10 + to_int(bizRegNo.charAt(2)) * 7 % 10 + to_int(bizRegNo.charAt(3)) * 1 % 10 + to_int(bizRegNo.charAt(4)) * 3 % 10 + to_int(bizRegNo.charAt(5)) * 7 % 10 + to_int(bizRegNo.charAt(6)) * 1 % 10 + to_int(bizRegNo.charAt(7)) * 3 % 10 + share + rest + to_int(bizRegNo.charAt(9));
		    if (sum % 10 != 0)
		      return false; 
		    return true;
		    
		  }
		
	    // Method to convert char to int
	    private static int to_int(char c) {
	        return Character.getNumericValue(c);
	    }
	    
	    
	 // 랜덤 비즈니스 등록 번호 생성 메소드
	    public static String generateNumber(Random random) {
	        // 각 부분의 숫자를 생성
	        int part1 = random.nextInt(900) + 100; // 1000을 넣으면 0부터 999까지니까 이렇게 해서 100 ~ 999
	        int part2 = random.nextInt(90) + 10;   // 10-99
	        int part3 = random.nextInt(90000) + 10000; // 10000-99999

	        // 형식에 맞게 문자열로 변환
	        return String.format("%03d-%02d-%05d", part1, part2, part3);
	    }


	    
	    
	    
}
