package test1;

public class Myclass {
	private int value;
	
	public Myclass(int value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		System.out.println("test");
		return "Myclass[value=" + value + "]";
	}
	
	
}
