## makefile   
#  
  
## ����obj�ļ��ı������  
hello.o : hello.cpp hello.h
	g++ -Wall -c $< -o $@  
main.o : main.cpp hello.h
	g++ -Wall -c $< -o $@  
      
## �����ִ���ļ�hello.exe�ı������      
hello:  hello.o main.o  
	g++ -Wall  -o $@ $^
  
## Լ���׳ɣ�����Ѿ�ϰ���Ե����ǽ�allĬ�ϵ�make�ռ�Ŀ�ꡣ  
## ����������У���������hello.exe   
.PHONY : all  
all:    hello  
  
## ���� Ŀ��clean��һ�����ɾ������obj�ļ����Լ���ִ���ļ���  
.PHONY : clean  
clean:  
	rm -f hello.o main.o hello