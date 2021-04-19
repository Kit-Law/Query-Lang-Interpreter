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
           putStrLn (show sortedOutput)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()