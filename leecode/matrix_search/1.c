
#define INIT_STATUS  0
#define INIT_NEAR_STATUS  1
#define INT_STATUS  2
#define FLOAT_NEAR_STATUS  3
#define DOT_NEAR_STATUS  4
#define ENDING_STATUS 5
#define MAX_STATUS 10

char* pattern[MAX_STATUS] = {
    ".+-0123456789",   // INIT_STATUS
    "0123456789",      // INIT_NEAR_STATUS
    "eE.0123456789",   // INT_STATUS
    "-0123456789",     // FLOAT_NEAR_STATUS
    "0123456789",      // DOT_NEAR_STATUS
    "0123456789",      // ENDING_STATUS
};

bool checkRule(char c, char* s) {
    char* p = s;
    while (*p != '\0') {
        if (c == *p) {
            return true;
        }
        p++;
    }
    return false;
}




bool isNumber(char* s){
    char* p = s;

    while (*p == ' ') {
        p++;
    }
    
    int length = strlen(p);
    if ( length > 0 ) {
        while ( length > 0 && (*(p + length - 1) == ' ') ) {
            *(p + length - 1) = '\0';
            length --;
        }
    }

    if ( length == 0 || (length == 1 && !checkRule(*p, pattern[ENDING_STATUS])) ) {
        return false;
    }

    int status = INIT_STATUS;
    while (*p != '\0') {
        char c = *(p++);
        if (!checkRule(c, pattern[status])) {
            return false;
        }
        switch(status) {
            case INIT_STATUS:{
                if (c == '+' || c == '-') {
                    status = INIT_NEAR_STATUS;
                }
                if (c == '.') {
                    status = DOT_NEAR_STATUS;   
                }
                status = INT_STATUS;   
                break;
            }
            case INIT_NEAR_STATUS: {
                status = INT_STATUS;
                break;
            }
            case INT_STATUS: {
                if (c == '.') {
                    status = ENDING_STATUS;
                }
                if (c == 'e' || c == 'E') {
                    status = FLOAT_NEAR_STATUS;   
                }
                break;
            }
            case DOT_NEAR_STATUS: {
                status = ENDING_STATUS;
                break;
            }
            case FLOAT_NEAR_STATUS: {
                status = ENDING_STATUS;
                break;
            }
            default:
                break;
        }
    }

    if (status != INT_STATUS && status != ENDING_STATUS ) {
        return false;
    }
    return true;
}