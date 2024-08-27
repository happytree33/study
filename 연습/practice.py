
문제 1.

def factorial(n):
    if n == 0:
        return 1
    else:
        return n * (빈칸)

print(factorial(5))  # Output should be 120

=> 5 4 3 2 1 을 곱하면 120 이 나온다.
else를 탈 때, n * (n-1)을 한다면? -> X
그러면 n * factorial(n-1) 을 한다면? # 이게 정답.
5 * 4 * 3 * 2 * 1 이 된다.


문제 2.

def exam(num1, num2=2):
  print('a=', num1, 'b=', num2)
exam(20)

=> a= 20 b= 2
print 함수는 기본적으로 각 인수를 공백으로 구분하여 출력.


