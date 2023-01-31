CC = gcc
FLAG = -Wall -Wextra -Werror -std=c11 -D_GNU_SOURCE
FLAG_CAT = -b -e -n -s -v
FILE_TXT = ./test/test_1.txt ./test/test_2.txt ./test/test.txt ./test/invisibles.txt
# SOURCE = s21_cat.c
# OBJECT = s21_cat

all: clean s21_cat test

clean:
	rm -rf ./*.o ./*.out ./s21_cat ./*.txt ./*.cfg

s21_cat: s21_cat.c
	$(CC) $(FLAG) s21_cat.c -o s21_cat 

test: s21_cat
	bash cat.sh
	

check:
	cp ./../../materials/linters/.clang-format .clang-format 
	clang-format -n --Werror s21_cat.c 


