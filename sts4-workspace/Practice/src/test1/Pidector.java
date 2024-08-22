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
        System.out.println();
        String test = "abbc";
        String test2 = "ade";
        /*
			영문 대문자 (A-Z):
			
			'A'의 아스키 값: 65
			'B'의 아스키 값: 66
			'C'의 아스키 값: 67
			...
			'Z'의 아스키 값: 90
			
			영문 소문자 (a-z):
			
			'a'의 아스키 값: 97
			'b'의 아스키 값: 98
			'c'의 아스키 값: 99
			...
			'z'의 아스키 값: 122
			
			대문자와 소문자 사이에는 32의 차이
         */
        
        System.out.println(test.charAt(3));
        
        System.out.println(test.compareTo(test2));
        // 앞에 test가 test2 보다 사전적으로 먼저오면 음수. 같으면 0 뒤에오면 양수
        // "abbc" 와 "ade"를 비교했을 때, 첫번째는 같으니까 패스
        // 두번째 b 와 d를 비교. b는 아스키 값이 98, d는 아스키값이 100 이니까 98 - 100 = -2
        
        System.out.println(test.concat(test2));
        // abbc 와 ade 를 concat 하면 abbcade
        
        boolean a = test.contains("d");
        boolean b = test.contains("b");
        System.out.println("1 => " + a + " / 2 ==> " + b);
        // false / true 나온다 . contains는 boolean
        System.out.println();
        
        // test는 abbc
        String c = "d";
        String d = "ac";
        String e = "bb";
        String f = "a";
        String g = "c";
        System.out.println(test.indexOf(c)); // -1
        System.out.println(test.indexOf(d)); // -1
        System.out.println(test.indexOf(e)); //  1
        System.out.println(test.indexOf(f));  //  0
        System.out.println(test.indexOf(g)); //  3
        System.out.println();
        // 그래서 존재하는지 판단할 때 g > -1 이런식으로 많이 사용.
        
        String result[] = {c, d, e, f, g};
        
        for ( String one : result ) {
        	if (test.indexOf(one) > -1) {
        		System.out.println(one + " exists in abbc");
        	}
        }

        System.out.println(test.substring(1));
        // 1부터 짜르니까 abbc에서 bbc가 나온다.
        
        System.out.println(test.substring(1, 3));
        // 1부터 3-1 인 2까지 짜르니까 abbc에서 bb가 나온다.
        
        
        
    }
}
