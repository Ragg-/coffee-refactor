
tmp =
  0: 0
  1: 1
fib = (i) ->
  return tmp[i] if tmp[i]?
  tmp[i] = fib(i - 1) + fib(i - 2)
for i in [0..10]
  console.log i, fib i





a = b = 100
b = a * b / 10
sum = ->
  a + b

a = ->
  'bobobo'

a = 100
pow = (a) ->
  a * a
console.log a

b = 10
calc = (a) ->
  a * b
console.log b
a = 100
c = sum: a + b

a = b = 100
calc = (a) ->
  a * b
a /= b


class A

  constructor: (@code) ->

class B extends A

  constructor: ({ @name }) ->
    super @name
    a += 1000

b = new B name: a + b
b.name = 'override!!'

obj =
  a: 'foo'
obj.a
isObjA = obj.a?

if code is 'abc'
  code = new A code
if code
  code = new B code
codes = []
for code, i in codes
  console.log i, code

if a
  a = a / a
