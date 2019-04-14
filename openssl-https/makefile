all:serverSSL clientSSL


serverSSL:serverSSL.c
	gcc -Wall -g $^ -o $@ -lssl -lcrypto


clientSSL:clientSSL.c
	gcc -Wall -g $^ -o $@ -lssl -lcrypto



.PHONY:clear

clear:
	rm -f serverSSL
	rm -f clientSSL
