---
  i[] = True
  i[x] = True
  i(x:y:xs) = (x <= y) && (y:xs)

  isasc [] = True
  isasc [x] = True
  isAsc (x:xs) = x <= head && isAsc xs
---
## ghci commands

`:load`
`:reload`
`:info`
`:type`
`:edit`
`:set editor vi`

## Data types

```
Prelude> ['H','e','l','l','o']
"Hello"
```

### Lists
Lists are defined recursively:

```
Prelude> :info []
data [] a = [] | a: [a]
```

```
Prelude> 1 : []
[1]
```

```
Prelude> 'H' : 'e' : 'l' : 'l' : 'o' : []
"Hello"
```

Add lists with `++`

```
Prelude> head [1,2,3]
1
Prelude> tail [1,2,3]
[2,3]
```

### Tuples

```
Prelude> :type (1,2,3)
```

Tuples can have mixed type elements

```
Prelude> :type (1, "String", False)
 (1, "String", False) :: Num t => (t, [Char], Bool)
 ```

 But building a list of tuples requires all the tuples to be the same type

### Maybe

A datatype that might return a value

```
Prelude> :info lookup
lookup :: Eq a=> a -> [(a,b)] -> Maybe b
```

Use `lookup` and a list of tuples:
```
Prelude> let dict = [("one", 1), ("two", 2), ("three", 3)]
Prelude> lookup "one" dict
Just 1
Prelude> lookup "two" dict
Just 2
Prelude> lookup "four" dict
Nothing
```

## Ranges

```
[0..10]
[1,2..10]
[1,3..10]
```

## Functions

`main` function has type `main :: IO ()`

Functions act like mathematical functions
_partial_ functions only have output values for some subset of possible inputs (problem solvable with `Maybe`)

rather than mapping (Int, Int) to Int
Haskell takes Int as input and returns a new _function_ that takes in an Int and returns an Int
Int -> Int -> Int 

```
*Main> :type addTwo 1
addTwo 1 :: Num a => a -> a
```

can call partial functions:

```
*Main> add1 = addTwo 1
*Main> :type add1
add1 :: Num a => a -> a
```

explicit parameter:

```
*Main> add1 b = addTwo 1 b
*Main> add1 2
3
```
 Those two definitions are exactly the same apart from the presence of
 the extra parameter `b`. So if you have two functions with parameters on the right you can simply get rid of them and instead use what's called a partially applied function here. You may see this referred to as an eta-reduction. 

 ```
 add a b = (+) a b
 add a = (+) a
 add = (+)
 ```
### Currying

### Point-free style

## Data structures

### Synonyms

`[Char]` is equivalent to `String`
```
Prelude> ("Hello" :: String) ++ (", World" :: [Char])
"Hello, World"
```

declaring with `type`

```
type String = [Char]
```

### Algebraic data types

```
data Bool = False | True
```
Need to define instances for `Show`, `Eq`, `Enum`, `Ord` (`succ`), etc.
Can generate automatically with `deriving`

```
data Compass = North | South | East | West
instance Show Compass where
  show North = "North"
  show East = "East"
  show West = "West"
  show South = "South"
```

## Compiling

Use `ghc`
Files are big unless you add `-dynamic` flag after `--` options

```
stack ghc -- -dynamic test.hs
ls -ltrh
```