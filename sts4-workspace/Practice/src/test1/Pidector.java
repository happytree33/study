package test1;
import java.util.regex.Pattern;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;


public class Pidector {
    public static void main(String[] args) {
        
    	// 개인정보 추출 로직
    	
        String phonePattern = "\\b(?:\\d{2,3}[-\\s]?\\d{3,4}[-\\s]?\\d{4}|\\d{2,3}[-\\s]?\\d{3}[-\\s]?\\d{4})\\b";
        String emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}"; // 이메일 패턴

        // 예시 
        String text = "Contact us at 123-456-7890 or email us at example@example.com 그리고 010 2232 1234 그리고 010-333 1234 yo@naver.com,32@naver.com";

        // 정규 표현식 패턴 컴파일
        Pattern phoneRegex = Pattern.compile(phonePattern);
        Pattern emailRegex = Pattern.compile(emailPattern);

        // 입력 텍스트에서 패턴을 찾기 위한 Matcher 객체 생성
        Matcher phoneMatcher = phoneRegex.matcher(text);
        Matcher emailMatcher = emailRegex.matcher(text);

        // 전화번호 추출
        System.out.println("< 폰 Numbers >");
        while (phoneMatcher.find()) {
            System.out.println(phoneMatcher.group());
        }

        // 이메일 주소 추출
        System.out.println("\n< Email Addresses >");
        while (emailMatcher.find()) {
            System.out.println(emailMatcher.group());
        }
        
        
        // HashMap 연습.
        HashMap<String, Object> map = new HashMap<>();
        
        HashMap<String, String> innerMap = new HashMap<>();
        
        innerMap.put("fruit", "apple");
        innerMap.put("country", "KOREA");
        innerMap.put("cloth", "dress");
        
        map.put("AAA", innerMap);
        map.put("BBB", "test");
        System.out.println();
        
        for ( Map.Entry<String, Object> entry : map.entrySet()) {
        	String key = entry.getKey();
        	Object value = entry.getValue();
        	
        	System.out.println("key ==> " + key + " value ==> " + value);
        }
         
        
        
    }
}
