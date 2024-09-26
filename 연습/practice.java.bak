
문제 1.

public class MaxValue {
    public static void main(String[] args) {
        int[] numbers = {10, 20, 5, 25, 15};
        int max = 0;
        for (int i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        System.out.println("Maximum value is " + max);
    }
}

1 2 3 4 => 20 5 25 15 

max = 20 으로 되고.
3번째에서 max = 25로 되고.
=> 정답 : Maximum value is 25



문제 2.

class Car implements Runnable{
  int a;
  
  public void run(){
     system.out.println("Hello")
  }
}
  
public class Main{
  public static void main(String[] args){
    Thread t1 = new Thread(new ___());
    t1.start();
  }
}

=> Thread 클래스는 java.lang 패키지에 이미 정의되어 있다.

정답 : 빈칸에 Car



문제 3.

class A {
  int a;	// 멤버 변수
  int b;	// 멤버 변수
}
  
public class Main {
  
  static void func1(A m) {
    m.a *= 10;
  }
  
  static void func2(A m) {
    m.a += m.b;
  }
  
  public static void main(String args[]){
  
  A m = new A();
  
  m.a = 100;
  func1(m);
  m.b = m.a;
  func2(m);
  
  System.out.printf("%d", m.a);
  }
}

=> m 객체를 선언.
a를 100으로 선언.

func1(m)을 통해 a가 1000이 된다.
b를 1000으로 선언.
func2(m)을 통해 a는 2000이 된다.

출력하면 2000?

// 여기서 중요 포인트!
// 메서드 안에서 멤버변수의 연산은 메서드 밖에서도 유효.
// 메서드 내에서 수행된 멤버변수의 변화는 클래스의 객체가 존재하는 동안 계속 유지되는 반면에
// 메서드 내에서 선언된 지역변수는 메서드가 종료되면 사라진다.


문제 4. 고난이도.

class TreeNode {
    int value;
    TreeNode left, right;

    TreeNode(int item) {
        value = item;
        left = right = null;
    }
}

class BinarySearchTree {
    TreeNode root;

    // 메서드: 값을 트리에 삽입
    void insert(int value) {
        root = insertRec(root, value);
    }

    TreeNode insertRec(TreeNode root, int value) {
        if (root == null) {
            root = new TreeNode(value);
            return root;
        }
        if (value < root.value) {
            root.left = insertRec(root.left, value);
        } else if (value > root.value) {
            root.right = insertRec(root.right, value);
        }
        return root;
    }

    // 메서드: 트리에서 값을 찾기
    boolean search(int value) {
        return searchRec(root, value);
    }

    boolean searchRec(TreeNode root, int value) {
        if (root == null) return false;
        if (root.value == value) return true;
        if (root.value > value) return searchRec(root.left, value);
        return searchRec(root.right, value);
    }

    public static void main(String[] args) {
        BinarySearchTree bst = new BinarySearchTree();  // 바이너리 클래스의 객체를 생성.
        bst.insert(50); // 매서드 실행
        bst.insert(30);
        bst.insert(20);
        bst.insert(40);
        bst.insert(70);
        bst.insert(60);
        bst.insert(80);

        System.out.println("Is 40 in the tree? " + bst.search(40));
        System.out.println("Is 90 in the tree? " + bst.search(90));
    }
}

=> 여기서 포인트는 root를 return 한다는 것. 메서드를 타고 타고 수행하면 root.left가 거기서는 root가 된다는 것.

bst.insert(50)을 수행
insertRec(root, 50)
root의 값 (root.value)가 50으로 됨.

bst.insert(30) 을 수행
value < root.value 이므로
root.left = insertRec(root.left, value);을 수행하는데
root.left는 30이 되고. root를 반환해서 여기서의 root는 30이다.

bst.insert(20)을 수행하면
20 < 50 이므로 
root.left = insertRec(root.left, value); 을 수행하고.

insertRec(root.left, value)는 insertRec(30, 20) 을 수행하는 것.
여기서 root는 30이다.
여기서도 20 < 30 이므로
insertRec(root.left, value)을 한번 더 수행.
여기서의 root.left는 null값이기 때문에 
root값 20을 반환.

정답 :
Is 40 in the tree? true
Is 90 in the tree? false







