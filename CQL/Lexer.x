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
  $alNum+\.csv         { \s -> TokenFilename s }
  \?                	 { \s -> TokenQMark }
  \:                	 { \s -> TokenHasColumns }
  \;                	 { \s -> TokenTerminator }
  \,                	 { \s -> TokenKeySep }
  "=="              	 { \s -> TokenEq }
  "!="              	 { \s -> TokenNEq }
  \>                   { \s -> TokenGT }
  ">="                 { \s -> TokenGEq }
  "<="                 { \s -> TokenLEq }
  \<                   { \s -> TokenLT }
  \"                   { \s -> TokenSMark }
  $alNum+              { \s -> TokenString s }



{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInput           | 
  TokenOut             | 
  TokenWhere           |
  TokenNothing         |
  TokenFilename String |
  TokenString String   |
  TokenQMark           |
  TokenHasColumns      |
  TokenTerminator      |
  TokenKeySep          |
  TokenEq              |
  TokenNEq             |
  TokenSMark           |
  TokenGT              |
  TokenGEq             |
  TokenLT              |
  TokenLEq
  deriving (Eq,Show)
}