module Evaluator ( eval ) where

import Grammar

import System.IO
import Data.List.Split

type Table = (Keys, [[ String ]])
data EvaledCon = EC Oprd ConditionOp Oprd
data Oprd = OI Int | OK String

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
          filterByCon condition contents = [row | row <- contents, fuck condition row]

fuck :: EvaledCon -> [ String ] -> Bool
fuck (EC lhs Eq rhs) row = cunt lhs row == cunt rhs row
fuck (EC lhs NEq rhs) row = cunt lhs row /= cunt rhs row

cunt :: Oprd -> [ String ] -> String
cunt (OI i) row = row !! i
cunt (OK str) _ = str

{-|
Function    : evalCondition
Description : find the correct indexes for the keys
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalCondition :: Condition -> Keys -> EvaledCon
evalCondition (Condtn lhs op rhs) keys = 
    EC (evalOperand lhs keys) op (evalOperand rhs keys)
    where evalOperand :: Operand -> Keys -> Oprd
          evalOperand (OperandKey operand) keys = OI (evalKey operand keys)
          evalOperand (OperandConst string) _ = OK string
          evalOperand (OperandNothing) _ = OK ""

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
              | otherwise = error "Key doesn't match."

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
          evalOutArg (OutArgIf (If condition true false)) tableKeys row = 
              row !! evalKey (evalInlineIf (evalCondition condition tableKeys) true false row) tableKeys
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
          evalInlineIf :: EvaledCon -> Key -> Key -> [ String ] -> Key
          evalInlineIf condition true false row
              | fuck condition row = true
              | otherwise = false
          evalInlineIf condition true false row
              | fuck condition row = true
              | otherwise = false