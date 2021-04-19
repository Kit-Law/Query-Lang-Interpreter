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
  key      {TokenKey $$}
  '?'      {TokenQMark}
  ':'      {TokenHasColumns}
  ';'      {TokenTerminator}
  ','      {TokenKeySep}
  "=="     {TokenEq}
  "!="     {TokenNEq}



--associations

%nonassoc input out where
%left ';'
%left nothing filename key
%left '?'
%left "==" "!="
%left ':' ','
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

OutExp : OutExp ',' OutExp                   {OutputNT $1 $3}
       | InlineIf                            {OutputTIf $1}
       | key                                 {OutputTKey $1}

CSV_File : filename ':' Keys                 {File $1 $3}

Keys : key ',' Keys                          {KeysNT $1 $3}
     | key                                   {KeysT $1}

WhereExp : where Condition                   {TmWhere $2}

InlineIf : Condition '?' key ':' key         {If $1 $3 $5}

Condition : Operand ConditionOp Operand      {Condtn $1 $2 $3}

ConditionOp : "=="                           {Eq}
            | "!="                           {NEq}

Operand : key                                {OperandKey $1}
        | nothing                            {OperandNothing Null}



--postamble

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"


data Prog = ProgNW Input Output | ProgW Input Where Output
    deriving (Show, Eq)

data Input = InputNT CsvFile Input | InputT CsvFile
    deriving (Show, Eq)

data Output = OutputNT Output Output | OutputTIf InlineIf | OutputTKey Key
    deriving (Show, Eq)

data CsvFile = File Filename Keys
    deriving (Show, Eq)

type Filename = String

data Keys = KeysNT Key Keys | KeysT Key
    deriving (Show, Eq)

type Key = String
    
data Where = TmWhere Condition
    deriving (Show, Eq)

data InlineIf = If Condition Key Key
    deriving (Show, Eq)

data Condition = Condtn Operand ConditionOp Operand
    deriving (Show, Eq)

data Operand = OperandKey Key | OperandNothing Nothing
    deriving (Show, Eq)

data ConditionOp = Eq | NEq
    deriving (Show, Eq)

data Nothing = Null
    deriving (Show, Eq)
}