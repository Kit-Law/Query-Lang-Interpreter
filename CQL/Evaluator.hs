module Evaluator ( eval ) where

import Grammar

import System.IO
import Data.List.Split

type Table = (Keys, [[ String ]])

{-|
Function    : eval
Description : Evaluate the root node of the parse tree
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
eval :: Prog -> IO [[ String ]]
eval (ProgNW input output) = do evaledInput <- evalInput input 
                                let evaledOutput = evalOut evaledInput output
                                return evaledOutput
eval (ProgW input whereCon output) = do evaledInput <- evalInput input 
                                        let filteredContent = evalWhere whereCon evaledInput
                                        let evaledOutput = evalOut filteredContent output
                                        return evaledOutput

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
evalInput (InputT csvFile) = do table <- evalFile csvFile
                                checkKeys table csvFile
                                return table 
evalInput (InputNT csvFile rest) = do lhs <- evalFile csvFile
                                      checkKeys lhs csvFile
                                      rhs <- evalInput rest
                                      let keys = appendKeys (fst lhs) (fst rhs)
                                      return (keys, [lhsRow ++ rhsRow | lhsRow <- snd lhs, rhsRow <- snd rhs])
    where appendKeys :: Keys -> Keys -> Keys
          appendKeys (KeysNT key rest) remaining = KeysNT key (appendKeys rest remaining)
          appendKeys (KeysT key) remaining = KeysNT key remaining

{-|
Function    : checkKeys
Description : This function checks that the number of keys is the same as the row size
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
checkKeys :: Table -> CsvFile -> IO ()
checkKeys (keys, (row:_)) (File filename _)
  | keylen > rowSize = error $ "-------------CSVQL Error---------------\n" ++
                              "Runtime Error - File: " ++ filename ++ ", not enough rows."
                              ++ "\n\n" ++ "------Corresponding Evaluator Error------"
  | keylen < rowSize = error $ "-------------CSVQL Error---------------\n" ++
                              "Runtime Error - File: " ++ filename ++ ", too many rows."
                              ++ "\n\n" ++ "------Corresponding Evaluator Error------"
  | otherwise = return ()

  where keylen = keyLength keys
        rowSize = length row

        keyLength :: Keys -> Int
        keyLength (KeysNT key rest) = 1 + keyLength rest
        keyLength (KeysT key) = 1

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
evalWhere (TmWhere condition) (keys, contents) = (keys, (filterByCon condition keys contents))
    where filterByCon :: Conditions -> Keys -> [[ String ]] -> [[ String ]]
          filterByCon condition keys contents = [row | row <- contents, evalConditions condition keys row]

{-|
Function    : evalConditions
Description : evaluates the lhs and rhs of an and or an or operation
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalConditions :: Conditions -> Keys -> [ String ] -> Bool
evalConditions (ConditionsT con) keys row = evalCondition con keys row
evalConditions (ConditionsAnd lhs rhs) keys row = evalConditions lhs keys row && evalConditions rhs keys row
evalConditions (ConditionsOr lhs rhs) keys row = evalConditions lhs keys row || evalConditions rhs keys row 

{-|
Function    : evalCondition
Description : evaluates the condition into a boolean
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalCondition :: Condition -> Keys -> [ String ] -> Bool
evalCondition (Condtn lhs Eq rhs) keys row = evalOperand lhs keys row == evalOperand rhs keys row
evalCondition (Condtn lhs NEq rhs) keys row = evalOperand lhs keys row /= evalOperand rhs keys row
evalCondition (Condtn lhs Gt rhs) keys row = evalOperand lhs keys row > evalOperand rhs keys row
evalCondition (Condtn lhs GEq rhs) keys row = evalOperand lhs keys row >= evalOperand rhs keys row
evalCondition (Condtn lhs Lt rhs) keys row = evalOperand lhs keys row < evalOperand rhs keys row
evalCondition (Condtn lhs LEq rhs) keys row = evalOperand lhs keys row <= evalOperand rhs keys row

{-|
Function    : evalOperand
Description : gets the value of the operand
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalOperand :: Operand -> Keys -> [ String ] -> String
evalOperand (OperandKey key) keys row = row !! (evalKey key keys)
evalOperand (OperandConst string) _ _ = string
evalOperand (OperandNothing) _ _ = ""

{-|
Function    : evalKey
Description : get the index of the key from the main table
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalKey :: Key -> Keys -> Int
evalKey key keys = evalKeyIndex key keys 0
    where evalKeyIndex :: Key -> Keys -> Int -> Int
          evalKeyIndex key (KeysNT fileKey rest) i 
              | key == fileKey = i
              | otherwise = evalKeyIndex key rest (i + 1)
          evalKeyIndex key (KeysT fileKey) i 
              | key == fileKey = i
              | otherwise = error $ "-------------CSVQL Error---------------\n" ++
                                  "Runtime Error - Key: " ++ key ++ ", couldn't find a match."
                                  ++ "\n\n" ++ "------Corresponding Evaluator Error------"

{-|
Function    : evalOut 
Description : create the final output list
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalOut :: Table -> Output -> [[ String ]]
evalOut (tableKeys, contents) output = map (evalOutRow output tableKeys) contents
    where {-|
          Function    : evalOutRow 
          Description : evaluate a row form the table
          Copyright   : (c) University of Southampton 2020
          Maintainer  : Christopher Lawrence
                        Student ID: 31018742
                        cl5g19@soton.ac.uk
          Portability : WOCA
          -}
          evalOutRow :: Output -> Keys -> [ String ] -> [ String ]
          evalOutRow (OutputT arg) tableKeys row = 
              evalOutArg arg tableKeys row : []
          evalOutRow (OutputNT arg rest) tableKeys row = 
              evalOutArg arg tableKeys row : evalOutRow rest tableKeys row

          {-|
          Function    : evalOutArg 
          Description : evaluate one of the output arguments
          Copyright   : (c) University of Southampton 2020
          Maintainer  : Christopher Lawrence
                        Student ID: 31018742
                        cl5g19@soton.ac.uk
          Portability : WOCA
          -}
          evalOutArg :: OutArg -> Keys -> [ String ] -> String
          evalOutArg (OutArgIf (If conditions true false)) tableKeys row = 
              row !! evalKey (evalInlineIf conditions tableKeys true false row) tableKeys
          evalOutArg (OutArgKey key) tableKeys row = 
              row !! evalKey key tableKeys
          evalOutArg (OutArgConst str) _ _ = str
          evalOutArg (OutArgNothing) _ _ = ""

          {-|
          Function    : evalInlineIf 
          Description : if the condition holds then output the first key otherwise the second
          Copyright   : (c) University of Southampton 2020
          Maintainer  : Christopher Lawrence
                        Student ID: 31018742
                        cl5g19@soton.ac.uk
          Portability : WOCA
          -}
          evalInlineIf :: Conditions -> Keys -> Key -> Key -> [ String ] -> Key
          evalInlineIf conditions keys true false row
              | evalConditions conditions keys row = true
              | otherwise = false