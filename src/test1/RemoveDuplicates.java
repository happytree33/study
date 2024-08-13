package test1;
import java.util.Arrays;

public class RemoveDuplicates {
	public static void main(String[] args) {
		int[] arr = {1, 1, 2, 2, 3, 4, 5, 5};
		
		int n = arr.length;
		// 여기서 n은 8이 나온다.
		System.out.println(n);
		
		int[] result = new int[n];
		//8개가 들어갈 수 있는 배열 생성.
		
		int j = 0;
		
		//여기서 i는 0부터 6까지 총 7번.
		// 1 1 2 2 3 4 
		// result = {1, 2, 3, 4, 5};
		for (int i=0; i< n -1; i++) {
			if (arr[i] != arr[i+1]) {
				result[j++] = arr[i];
			}
		}
        result[j++] = arr[n - 1];    
        //j 는 5가 된다.
        System.out.println(Arrays.toString(Arrays.copyOf(result, j)));		
        // Arrays는 배열로 만들고 copyOf는 배열의 일부를 복사본으로 만든다.
        // copyOf(result, 5); 는 5자리까지 가져온다.
        // 만약에 copyOf(result, 3); 이면 [1,2,3]		
        
        // 자바에선 {} 는 배열의 초기값을 설정할때 사용. 대괄호 [] 는 배열의 선언과 접근에 사용.
        // 문서나 콘솔에서 배열의 문자열 표현은 배열의 내용을 대괄호 []로 감싸서 보여줍니다
	}
}
