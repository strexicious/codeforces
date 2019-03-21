main :: IO ()
main = interact $ show . solve . map read . words

solve :: [Int] -> Int
solve (n:m:_)
    | m `mod` n == 0 = factorsBy23 0 (m `div` n)
    | otherwise      = -1

factorsBy23 :: Int -> Int -> Int
factorsBy23 a 1 = a
factorsBy23 a n
    | n `mod` 2 == 0 = factorsBy23 (a+1) (n `div` 2)
    | n `mod` 3 == 0 = factorsBy23 (a+1) (n `div` 3)
    | otherwise      = -1
