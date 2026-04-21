import Data.List (delete, nub)

elect :: [[String]] -> [String]
elect ballots = go ballots []
  where
    go ballots eliminated
      | null (concat ballots) = eliminated
      | otherwise =
          let all_candidates = nub (concat ballots)
              first_choices = map head (filter (not . null) ballots)
              total_votes = [(c, length (filter (== c) first_choices)) | c <- all_candidates]
              min_votes = minimum (map snd total_votes)
              to_eliminate = head [c | (c, votes) <- total_votes, votes == min_votes]
              new_ballots = map (delete to_eliminate) ballots
           in go new_ballots (eliminated ++ [to_eliminate])