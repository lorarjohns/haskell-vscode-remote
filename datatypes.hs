data Color =
    Red | Orange | Yellow | Green | Blue

data PeaNum = 
    Succ PeaNum | Zero --recursive definition

incr :: PeaNum -> PeaNum
incr = Succ

decr :: PeaNum -> PeaNum
decr (Succ n) = n

data Calculation = 
    Add Int Int | Sub Int Int | Mul Int Int | Div Int Int

data Tree a = Leaf | Node (Tree a) a (Tree a)