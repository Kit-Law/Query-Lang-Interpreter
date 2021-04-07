{ 
module Lexer where 
}



%wrapper "basic" 

--digits 
$digit = 0-9

--alphabetic characters
$alpha = [a-zA-Z]

--identifiers
$ident = [a-zA-Z][a-zA-Z0-9\_\’]*



tokens :-
  $white+           ; 
  "--".*            ; 
  INPUT             { \s -> TokenInput } 
  OUT               { \s -> TokenOut }
  WHERE             { \s -> TokenWhere }
  NOTHING           { \s -> TokenNothing }
  $ident            { \s -> TokenVar s }
  $ident\.csv       { \s -> TokenFilename s }
  [a-z]*$alpha      { \s -> TokenKey s }
  \?                { \s -> TokenQMark }
  \:                { \s -> TokenColon }             --hehe colon
  \;                { \s -> TokenSColon }            --hehe colon
  \,                { \s -> TokenComma }
  "=="              { \s -> TokenEq }
  "!="              { \s -> TokenNEq }



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