module Main where
import Data.Char
import Debug.Trace
import Data.List
import Numeric
import Control.Monad

--Alonzo Church invented lambda calc
--Functional programming language is List
--
--type
--imperative

middleList :: [a] -> a
middleList xs = xs !! m
  where m = (length xs) `div` 2

trim :: [a] -> [a]
trim [] = []
trim [x] = []
trim xs = tail (init xs)

nand :: Bool -> Bool -> Bool
nand True True = False
nand True False = True
nand False True = True
nand False False = True

nandp :: Bool -> Bool -> Bool
nandp x y
  | (x /= False) && (x == y) = False
  | otherwise = True

--lambda for the cube of x minus the square of y
--(\x y -> (x*x*x)-(y*y))
{-
getPrice :: Eq a => a -> [a] -> [b] -> Int
getPrice z xs ys = ys !! n
  where n = indexOf z xs

indexOf :: Eq a => a -> [a] -> Int
indexOf x (y:ys)
  | x==y = 0
  | otherwise = 1+indexOf x ys
-}
