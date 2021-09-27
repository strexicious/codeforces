import Data.List

main :: IO ()
main = interact $ intercalate " " . map show . solve . map read . words

solve :: [Int] -> [Int]
solve (n:difs) = if (hasDup . sort $ res) || hasGreater n res then [-1] else res
    where res = map ((+) (1 + abs (minimum cbp))) cbp
          cbp = basePerm difs

hasGreater :: Int -> [Int] -> Bool
hasGreater _ []     = False
hasGreater n (x:xs) = n < x || hasGreater n xs

hasDup :: Eq a => [a] -> Bool
hasDup (x:y:xs) = x == y || hasDup (y:xs)
hasDup _        = False

arithSum :: Int -> Int
arithSum n = (n * (n+1)) `div` 2

basePerm :: [Int] -> [Int]
basePerm (x:[]) = [0 - x] ++ [0]
basePerm (x:xs) = [head restPerm - x] ++ restPerm
    where restPerm = basePerm xs
