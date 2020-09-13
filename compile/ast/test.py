st='def foo():\n    print("hello")'
import ast
print(ast.dump(ast.parse(st)))
