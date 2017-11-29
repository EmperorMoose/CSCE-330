--A. Pierce Matthews
--CSCE-330
--Nov 17 2017
----------------------
-- Ex 1 &2 from Ch4 --
----------------------
--(1)
module Main where


halve :: [a] -> ([a],[a])
halve items = splitAt half items
    where
        half = (length items) `div` 2

--(2a)
safetail :: Eq a => [a] -> [a]
safetail xs = if xs == [] then [] else tail xs

--(2b)
safetail' :: Eq a => [a] -> [a]
safetail' xs
    | xs == [] = []
    | otherwise = tail xs

--(2c)
safetail'' :: Eq a => [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs

-----------------------
-- Ex 3,4,7 from Ch5 --
-----------------------
--(3)
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <-[1..n], x^2 + y^2 == z^2]

--(4)
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

isPerfect :: Int -> Bool
isPerfect n = let facs = factors n
              in sum (init facs) == last facs

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], isPerfect x]

--(5)
dotp :: [Int] -> [Int] -> Int
dotp xs ys = sum [x * y | (x, y) <- zip xs ys]
