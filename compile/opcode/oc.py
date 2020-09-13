#!/usr/bin/env python3
# encoding: utf-8

def f(a, b):
	return a + b

if __name__ == '__main__':
    import dis
    #dis.show_code(f)
    dis.dis(f)
