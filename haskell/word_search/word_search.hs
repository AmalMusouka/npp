{- HLINT ignore "Use camelCase" -}

import Data.Char (toLower)
import Data.List (isPrefixOf, tails, transpose)

search :: [String] -> [String] -> [Int]
search grid = map (word_count grid)

word_count :: [String] -> String -> Int
word_count grid word =
  let word_to_lower = map toLower word
      lower_grid = map (map toLower) grid
      search_strings = get_search_strings lower_grid
   in sum [total_count word_to_lower s | s <- search_strings]

get_search_strings :: [String] -> [String]
get_search_strings grid =
  let rows = grid
      rows_reversed = map reverse rows
      cols = transpose grid
      cols_reversed = map reverse cols
   in rows ++ rows_reversed ++ cols ++ cols_reversed

total_count :: String -> String -> Int
total_count word str = length (filter (isPrefixOf word) (tails str))