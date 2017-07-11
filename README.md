# SideKicK

SideKicK is a collection of convenient helper methods in Swift to promote speed and intuitive coding.

## Documentation

### String

##### subscript(index: Int) -> String
Subscripting with an integer gives you the character at that index. Negative integers give you character starting from the end of the string.
```sh
"Hello World"[1] 
// "e"
"Hello World"[-1] 
// "d"
```

#####   func substring(from: Int, to: Int) -> String?
Returns substring starting from and ending by given parameters
The substring will not include character at index number 'to'
```sh
"Hello World".substring(from: 0, to: 4) 
// "Hell"
```

#####   func substring(from: Int, through: Int) -> String?
Returns substring starting from and ending at given parameters
The substring will include character at index number 'through'
```sh
"Hello World".substring(from: 0, through: 4)
// "Hello"
```

#####   func substring(from start: Int, by end: Int) -> String?
Returns substring starting from given parameter and ending 'by' indexes after
The parameter 'by' does not include the initial index
```sh
"Hello World".substring(from: 7, by: 1)
// "or"
```

#####   substring(start: Int, size: Int) -> String?
Returns substring starting from and with the size of the given parameters
The parameter 'size' does include the initial index
```sh
"Hello World".substring(start: 0, size: 5)
// "Hello"
```

##### length: Int
Returns length of the string
```sh
"SideKick".length
// 8
```

### Int

##### times(block: () -> ())
Swift port of the Ruby #times
An easy way to run a block of code n times
```sh
3.times {
  print("Beetlejuice")
}
   >> Beetlejuice
   >> Beetlejuice
   >> Beetlejuice
```

##### upTo(_ x: Int, _ block: (Int) -> ())
Swift port of the Ruby #upTo
```sh
1.upTo(5) { n in
  print(n)
}
   >> 1
   >> 2
   >> 3
   >> 4
   >> 5
```

##### downTo(_ x: Int, block: (Int) -> ())
Swift port of the Ruby #downTo
```sh
3.upTo(1) { n in
  print(n)
}
   
   >> 3
   >> 2
   >> 1
```

##### downTo(_ x: Int, block: (Int) -> ())
step(_ to: Int, _ by: Int, block: (Int) -> ())
```sh
0.step(10, 2) { n in
  print(n)
}
   
   >> 0
   >> 2
   >> 4
   >> 6
   >> 8
   >> 10
```

##### ordinal: String
step(_ to: Int, _ by: Int, block: (Int) -> ())
```sh
5.ordinal
// 5th
```

##### spelledOut: String
step(_ to: Int, _ by: Int, block: (Int) -> ())
```sh
5.spelledOut
// "five"
```

##### scientific: String
step(_ to: Int, _ by: Int, block: (Int) -> ())
```sh
123.scientific
// "1.23E2"
// "five"
```

##### currency: String
step(_ to: Int, _ by: Int, block: (Int) -> ())
```sh
123.currency
"$123"
```



### Date

##### shortDate: String
```sh
Date().shortDate
//
```
