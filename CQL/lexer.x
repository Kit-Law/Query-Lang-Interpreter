{ 
module Lexer where 
}



%wrapper "basic" 

--digits 
$digit = [0-9]

--alphabetic characters
$alpha = [a-zA-Z]

--identifiers
$rest = [$alpha $digit \_ \']



tokens :-
  $white+           	; 
  "--".*            	; 
  INPUT             	{ \s -> TokenInput } 
  OUT               	{ \s -> TokenOut }
  WHERE             	{ \s -> TokenWhere }
  NOTHING           	{ \s -> TokenNothing }
  $alpha $rest*         { \s -> TokenVar s }
  $alpha $rest*\.csv    { \s -> TokenFilename s }
  [a-z]*$alpha      	{ \s -> TokenKey s }
  \?                	{ \s -> TokenQMark }
  \:                	{ \s -> TokenColon }             --hehe colon
  \;                	{ \s -> TokenSColon }            --hehe colon
  \,                	{ \s -> TokenComma }
  "=="              	{ \s -> TokenEq }
  "!="              	{ \s -> TokenNEq }



{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInput           | 
  TokenOut             | 
  TokenWhere           |
  TokenNothing         |
  TokenVar String      |
  TokenFilename String |
  TokenKey String      |
  TokenQMark           |
  TokenColon           |
  TokenSColon          |
  TokenComma           |
  TokenEq              |
  TokenNEq             
  deriving (Eq,Show) 
}