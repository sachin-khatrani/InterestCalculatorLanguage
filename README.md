# InterestCalculatorLanguage
This project is based on  Interest Calculator.In This project user will enter Principal amount,Rate and Time and return Simple Interest and Compound Interest


#Os requirement

kali linux                                           

//steps to run program in terminal

lex lang.l                                                          --> This will generate lex.yy.c file<br/>
yacc -d lang.y                                                      --> This will generate y.tab.c and y.tab.h file<br/>
cc y.tab.c lex.yy.c -o <filename> -lm                                   --> This will generate .out file<br/>
