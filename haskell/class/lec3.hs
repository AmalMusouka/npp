import Data.Char (toLower)
import Text.XHtml (rev)
import Prelude hiding (filter, flip, lookup, map)

lookup :: (Eq a) => a -> [(a, b)] -> Maybe b
lookup x [] = Nothing
lookup x ((k, v) : ps) =
  if x == k then Just v else lookup x ps

-- maybeToList :: Maybe a -> [a]
-- maybeToList (Just x) = [x]
-- maybeToList Nothing = []

maybeToList :: Maybe a -> [a]
maybeToList x = case x of
  Just y -> [y]
  Nothing -> []

factorial :: Int -> Int
factorial x = case x of
  0 -> 1
  _ -> x * factorial (x - 1)

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x : xs) = f x : map f xs

-- map' f xs = [f x | x <- xs]

filter :: (a -> Bool) -> [a] -> [a]
filter f [] = []
filter f (x : xs)
  | f x = x : filter f xs
  | otherwise = filter f xs
  where
    rest = filter f xs

find f [] = Nothing
find f (x : xs)
  | f x = Just x
  | otherwise = find f xs

add :: Int -> Int -> Int
add x =
  let f y = x + y + 10
   in f

add' x =
  \y -> x + y + 10

flip :: (a -> b -> c) -> (b -> a -> c)
-- flip f = (\x -> \y -> f y x)
flip f x y = f y x

cons :: Int -> [Int] -> [Int]
cons x xs = x : xs

twice :: (a -> a) -> (a -> a)
-- twice f =
--     let g x = f (f x)
--     in g

twice f x = f (f x)

pow :: Int -> (a -> a) -> (a -> a)
pow 0 f x = x
pow n f x = f (pow (n - 1) f x)

-- given an uncurried function, return the curried version
curry :: ((a, b) -> c) -> (a -> b -> c)
curry f x y = f (x, y)

comp :: (b -> c) -> (a -> b) -> (a -> c)
comp f g x = f (g x)

-- given a string convert ll characters to loewrcase
-- and then reverse the order of the words
-- input : "One Fine Day"
-- output : "day fine one"

foo s = unwords (reverse (words (map toLower s)))

foo' s = (unwords . reverse . words . map toLower) s

foo'' s = unwords $ reverse $ words $ map toLower s
