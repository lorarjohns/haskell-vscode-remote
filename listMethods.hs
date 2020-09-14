import Data.List

sumOf :: [Int] -> Int
sumOf [] = 0
sumOf (x:xs) = x + sumOf xs

evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
  | mod x 2 == 0 = x : evens xs
  | otherwise = evens xs

addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [x+y | (x,y) <- xs]

asc  :: Int -> Int  -> [Int]
asc n m
  | m < n = []
  | m == n = [m]
  | m > n = n : asc (n+1) m

elemIn :: (Eq a) => a -> [a] -> Bool
elemIn _ [] = False
elemIn x s
  | x == (head s) = True
  | otherwise = elemIn x (tail s)

elemOf :: (Eq a) =>  a -> [a] -> Bool
elemOf _ [] = False
elemOf e (x:xs)  = (e == x) || (elemOf e xs)

-- remove duplicates from list
deDupe :: (Eq a) => [a] -> [a]
deDupe [] = []
deDupe (x:xs)
  | x `elemOf` xs = deDupe xs
  | otherwise = x : deDupe xs

--is Ascending with repeats

isAsc ::  [Int] -> Bool
isAsc [] = True
isAsc (x:xs)
  | length (x:xs) == 1 = True
  | x > (head xs) = False
  | otherwise = isAsc xs 

{-
  
-}
--- hasPath :: [(Int, Int)] -> Int -> Int -> Bool
--- hasPath [] x y = x == y
--- hasPath edges x y
---   | (x, y) `elemOf` edges = True
---   | otherwise = 
---       let newEdges = [edge | edge <- edges, y /= snd edge]
---           newNodes = [fst edge | edge <- edges, y == snd edge]
---           in any (hasPath newEdges x) newNodes
      
-- [(1,2) , (2,3) , (3,2) , (4,3) , (4,5)]

hasPath :: [(Int, Int)] ->  Int ->  Int -> Bool
hasPath [] x y = x == y
hasPath edges x y
  | x ==  y = True
  | otherwise = 
    let edges'= [(n,m) | (n,m) <- edges, n /= x] in 
        or [hasPath edges' m y | (n,m) <-  edges, n == x]