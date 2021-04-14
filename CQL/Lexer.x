{ 
module Lexer where 
}



%wrapper "basic" 

--digits 
$digit = [0-9]

--alphabetic characters
$alpha = [a-zA-Z]

--identifiers
$alNum = [$alpha $digit \_ \']



tokens :-
  $white+           	 ; 
  "--".*            	 ; 
  INPUT             	 { \s -> TokenInput } 
  OUT               	 { \s -> TokenOut }
  WHERE             	 { \s -> TokenWhere }
  NOTHING           	 { \s -> TokenNothing }
  $alNum*\.csv         { \s -> TokenFilename s }
  [a-z]$alNum*      	 { \s -> TokenKey s }
  \?                	 { \s -> TokenQMark }
  \:                	 { \s -> TokenHasColumns }
  \;                	 { \s -> TokenTerminator }
  \,                	 { \s -> TokenKeySep }
  "=="              	 { \s -> TokenEq }
  "!="              	 { \s -> TokenNEq }



{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInput           | 
  TokenOut             | 
  TokenWhere           |
  TokenNothing         |
  TokenFilename String |
  TokenKey String      |
  TokenQMark           |
  TokenHasColumns      |
  TokenTerminator      |
  TokenKeySep          |
  TokenEq              |
  TokenNEq             
  deriving (Eq,Show)
}