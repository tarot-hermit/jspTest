package study.j0220;

public class Test1 {
	public static void main(String[] args) {
		System.out.println("반가워..... 자바야....");
		
		int tot = 0;
		
		for(int i=1; i<=100; i++) {
			tot += i;
		}
		System.out.println("1~100까지 합은 ? " + tot);
	}
}
