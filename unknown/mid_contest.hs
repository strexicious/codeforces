import Text.Printf

data Time = Time Int Int
    deriving Show

main :: IO ()
main = interact $ toString . stampToTime . solve . map (timeToStamp . toTime) . words

toTime :: String -> Time
toTime (h1:h2:':':m1:m2:[]) = Time (read [h1, h2]) (read [m1, m2])
toTime _                    = Time 0 0

toString :: Time -> String
toString (Time h m) = (printf "%02d" h) ++ ":" ++ (printf "%02d" m)

timeToStamp :: Time -> Int
timeToStamp (Time h m) = h * 60 + m

stampToTime :: Int -> Time
stampToTime stamp = Time (stamp `div` 60) (stamp `mod` 60)

solve :: [Int] -> Int
solve (s1:s2:[]) = (s2 - s1) `div` 2 + s1
solve _          = 0
