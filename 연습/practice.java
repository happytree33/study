
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


문제 3.

class A {
  int a;
  int b;
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
        BinarySearchTree bst = new BinarySearchTree();
        bst.insert(50);
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