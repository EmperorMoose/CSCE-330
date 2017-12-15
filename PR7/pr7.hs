--A. Pierce Matthews

module Main where
import Data.Char
import Debug.Trace
import Data.List
import Numeric
import Control.Monad

--indexInto returns the index of the first argument in a list
--(don't worry about error checking -- can assume in list)
indexInto :: Eq a => a -> [a] -> Int
indexInto x (y:ys) = loop' x (y:ys) 0
    where loop' x (y:ys) n
            | x == y = n
            | n == 10 = 0
            | otherwise = loop' x (y:ys) n+1

--converts a character into its corresponding integer value
-- e.g. '0' to 0, 'A' to 10, 'Z' to 35
-- like hex, except with more digits
-- (consider using elem -- look it up)
dig2Int :: Char -> Int
dig2Int dChar = digitToInt dChar

--converts an integer in range 0..35 into its
-- corresponding digit (0,1..Z)
-- again, don't care about ints out of bounds
num2char :: Int -> Char
num2char n = intToDigit n

--convert an integer into a binary number
int2bin :: Int -> Int
int2bin 0 = 0;
int2bin n
  | (n `div` 2) == 0 = x
  | otherwise = x + (n `mod` 2)
    where x = 0

--converts an integer value to a string representing
-- the number in base b
-- suggest looking up repeated division strategy
-- for how to convert base 10 to binary and
-- then generalize
int2Base :: Int -> Int -> String
int2Base n b = "not done yet"

--convert a number string in base b1 into an Int
-- can assume input is valid
valNumString :: String -> Int -> Int
valNumString (xs) b1 = -1

--convert String of numbers in base b1 into
-- equivalent value in base b2, as a String
-- again, all input will be valid
convert :: String -> Int -> Int -> String
convert numString b1 b2 = "not done yet"


--TESTING CODE: DO NOT CHANGE
score = scConvert + scVNString + scInt2Base + scNum2Char + scDig2Int + scIndexInto
  where
    scIndexInto = test2 "test: indexInto " indexInto [0,5,10] [[0..10],[0..10],[0..10]] [0,5,10] 10
    scDig2Int   = test1 "test: dig2Int " dig2Int ['0','9','A','Z'] [0,9,10,35] 10
    scNum2Char  = test1 "test: num2char " num2char [0,9,10,35] ['0','9','A','Z'] 10
    scInt2Base  = test2 "test: int2Base " int2Base [10,10,10,34,34,71,115] [2,16,30,35,34,35,11] ["1010","A","A","Y","10","21","A5"] 30
    scVNString  = test2 "test: valNumString " valNumString ["1010","A","A","Y","10","21","A5"] [2,16,30,35,34,35,11]  [10,10,10,34,34,71,115] 30
    scConvert  = test3 "test: convert " convert ["1010","1010","1010","1111","1111","13","YES"] [2,2,2,2,2,12,34] [10,16,33,10,12,2,19] ["10","A","A","15","13","1111","5F53"] 10

test1 msg f [] [] value = trace (msg++" passed!") value
test1 msg f (arg:args) (expected:expecteds) value
  | result == expected = test1 msg f args expecteds value
  | otherwise = trace (msg ++ "on input "++ show arg ++ " returned " ++ show result ++ ", expected " ++ show expected ) 0
    where
       result = f arg

test2 msg f [] [] [] value = trace (msg++" passed!") value
test2 msg f (arg1:args1) (arg2:args2) (expected:expecteds) value
  | result == expected = test2 msg f args1 args2 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++ " returned " ++ show result ++ ", expected " ++ show expected ) 0
    where
       result = f arg1 arg2

test3 msg f [] [] [] [] value = trace (msg++" passed!") value
test3 msg f (arg1:args1) (arg2:args2) (arg3:args3) (expected:expecteds) value
  | result == expected = test3 msg f args1 args2 args3 expecteds value
  | otherwise = trace (msg ++ "on inputs "++ show arg1 ++" "++ show arg2++ " " ++ show arg3 ++" returned " ++ show result ++ ", expected " ++ show expected ) 0
    where
       result = f arg1 arg2 arg3
