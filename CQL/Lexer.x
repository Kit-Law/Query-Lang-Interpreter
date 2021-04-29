{ 
module Lexer where 
}



%wrapper "posn" 

--digits 
$digit = [0-9]

--alphabetic characters
$alpha = [a-zA-Z]

--identifiers
$alNum = [$alpha $digit \_ \']



tokens :-
  $white+           	 ; 
  "--".*            	 ; 
  INPUT             	 { \p s -> TokenInput p } 
  OUT               	 { \p s -> TokenOut p }
  WHERE             	 { \p s -> TokenWhere p }
  NOTHING           	 { \p s -> TokenNothing p }
  $alNum+\.csv         { \p s -> TokenFilename p s }
  \?                	 { \p s -> TokenQMark p }
  \:                	 { \p s -> TokenHasColumns p }
  \;                	 { \p s -> TokenTerminator p }
  \,                	 { \p s -> TokenKeySep p }
  "=="              	 { \p s -> TokenEq p }
  "!="              	 { \p s -> TokenNEq p }
  \>                   { \p s -> TokenGT p }
  ">="                 { \p s -> TokenGEq p }
  "<="                 { \p s -> TokenLEq p }
  \<                   { \p s -> TokenLT p }
  "&&"                 { \p s -> TokenAnd p }
  "||"                 { \p s -> TokenOr p }
  \"                   { \p s -> TokenSMark p }
  \(                   { \p s -> TokenLParen p }
  \)                   { \p s -> TokenRParen p }
  $alNum+              { \p s -> TokenString p s }



{

-- Each action has type :: AlexPosn -> String -> Token 
-- The token type: 
data Token = 
  TokenInput      AlexPosn        | 
  TokenOut        AlexPosn        | 
  TokenWhere      AlexPosn        |
  TokenNothing    AlexPosn        |
  TokenFilename   AlexPosn String |
  TokenString     AlexPosn String |
  TokenQMark      AlexPosn        |
  TokenHasColumns AlexPosn        |
  TokenTerminator AlexPosn        |
  TokenKeySep     AlexPosn        |
  TokenEq         AlexPosn        |
  TokenNEq        AlexPosn        |
  TokenSMark      AlexPosn        |
  TokenGT         AlexPosn        |
  TokenGEq        AlexPosn        |
  TokenLT         AlexPosn        |
  TokenLEq        AlexPosn        |
  TokenAnd        AlexPosn        |
  TokenOr         AlexPosn        |
  TokenLParen     AlexPosn        |
  TokenRParen     AlexPosn
  deriving (Eq,Show)


tokenPosn :: Token -> String
tokenPosn (TokenInput (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOut (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhere (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNothing (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFilename (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenString (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenQMark (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHasColumns (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTerminator (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenKeySep (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSMark (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGT (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLT (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}