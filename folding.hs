-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- some binary function f + some starting value a (accumulator) and list [x_1 ... x_n]
-- returns x_1 f x_2 f x_3 f ... f x_n f a
-- foldr (\elem acc -> <term>) <start_acc> <list>

-- sum all elements of a list

-- sum = foldr (+) 0

-- logical and

-- and = foldr (&&) True

-- logical or

-- or = foldr (||) False

-- count number of x in a list
count e =
    foldr (\x acc -> if e==x then acc+1 else acc) 0

-- (backslash = lambda function)
-- length = foldr (\x -> (+) 1) 0
-- length = foldr (const $ (+) 1) 0 -- equivalent to previous

--map f = foldr((:) . f) []

isAll e = foldr (\x -> (&&) $ e==x) True

rev :: [a] -> [a] -- reverse a list
rev = foldl (\acc x -> x : acc) []

-- foldl (flip (:)) [] -- binary function with arguments in 'wrong order'

-- prefixes: return all prefixes of a given list
prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) )

