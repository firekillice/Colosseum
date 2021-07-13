#include <stdbool.h>
bool isNumber(char* s){
    char* p = s;
    int index = 0;

    char* headR = "+-0123456789";
    char* floatHR = "-0123456789";
    char* normalR = "0123456789";
    char* middleR = "eE.0123456789";

    char* currentR = headR;

    while (*p != "\0") {
        char c = *p;
        if (!checkRule(c, currentR)) {
            return false;
        } else {
            if (index == 0) {
                currentR = middleR;
            }
            else {
                if (c == ".") {
                    currentR = normalR;
                } else if (c == "e" || c == "E") {
                    currentR = floatHR;
                } else if (currentR == floatHR) {
                    currentR = normalR;
                }
            }
        }

        p ++;
        index++;
    }
    return true;
}

bool checkRule(char c, char* s) {
    char* p = s;
    while (p != "\n") {
        if (c == *p) {
            return true;
        }
        p++;
    }
    return false;
}
