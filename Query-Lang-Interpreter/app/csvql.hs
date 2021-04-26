import Lexer
import Grammar
import Evaluator

import System.Environment
import Control.Exception
import System.IO
import Data.List

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           let parsedProg = parser (alexScanTokens sourceText)
           output <- eval parsedProg
           let sortedOutput = sort output
           formatCSV sortedOutput

{-|
Function    : formatCSV
Description : print to the console the outputted table in a csv format
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
formatCSV :: [[ String ]] -> IO ()
formatCSV [] = return ()
formatCSV (line:lines) = do putStrLn $ formatRow line
                            formatCSV lines

{-|
Function    : formatRow
Description : format a string array into a csv format
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
formatRow :: [ String ] -> String
formatRow (cell:[]) = cell
formatRow (cell:row) = cell ++ "," ++ formatRow row

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()