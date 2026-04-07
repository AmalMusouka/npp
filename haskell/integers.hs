go :: Integer -> Integer -> [Integer]
go k n
  | k * k > n = [n]
  | n `mod` k == 0 = k : go k (n `div` k)
  | otherwise = go (k + 1) n

factors :: Integer -> [Integer]
factors = go 2

isSquareFree :: [Integer] -> Bool
isSquareFree [] = True
isSquareFree [x] = True
isSquareFree (x1 : x2 : rest)
  | x1 == x2 = False
  | otherwise = isSquareFree (x2 : rest)

squareFree :: [Integer]
squareFree = [n | n <- [1 ..], isSquareFree (factors n)]

helper :: Integer -> Integer -> Integer -> Integer
helper lo hi n
  | lo > hi = hi
  | mid * mid <= n = helper (mid + 1) hi n
  | otherwise = helper lo (mid - 1) n
  where
    mid = (lo + hi) `div` 2

squareRoot :: Integer -> Integer
squareRoot n = helper 0 n n