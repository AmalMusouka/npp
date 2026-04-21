{- HLINT ignore "Use camelCase" -}
is_equiv :: (a -> a -> Bool) -> [a] -> Bool
is_equiv r xs = reflexive && symmetric && transitive
  where
    reflexive = all (\x -> r x x) xs
    symmetric = all (\x -> all (\y -> r x y == r y x) xs) xs
    transitive = all (\x -> all (\y -> all (\z -> not (r x y && r y z) || r x z) xs) xs) xs

classes :: (a -> a -> Bool) -> [a] -> [[a]]
classes r = foldr insert []
  where
    insert x [] = [[x]]
    insert x (c : cs)
      | r x (head c) = (x : c) : cs
      | otherwise = c : insert x cs

reflexive_closure :: (Eq a) => (a -> a -> Bool) -> (a -> a -> Bool)
reflexive_closure r x y = x == y || r x y