--preamble

{
module Grammar where
import Lexer
}



%name parser
%tokentype {Token}
%error {parseError}



%token
  input    {TokenInput}
  out      {TokenOut}
  where    {TokenWhere}
  nothing  {TokenNothing}
  filename {TokenFilename $$}
  string   {TokenString $$}
  '?'      {TokenQMark}
  ':'      {TokenHasColumns}
  ';'      {TokenTerminator}
  ','      {TokenKeySep}
  "=="     {TokenEq}
  "!="     {TokenNEq}
  '>'      {TokenGT}
  ">="     {TokenGEq}
  '<'      {TokenLT}
  "<="     {TokenLEq}
  "&&"     {TokenAnd}
  "||"     {TokenOr}
  '"'      {TokenSMark}




--associations

%nonassoc input out where
%left ';'
%left nothing filename string
%left '?'
%left "||"
%left "&&"
%left "==" "!=" '>' '<'
%left ':' ','
%left '"'
%left '(' ')'



--productions

--i thought a production and token with the same
--name would be confusing, so the expressions have Exp at the end

--all these productions will need actions

%%
Prog : input InputExp WhereExp out OutExp    {ProgW $2 $3 $5}
     | input InputExp out OutExp             {ProgNW $2 $4}

InputExp : CSV_File ';' InputExp             {InputNT $1 $3}
         | CSV_File ';'                      {InputT $1}

OutExp : OutArg ',' OutExp                   {OutputNT $1 $3}
       | OutArg                              {OutputT $1}

OutArg : InlineIf                            {OutArgIf $1}
       | string                              {OutArgKey $1}
       | '"' string '"'                      {OutArgConst $2}
       | nothing                             {OutArgNothing}

CSV_File : filename ':' Keys                 {File $1 $3}

Keys : string ',' Keys                       {KeysNT $1 $3}
     | string                                {KeysT $1}

WhereExp : where Conditions                  {TmWhere $2}

InlineIf : Conditions '?' string ':' string   {If $1 $3 $5}

Conditions : Condition                       {ConditionsT $1}
           | Conditions "&&" Conditions       {ConditionsAnd $1 $3}
           | Conditions "||" Conditions       {ConditionsOr $1 $3}

Condition : Operand ConditionOp Operand      {Condtn $1 $2 $3}

ConditionOp : "=="                           {Eq}
            | "!="                           {NEq}
            | '>'                            {Gt}
            | ">="                           {GEq}
            | '<'                            {Lt}
            | "<="                           {LEq}

Operand : string                             {OperandKey $1}
        | nothing                            {OperandNothing}
        | '"' string '"'                     {OperandConst $2}



--postamble

{
parseError :: [Token] -> a
parseError ts = error ("Parse Error, unparsed tokens: " ++ (show ts))


data Prog = ProgNW Input Output | ProgW Input Where Output
    deriving (Show, Eq)

data Input = InputNT CsvFile Input | InputT CsvFile
    deriving (Show, Eq)

data Output = OutputNT OutArg Output | OutputT OutArg
    deriving (Show, Eq)

data OutArg = OutArgIf InlineIf | OutArgKey Key | OutArgConst String | OutArgNothing
    deriving (Show, Eq)

data CsvFile = File Filename Keys
    deriving (Show, Eq)

type Filename = String

data Keys = KeysNT Key Keys | KeysT Key
    deriving (Show, Eq)

type Key = String
    
data Where = TmWhere Conditions
    deriving (Show, Eq)

data InlineIf = If Conditions Key Key
    deriving (Show, Eq)

data Conditions = ConditionsT Condition | ConditionsAnd Conditions Conditions | ConditionsOr Conditions Conditions
    deriving (Show, Eq)

data Condition = Condtn Operand ConditionOp Operand
    deriving (Show, Eq)

data Operand = OperandKey Key | OperandNothing | OperandConst String
    deriving (Show, Eq)

data ConditionOp = Eq | NEq | Gt | GEq | Lt | LEq
    deriving (Show, Eq)
}