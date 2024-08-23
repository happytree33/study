package test1;

public class BusinessNoChecker {
		
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
	    
	    public static void main(String[] args) {
	        String testNumber = "211-88-11329"; // Example business registration number
	        boolean result = isBusinessRegistrationNo(testNumber);
	        System.out.println("The business registration number " + testNumber + " is " + (result ? "valid" : "invalid"));
	    }
}
