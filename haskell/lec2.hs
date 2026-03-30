-- insert into a sorted list

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
-- insert x (y : ys) =
--     if x <= y then x : y : ys  else y : insert x ys
insert x (y ; ys)
    | (x <= y) = x : y : ys
    | otherwise = y : insert x ys

sign :: Int -> Int
sign xs
    | x > 0 = 1
    | x < 0 = -1
    | otherwise = 0

sign1 0 = 0
sign1 x 
    | x > 0 = 1
    | otherwise = -1


sort :: [Int] -> [Int]
sort [] = []
sort (x : xs) = insert x (sort xs)

first :: (a, b) -> a
first (x, _) = x

fac :: Integer -> Integer
fac x
 | x == 0 = 1
 | otherwise = x * fac (x - 1)

foo :: Int -> Int -> (Int, Int)
foo x y =
    let square :: Int -> Int
        square z = z * z --local function
        x2 = square x
        y2 = square y
    in (x2 + y2, x2 - y2)

foo2 :: Int -> Int -> (Int, Int)
foo2 x y = (x2 + y2, x2 - y2)
    where x2 = x * x
          y2 = y * y2

-- retrieve only odd values in a list
only_odd :: [Int] -> [Int]
only_odd [] = []
only_odd (x : xs)
    | (x `mod` 2 == 1) = x : rest
    | otherwise = rest
    where rest = only_odd xs

-- mem x xs : true if x is a member of xs
mem :: Eq a => a -> [a] -> Bool
mem x [] = False
mem x (y : ys) = x == y || mem x ys

-- range x y produces the list [x, ..., y]
range :: Eq a => Enum a => a -> a -> [a]
range x y
    | x == y = [x]
    | otherwise = x : range (succ x) y

list_sum :: Num a => [a] -> a
list_sum [] = 0
list_sum (x : xs) = x + list_sum xs


