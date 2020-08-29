x = 3.4
print(repr(x))  # Return the canonical string representation of the object \
# For most object types, eval (repr (object)) == object.

print(str(x))
print(eval(repr(x)))

print (eval('x+1'))
