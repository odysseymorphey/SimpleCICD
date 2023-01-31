CC = gcc
FLAG = -Wall -Wextra -Werror -std=c11 -D_GNU_SOURCE
FLAG_CAT = -b -e -n -s -v

# SOURCE = s21_grep.c
# OBJECT = s21_cat

all: clean s21_grep test

clean:
	rm -rf ./*.o ./*.out ./s21_grep ./*.txt ./*.cfg

s21_cat: s21_grep.c
	$(CC) $(FLAG) s21_grep.c -o s21_grep 

test: s21_grep
	bash grep.sh
	

check:
	cp ./../../materials/linters/.clang-format .clang-format 
	clang-format -n --Werror s21_grep.c 
