-- main function has type IO ()
main :: IO ()
main = putStrLn (greet "World")

greet :: [Char] -> [Char]
greet who = "Hello, " ++ who

addTwo :: Num a => a -> a -> a
addTwo a b = a + b

data Compass = North | South | East | West
    deriving (Eq, Ord, Enum, Show)

{- instance Show Compass where
  show North = "North"
  show East = "East"
  show West = "West"
  show South = "South" -}

{-instance Eq Compass where
  North == North = True
  East == East = True
  South == South = True
  West == West = True-}

-- a simple programming language

{- *Main> Number 1 == Number 1
True
*Main> Number 2 > Number 1
True
*Main> Add (Number 1) (Number 2)
Add (Number 1) (Number 2)
*Main> Add (Number 1) (Subtract (Number 10) (Number 2))
Add (Number 1) (Subtract (Number 10) (Number 2)) 
-}

data Expression = Number Int 
                | Add Expression Expression
                | Subtract Expression Expression
                deriving (Eq, Ord, Show)

-- calculate: return values
{-
*Main> calculate (Number 1)
1
*Main> calculate (Add (Number 1) (Number 10))
11
*Main> calculate (Subtract (Number 1) (Add (Number 5) (Number 5) ) )
-9
-}

calculate :: Expression -> Int
calculate (Number x) = x -- bind x to number stored in expr
calculate (Add x y) = (calculate x) + (calculate y)
calculate (Subtract x y) = (calculate x) - (calculate y)


-- redefine head / tail

newHead :: [a] -> a
newHead [] = error "Empty list"
newHead (x:xs) = x

-- x for single and xs for plural

newTail :: [a] -> [a]
newTail [] = error "Empty list"
newTail (x:xs) = xs