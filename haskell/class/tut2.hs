import Prelude hiding (gcd)

fibsFrom :: Integer -> Integer -> [Integer]
fibsFrom x y = x : fibsFrom y (x + y)

fibs :: [Integer]
fibs = fibsFrom 1 1

sieve :: [Integer] -> [Integer]
sieve [] = error "no more primes"
sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Integer]
primes = sieve [2 ..]

gcd :: (Integral a) => a -> a -> a
gcd a 0 = a
gcd a b = gcd b (a `mod` b)

addVec :: (Num a) => [a] -> [a] -> [a]
-- addVec [] [] = []
-- addVec (x : xs) (y : ys) = (x + y)  : addVec xs ys
-- addVec xs ys = [x + y | (x, y) <- xs `zip` ys]
-- addVec xs ys = zipWith (+) xs ys
addVec = zipWith (+)

addMat :: (Num a) => [[a]] -> [[a]] -> [[a]]
-- addMat xs ys = zipWith addVec xs ys
addMat = zipWith addVec

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (p : xs) =
  quicksort [x | x <- xs, x < p] ++ [p] ++ quicksort [x | x <- xs, x >= p]

dedup :: [Int] -> [Int]
dedup [] = []
dedup [x] = [x]
dedup (x : y : xs)
  | x == y = rest
  | otherwise = x : rest
  where
    rest = dedup (y : xs)

-- Return the sum of the proper divisors of n
divisorSum :: Int -> Int
divisorSum n =
  let xs = [x | x <- [2 .. floor (sqrt (fromIntegral n))], n `mod` x == 0]
   in sum (dedup (1 : xs ++ reverse [n `div` x | x <- xs]))

amicable :: Int -> Bool
amicable a =
  let b = divisorSum a
   in a /= b && divisorSum b == a

euler21 :: Int
euler21 = sum [x | x <- [1 .. 9999], amicable x]