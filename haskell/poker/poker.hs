import Data.List (group, sort, sortBy)

better :: [Int] -> [Int] -> Bool
better x y = score x > score y

score :: [Int] -> ([Int], [Int])
score hand = (map fst groups, map snd groups)
  where
    groups = sortBy comp [(length g, head g) | g <- group (sort hand)]
    comp (card_1, value_1) (card_2, value_2) = compare (card_2, value_2) (card_1, value_1)