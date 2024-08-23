package test1;

import java.util.Random;

// DateUtil 클래스 상속
public class ForeignIDChecker  extends DateUtil {
	  public static boolean checkforeignNumber(String foreignNumber) {
		    
		    int check = 0;
		    if (foreignNumber.length() != 13)
		      return false; 
		    int i;
		    for (i = 0; i < 13; i++) {
		      if (foreignNumber.charAt(i) < '0' || foreignNumber.charAt(i) > '9')
		        return false; 
		    } 
		    if (Character.getNumericValue(foreignNumber.charAt(0)) == 0 || Character.getNumericValue(foreignNumber.charAt(0)) == 1) {
		      if (Character.getNumericValue(foreignNumber.charAt(6)) == 5 && Character.getNumericValue(foreignNumber.charAt(6)) == 6)
		        return false; 
		      String temp = "20" + foreignNumber.substring(0, 6);
		      if (!DateUtil.checkDate(temp))
		        return false; 
		    } else {
		      if (Character.getNumericValue(foreignNumber.charAt(6)) == 5 && Character.getNumericValue(foreignNumber.charAt(6)) == 6)
		        return false; 
		      String temp = "19" + foreignNumber.substring(0, 6);
		      if (!DateUtil.checkDate(temp))
		        return false; 
		    } 
		    for (i = 0; i < 12; i++)
		      check += (9 - i % 8) * Character.getNumericValue(foreignNumber.charAt(i)); 
		    if (check % 11 == 0) {
		      check = 1;
		    } else if (check % 11 == 10) {
		      check = 0;
		    } else {
		      check %= 11;
		    } 
		    if (check + 2 > 9) {
		      check = check + 2 - 10;
		    } else {
		      check += 2;
		    } 
		    
		    if (check == Character.getNumericValue(foreignNumber.charAt(12)))
		      return true; 
		    return false;
		  }
	  
	    // 외국인 주민번호 랜덤으로 돌리기
	    public static String generateValidForeignNumber() {
	        Random random = new Random();
	        StringBuilder sb = new StringBuilder();

	        // charAt(0)은 7,8,9,0 중 하나로 설정
	        int[] validFirstChars = {7, 8, 9, 0};
	        sb.append(validFirstChars[random.nextInt(validFirstChars.length)]);

	        // Fill in the next 5 digits with random numbers
	        for (int i = 1; i < 6; i++) {
	            sb.append(random.nextInt(10));
	        }

	        // charAt(6)은 5,6,7,8 중 하나로 설정
	        int[] validSixthChars = {5, 6, 7, 8};
	        sb.append(validSixthChars[random.nextInt(validSixthChars.length)]);

	        for (int i = 7; i < 12; i++) {
	            sb.append(random.nextInt(10));
	        }

	        String foreignNumber = sb.toString();
	        int check = 0;
	        for (int i = 0; i < 12; i++) {
	            check += (9 - i % 8) * Character.getNumericValue(foreignNumber.charAt(i));
	        }
	        check = (check % 11 + 2) % 10;
	        sb.append(check);

	        return sb.toString();
	    }

	  
	  
/* 수동으로 번호 넣는 방법
 * 
  		public static void main(String[] args) {
  			String foreignNumber = "9210325020192";
  			boolean result = checkforeignNumber(foreignNumber);
  			System.out.println(result);
  		
		}
		
*/
	    // 자동으로 하나씩 돌리는 방법
	    public static void main(String[] args) {
	        // Test the method with a valid foreign number
	        String validForeignNumber = generateValidForeignNumber();
	        boolean result = checkforeignNumber(validForeignNumber);
	        String front = validForeignNumber.substring(0, 6);
	        String end = validForeignNumber.substring(6, 13);
	        System.out.println("Testing number: " + front +"-"+end);
	        System.out.println("Result: " + result);
	    }

	
	    /*
	    // true가 나올때까지 계속 반복하는 방법
	    public static void main(String[] args) {
	        Random random = new Random();
	        boolean found = false;

	        while (!found) {
	            // 랜덤숫자 가져오기
	            String foreignNumber = generateValidForeignNumber();
	            boolean result = checkforeignNumber(foreignNumber);

	            if (result) {
	                // 랜덤일 때 스탑
	                String front = foreignNumber.substring(0, 6);
	                String end = foreignNumber.substring(6, 13);
	                System.out.println("valid number: " + front + "-" + end);
	                System.out.println("Result: " + result);
	                found = true; 
	            }
	        }
	    }
	    */
	   
}
