module Evaluator where
import Grammar

import System.IO  
import Control.Monad
import Data.Char  
import Data.List.Split
import Data.List

type Table = (Keys, [[ String ]])
data EvaledCon = EC Int ConditionOp Int

{-|
Function    : eval
Description : Evaluate the root node of the parse tree
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
eval :: Prog -> IO Table
eval (ProgNW input output) = do evaledInput <- evalInput input 
                                return evaledInput
eval (ProgW input whereArg output) = do evaledInput <- evalInput input 
                                        let filteredContent = evalWhere whereArg evaledInput
                                        return filteredContent
{-eval :: Prog -> IO [[ String ]]
eval (ProgNW input output) = do evaledInput <- evalInput input 
                                let evaledOutput = evalOut evaledInput
                                return evaledOutput
eval (ProgW input whereCon output) = do evaledInput <- evalInput input 
                                        let filteredContent = evalWhere evaledInput
                                        let evaledOutput = evalOut filteredContent
                                        return evaledOutput-}

{-|
Function    : evalInput
Description : Output a cross product of the result of evalFile
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalInput :: Input -> IO Table
evalInput (InputT csvFile) = evalFile csvFile
evalInput (InputNT csvFile rest) = do lhs <- evalFile csvFile
                                      rhs <- evalInput rest
                                      let keys = appendKeys (fst lhs) (fst rhs)
                                      return (keys, [lhsRow ++ rhsRow | lhsRow <- snd lhs, rhsRow <- snd rhs])
    where appendKeys :: Keys -> Keys -> Keys
          appendKeys (KeysNT key rest) remaining = KeysNT key (appendKeys rest remaining)
          appendKeys (KeysT key) remaining = KeysNT key remaining

{-|
Function    : evalFile
Description : read the file's data and return a pairing with the keys
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
          Student ID: 31018742
          cl5g19@soton.ac.uk
Portability : WOCA
-}
evalFile :: CsvFile -> IO Table
evalFile (File filename keys) = do file <- readFile filename
                               let ls = lines file
                               let contents = map (splitOn ",") ls
                               return (keys, contents)

{-|
Function    : evalWhere
Description : remove any row that doesn't sataisfy the condition
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalWhere :: Where -> Table -> Table
evalWhere (TmWhere condition) (keys, contents) = (keys, (filterByCon (evalCondition condition keys) contents))
    where filterByCon :: EvaledCon -> [[ String ]] -> [[ String ]]
          filterByCon (EC lhs Eq rhs) contents = [row | row <- contents, row !! lhs == row !! rhs]
          filterByCon (EC lhs NEq rhs) contents = [row | row <- contents, row !! lhs /= row !! rhs]

evalCondition :: Condition -> Keys -> EvaledCon
evalCondition (Condtn (OperandKey lhs) op (OperandKey rhs)) keys = EC (evalKey lhs keys) op (evalKey rhs keys)

evalKey :: Key -> Keys -> Int
evalKey key keys = evalKeyIndex key keys 0
    where evalKeyIndex :: Key -> Keys -> Int -> Int
          evalKeyIndex key (KeysNT fileKey rest) i 
              | key == fileKey = i
              | otherwise = evalKeyIndex key rest (i + 1)
          evalKeyIndex key (KeysT fileKey) i 
              | key == fileKey = i
              | otherwise = error "Key doesn't match."

{-|
Function    : evalOut 
Description : output to the output file
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
--evalOut :: Table -> Output -> [[String]]
--evalOut (keys, contents)@table (o1, o2) = evalOut table --TODO: fix this lol