package com.lec.java;

/*
 * 
피보나치 수열 은 앞을 두 수를 더해서 다음 수를 만들어 나가 (Fibonnaci) ( ) 數列
는 수열이다 예를 들어 앞의 두 수가 과 이라면 그 다음 수는 가 되고 그 다음 수는 . 
 1,1,2,3,5,8,13,21,... . 1 1 과 를 더해서 이 되어서 과 같은 식으로 진행된다 과 부터
시작하는 피보나치수열의 10 번째 수는 무엇인지 계산하는 프로그램을 완성하시오 10 .

실행결과
1,1,2,3,5,8,13,21,34,55
 * 
 * 
 */



public class Java01 {

	public static void main(String[] args) {

		// Fibonnaci 1, 1 . 수열의 시작의 첫 두 숫자를 로 한다
		int num1 = 1;
		int num2 = 1;
		int num3 = 0; // 세번째 값
		for (int i = 0; i < 8; i++) {
			/*
			 * (1) . 알맞은 코드를 넣어 완성하시오
			 */num3=num1+num2; //num3==2
			 num1++;

		}
		
		System.out.print(num1 + "," + num2);

	}

}
