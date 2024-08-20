package test1;
class Car implements Runnable {
  int a;
  
  public void run() {
     System.out.println("Hello");  // System을 대문자로 수정하고 세미콜론 추가
  }
}
  
public class Main {
  public static void main(String[] args) {
    Thread t1 = new Thread(new Car());  // Car 인스턴스를 전달하도록 수정
    t1.start();
  }
}