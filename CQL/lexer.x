{ 
module Tokens where 
}

%wrapper "basic" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
  $white+       ; 
  "--".*        ; 
  INPUT         { \s -> TokenInput } 
  OUT           { \s -> TokenOut }
  WHERE         { \s -> TokenWhere }
  \?            { \s -> TokenInlineIf }
  NOTHING       { \s -> TokenNothing }
  \==           { \s -> TokenEq }
  \!=           { \s -> TokenNEq }
  $alpha [$alpha $digit \_ \’]*   { \s -> TokenVar s } 

{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenInput        | 
  TokenOut          | 
  TokenWhere        |
  TokenInlineIf     |
  TokenNothing      |
  TokenEq           |
  TokenNEq
  deriving (Eq,Show) 
}
