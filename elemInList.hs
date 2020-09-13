--elemInList.hs return true if elem in list
import Data.List


elemIn :: (Eq a) => a -> [a] -> Bool
elemIn _ [] = False
elemIn x s
  | x == (head s) = True
  | otherwise = elemIn x (tail s)

--  is element in list
elemOf :: (Eq a) =>  a -> [a] -> Bool
elemOf _ [] = False
elemOf e (x:xs)  = (e == x) || (elemOf e xs)

