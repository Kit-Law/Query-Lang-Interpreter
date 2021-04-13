module Evaluator where
import Grammar

type Table = (Keys, [[String]])

{-|
Function    : eval
Description : Evaluate the root node of the parse tree
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
--eval ::

{-|
Function    : evalFiles
Description : Output a cross product of the result of evalFile
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalFiles :: Input -> Table
evalFiles (csvFile rest) = [((fst xs ++ fst ys), (snd xs) (snd ys)) | xs <- evalFile csvFile, ys <- evalFiles rest]
evalFiles csvFile = evalFile csvFile

{-|
Function    : evalFile
Description : read the file's data and return a pairing with the keys
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalFile :: CsvFile -> Table
evalFile filename keys = do file <- readFile filename
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
evalWhere :: Table -> Where -> Table
evalWhere (keys, contents) condition = (keys, (filter condition contents)) --TODO: make this 

{-|
Function    : evalOut 
Description : output to the output file
Copyright   : (c) University of Southampton 2020
Maintainer  : Christopher Lawrence
              Student ID: 31018742
              cl5g19@soton.ac.uk
Portability : WOCA
-}
evalOut :: Table -> Output -> [[String]]
evalOut (keys, contents)@table (o1, o2) = evalOut table --TODO: fix this lol