#!/bin/expect

spawn scp src/cat/s21_cat src/grep/s21_grep fredacha@10.10.0.2:/usr/local/bin
expect -exact "\rfredacha@10.10.0.2's password: "
send -- " \r"
expect eof
#sshpass -p ' ' scp src/cat/s21_cat src/grep/s21_grep fredacha@10.10.0.2:/usr/local/bin
