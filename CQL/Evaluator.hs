module Evaluator where

type table = ([String], [[String]])

{-|
Function    : eval
Description : Evaluate the root node of the parse tree
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
eval ::

{-|
Function    : evalFiles
Description : Output a cross product of the result of evalFile
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalFiles :: -> table

{-|
Function    : evalFile
Description : read the file's data and return a pairing with the keys
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalFile :: -> table

{-|
Function    : evalWhere
Description : remove any row that doesn't sataisfy the condition
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalWhere :: table -> table

{-|
Function    : evalOut 
Description : output to the output file
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalOut :: mappings -> 