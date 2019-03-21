import Data.List

main :: IO ()
main = interact $ show . solve . map read . drop 1 . words

solve :: [Int] ->  Int
solve = maximum . map sum . group . duplList

duplList :: [Int] -> [Int]
duplList l = l ++ l
