main :: IO ()
main = interact $ show . solve . map read . words

listIntoPairList :: [a] -> [(a, a)]
listIntoPairList [] = []
listIntoPairList (x1:x2:xs) = (x1, x2) : listIntoPairList xs

secondLessEq :: Int -> (Int, Int) -> Bool
secondLessEq n (_, r) = n <= r

solve :: [Int] -> Int
solve (chaps:rest) = length . filter (secondLessEq (last rest)) . listIntoPairList . take (2*chaps) $ rest
