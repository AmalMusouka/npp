import Data.Char

join :: String -> [String] -> String
join sep [] = ""
join sep [word] = word
join sep (x : xs) = x ++ sep ++ join sep xs

capitalize :: String -> String
capitalize = go True
  where
    go newWord [] = []
    go newWord (x : xs)
      | x == ' ' = x : go True xs
      | newWord = toUpper x : go False xs
      | otherwise = x : go False xs

splitWord :: String -> (String, String)
splitWord [] = ("", "")
splitWord (' ' : xs) = ("", xs)
splitWord (x : xs) =
  let (word, rest) = splitWord xs
   in (x : word, rest)

strWords :: String -> [String]
strWords [] = []
strWords (' ' : xs) = strWords xs
strWords xs = word : strWords rest
  where
    (word, rest) = splitWord xs