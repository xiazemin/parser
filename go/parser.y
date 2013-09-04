%{

//TODO Put your favorite license here
		
// yacc source generated by ebnf2y[1]
// at 2013-09-03 22:13:22.622112165 +0200 CEST.
//
// CAUTION: If this file is a Go source file (*.go), it was generated
// automatically by '$ go tool yacc' from a *.y file - DO NOT EDIT in that case!
// 
//   [1]: http://github.com/cznic/ebnf2y

package parser

//TODO required only be the demo _dump function
import (
	"bytes"
	"fmt"
	"strings"

	"github.com/cznic/strutil"
)

%}

%union {
	val  interface{}
	pos  pos
	item interface{} //TODO insert real field(s)
}

%token	ADD_ASSIGN
%token	ANDAND
%token	ANDNOT
%token	AND_ASSIGN
%token	AND_NOT_ASSIGN
%token	CHANCOMM
%token	COMM
%token	COMMCHAN
%token	DDD
%token	DEC
%token	EQ
%token	FLOAT_LIT
%token	GE
%token	IDENTIFIER
%token	IDENTIFIER_LIST
%token	IDLIST_COLAS
%token	IMAGINARY_LIT
%token	INC
%token	INT_LIT
%token	LBR
%token	LE
%token	LSH
%token	MUL_ASSIGN
%token	NE
%token	OROR
%token	OR_ASSIGN
%token	QUO_ASSIGN
%token	REM_ASSIGN
%token	RSH
%token	RUNE_LIT
%token	SHL_ASSIGN
%token	SHR_ASSIGN
%token	STRING_LIT
%token	SUB_ASSIGN
%token	XOR_ASSIGN

%type	<item> 	/*TODO real type(s), if/where applicable */
	ADD_ASSIGN
	ANDAND
	ANDNOT
	AND_ASSIGN
	AND_NOT_ASSIGN
	CHANCOMM
	COMM
	COMMCHAN
	DDD
	DEC
	EQ
	GE
	IDLIST_COLAS
	INC
	LBR
	LE
	LSH
	MUL_ASSIGN
	NE
	OROR
	OR_ASSIGN
	QUO_ASSIGN
	REM_ASSIGN
	RSH
	SHL_ASSIGN
	SHR_ASSIGN
	SUB_ASSIGN
	XOR_ASSIGN

%type	<val>	FLOAT_LIT IDENTIFIER IDENTIFIER_LIST IMAGINARY_LIT INT_LIT 
		RUNE_LIT STRING_LIT

%token BREAK
%token CASE
%token CHAN
%token CONST
%token CONTINUE
%token DEFAULT
%token DEFER
%token ELSE
%token FALLTHROUGH
%token FOR
%token FUNC
%token GO
%token GOTO
%token IF
%token IMPORT
%token INTERFACE
%token MAP
%token PACKAGE
%token RANGE
%token RETURN
%token SELECT
%token STRUCT
%token SWITCH
%token TYPE
%token VAR

%type	<item> 	/*TODO real type(s), if/where applicable */
	ArgumentList2
	ArrayType
	Block
	Condition
	ConstDecl111
	ConstSpec
	Declaration
	Element
	ElementList1
	ElementType
	ExprSwitchStmt3
	Expression
	ExpressionList
	ExpressionList1
	FieldDecl
	FieldDecl1
	Function
	FunctionName
	IfStmt
	ImportDecl111
	ImportPath
	ImportSpec
	InitStmt
	InterfaceType11
	Label
	LiteralValue
	MapType
	MethodName
	MethodSpec
	Name
	PackageName
	ParameterDecl
	ParameterDecl2
	ParameterList1
	Parameters
	PostStmt
	PrimaryExpr
	Receiver
	RecvExpr
	SelectStmt1
	SendStmt
	Signature
	SimpleStmt
	Slice2
	SliceType
	SourceFile
	SourceFile1
	SourceFile2
	Start
	Statement
	StatementList
	StatementList1
	StructType
	StructType11
	Type
	TypeDecl111
	TypeList1
	TypeLit
	TypeLitNoPtr
	TypeSpec
	TypeSwitchGuard
	TypeSwitchStmt2
	UnaryExpr
	Value
	VarDecl111
	VarSpec

/*TODO %left, %right, ... declarations */

%left	OROR
%left	ANDAND
%left	'<' '>' EQ GE LE NE
%left	'+' '-' '^' '|'
%left	'%' '&' '*' '/' ANDNOT LSH RSH

%left	notDot	// Name
%left	'.'

%left	notLParen // Signature
%left	'('

%left	notPackage
%left	PACKAGE

%start Start

%%

ArgumentList2:
	/* EMPTY */
	{
		$$ = nil //TODO 1
	}
|	DDD
	{
		$$ = $1 //TODO 2
	}

ArrayType:
	'[' Expression ']' ElementType
	{
		$$ = []ArrayType{"[", $2, "]", $4} //TODO 3
	}

Block:
	'{' StatementList '}'
	{
		$$ = []Block{"⎨", $2, "⎬"} //TODO 4
	}

Condition:
	Expression
	{
		$$ = $1 //TODO 5
	}

ConstDecl111:
	/* EMPTY */
	{
		$$ = []ConstDecl111(nil) //TODO 6
	}
|	ConstDecl111 ';' ConstSpec
	{
		$$ = append($1.([]ConstDecl111), ";", $3) //TODO 7
	}

ConstSpec:
	IDENTIFIER_LIST
	{
		$$ = $1 //TODO 8
	}
|	IDENTIFIER_LIST '=' ExpressionList
	{
		$$ = []ConstSpec{$1, "=", $3} //TODO 9
	}
|	IDENTIFIER_LIST Type '=' ExpressionList
	{
		$$ = []ConstSpec{$1, $2, "=", $4} //TODO 10
	}

Declaration:
	CONST ConstSpec
	{
		$$ = []Declaration{"const", $2} //TODO 11
	}
|	CONST '(' ')'
	{
		$$ = []Declaration{"const", "(", ")"} //TODO 12
	}
|	CONST '(' ConstSpec ConstDecl111 ')'
	{
		$$ = []Declaration{"const", "(", $3, $4, ")"} //TODO 13
	}
|	TYPE TypeSpec
	{
		$$ = []Declaration{"type", $2} //TODO 14
	}
|	TYPE '(' ')'
	{
		$$ = []Declaration{"type", "(", ")"} //TODO 15
	}
|	TYPE '(' TypeSpec TypeDecl111 ')'
	{
		$$ = []Declaration{"type", "(", $3, $4, ")"} //TODO 16
	}
|	VAR VarSpec
	{
		$$ = []Declaration{"var", $2} //TODO 17
	}
|	VAR '(' ')'
	{
		$$ = []Declaration{"var", "(", ")"} //TODO 18
	}
|	VAR '(' VarSpec VarDecl111 ')'
	{
		$$ = []Declaration{"var", "(", $3, $4, ")"} //TODO 19
	}

Element:
	Value
	{
		$$ = $1 //TODO 20
	}
|	Expression ':' Value
	{
		$$ = []Element{$1, ":", $3} //TODO 21
	}

ElementList1:
	/* EMPTY */
	{
		$$ = []ElementList1(nil) //TODO 22
	}
|	ElementList1 ',' Element
	{
		$$ = append($1.([]ElementList1), ",", $3) //TODO 23
	}

ElementType:
	Type
	{
		$$ = $1 //TODO 24
	}

ExprSwitchStmt3:
	/* EMPTY */
	{
		$$ = []ExprSwitchStmt3(nil) //TODO 25
	}
|	ExprSwitchStmt3 CASE ExpressionList ':' StatementList
	{
		$$ = append($1.([]ExprSwitchStmt3), "case", $3, ":", $5) //TODO 26
	}
|	ExprSwitchStmt3 DEFAULT ':' StatementList
	{
		$$ = append($1.([]ExprSwitchStmt3), "default", ":", $4) //TODO 27
	}

Expression:
	UnaryExpr
	{
		$$ = $1 //TODO 28
	}
|	Expression OROR Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 29
	}
|	Expression ANDAND Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 30
	}
|	Expression EQ Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 31
	}
|	Expression NE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 32
	}
|	Expression '<' Expression
	{
		$$ = []Expression{$1, "<", $3} //TODO 33
	}
|	Expression LE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 34
	}
|	Expression '>' Expression
	{
		$$ = []Expression{$1, ">", $3} //TODO 35
	}
|	Expression GE Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 36
	}
|	Expression '+' Expression
	{
		$$ = []Expression{$1, "+", $3} //TODO 37
	}
|	Expression '-' Expression
	{
		$$ = []Expression{$1, "-", $3} //TODO 38
	}
|	Expression '|' Expression
	{
		$$ = []Expression{$1, "|", $3} //TODO 39
	}
|	Expression '^' Expression
	{
		$$ = []Expression{$1, "^", $3} //TODO 40
	}
|	Expression '*' Expression
	{
		$$ = []Expression{$1, "*", $3} //TODO 41
	}
|	Expression '/' Expression
	{
		$$ = []Expression{$1, "/", $3} //TODO 42
	}
|	Expression '%' Expression
	{
		$$ = []Expression{$1, "%", $3} //TODO 43
	}
|	Expression LSH Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 44
	}
|	Expression RSH Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 45
	}
|	Expression '&' Expression
	{
		$$ = []Expression{$1, "&", $3} //TODO 46
	}
|	Expression ANDNOT Expression
	{
		$$ = []Expression{$1, $2, $3} //TODO 47
	}

ExpressionList:
	Expression ExpressionList1
	{
		$$ = []ExpressionList{$1, $2} //TODO 48
	}

ExpressionList1:
	/* EMPTY */
	{
		$$ = []ExpressionList1(nil) //TODO 49
	}
|	ExpressionList1 ',' Expression
	{
		$$ = append($1.([]ExpressionList1), ",", $3) //TODO 50
	}

FieldDecl:
	FieldDecl1
	{
		$$ = $1 //TODO 51
	}
|	FieldDecl1 STRING_LIT
	{
		$$ = []FieldDecl{$1, $2} //TODO 52
	}

FieldDecl1:
	IDENTIFIER_LIST Type
	{
		$$ = []FieldDecl1{$1, $2} //TODO 53
	}
|	Name
	{
		$$ = $1 //TODO 54
	}
|	'*' Name
	{
		$$ = []FieldDecl1{"*", $2} //TODO 55
	}

Function:
	Signature Block
	{
		$$ = []Function{$1, $2} //TODO 56
	}

FunctionName:
	IDENTIFIER
	{
		$$ = $1 //TODO 57
	}

IfStmt:
	IF Expression LBR StatementList '}'
	{
		$$ = []IfStmt{"if", $2, $3, $4, "⎬"} //TODO 58
	}
|	IF SimpleStmt ';' Expression LBR StatementList '}'
	{
		$$ = []IfStmt{"if", $2, ";", $4, $5, $6, "⎬"} //TODO 59
	}
|	IF Expression LBR StatementList '}' ELSE IfStmt
	{
		$$ = []IfStmt{"if", $2, $3, $4, "⎬", "else", $7} //TODO 60
	}
|	IF SimpleStmt ';' Expression LBR StatementList '}' ELSE IfStmt
	{
		$$ = []IfStmt{"if", $2, ";", $4, $5, $6, "⎬", "else", $9} //TODO 61
	}
|	IF Expression LBR StatementList '}' ELSE Block
	{
		$$ = []IfStmt{"if", $2, $3, $4, "⎬", "else", $7} //TODO 62
	}
|	IF SimpleStmt ';' Expression LBR StatementList '}' ELSE Block
	{
		$$ = []IfStmt{"if", $2, ";", $4, $5, $6, "⎬", "else", $9} //TODO 63
	}

ImportDecl111:
	/* EMPTY */
	{
		$$ = []ImportDecl111(nil) //TODO 64
	}
|	ImportDecl111 ';' ImportSpec
	{
		$$ = append($1.([]ImportDecl111), ";", $3) //TODO 65
	}

ImportPath:
	STRING_LIT
	{
		$$ = $1 //TODO 66
	}

ImportSpec:
	ImportPath
	{
		$$ = $1 //TODO 67
	}
|	'.' ImportPath
	{
		$$ = []ImportSpec{".", $2} //TODO 68
	}
|	PackageName ImportPath
	{
		$$ = []ImportSpec{$1, $2} //TODO 69
	}

InitStmt:
	SimpleStmt
	{
		$$ = $1 //TODO 70
	}

InterfaceType11:
	/* EMPTY */
	{
		$$ = []InterfaceType11(nil) //TODO 71
	}
|	InterfaceType11 ';' MethodSpec
	{
		$$ = append($1.([]InterfaceType11), ";", $3) //TODO 72
	}

Label:
	IDENTIFIER
	{
		$$ = $1 //TODO 73
	}

LiteralValue:
	'{' '}'
	{
		$$ = []LiteralValue{"⎨", "⎬"} //TODO 74
	}
|	'{' Element ElementList1 '}'
	{
		$$ = []LiteralValue{"⎨", $2, $3, "⎬"} //TODO 75
	}

MapType:
	MAP '[' Type ']' ElementType
	{
		$$ = []MapType{"map", "[", $3, "]", $5} //TODO 76
	}

MethodName:
	IDENTIFIER
	{
		$$ = $1 //TODO 77
	}

MethodSpec:
	MethodName Signature
	{
		$$ = []MethodSpec{$1, $2} //TODO 78
	}
|	Name
	{
		$$ = $1 //TODO 79
	}

Name:
	IDENTIFIER %prec notDot
	{
		$$ = $1 //TODO 80
	}
|	IDENTIFIER '.' IDENTIFIER
	{
		$$ = []Name{$1, ".", $3} //TODO 81
	}

PackageName:
	IDENTIFIER
	{
		$$ = $1 //TODO 82
	}

ParameterDecl:
	ParameterDecl2 Type
	{
		$$ = []ParameterDecl{$1, "T:", $2} //TODO 83
	}
|	IDENTIFIER_LIST ParameterDecl2 Type
	{
		$$ = []ParameterDecl{$1, $2, "T:", $3} //TODO 84
	}

ParameterDecl2:
	/* EMPTY */
	{
		$$ = nil //TODO 85
	}
|	DDD
	{
		$$ = "..." //$1 //TODO 86
	}

ParameterList1:
	/* EMPTY */
	{
		$$ = []ParameterList1(nil) //TODO 87
	}
|	ParameterList1 ','
	{
		lx := yylex.(*lx)
		lx.toks, lx.ids, lx.state, lx.preamble = nil, nil, st11, 0 //TODO named state alias
	}
	ParameterDecl
	{
		$$ = append($1.([]ParameterList1), ",", $4) //TODO 88
	}

Parameters:
	'(' ')'
	{
		$$ = []Parameters{"(", ")"} //TODO 89
	}
|	'(' ParameterDecl ParameterList1 ')'
	{
		$$ = []Parameters{"(", $2, $3, ")"} //TODO 90
	}

PostStmt:
	SimpleStmt
	{
		$$ = $1 //TODO 91
	}

PrimaryExpr:
	INT_LIT
	{
		$$ = $1 //TODO 92
	}
|	FLOAT_LIT
	{
		$$ = $1 //TODO 93
	}
|	IMAGINARY_LIT
	{
		$$ = $1 //TODO 94
	}
|	RUNE_LIT
	{
		$$ = $1 //TODO 95
	}
|	STRING_LIT
	{
		$$ = $1 //TODO 96
	}
|	StructType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 97
	}
|	ArrayType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 98
	}
|	'[' DDD ']' ElementType LiteralValue
	{
		$$ = []PrimaryExpr{"[", $2, "]", $4, $5} //TODO 99
	}
|	SliceType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 100
	}
|	MapType LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 101
	}
|	Name LiteralValue
	{
		$$ = []PrimaryExpr{$1, $2} //TODO 102
	}
|	FUNC Function
	{
		$$ = []PrimaryExpr{"func", $2} //TODO 103
	}
|	Name
	{
		$$ = $1 //TODO 104
	}
|	'(' Expression ')'
	{
		$$ = []PrimaryExpr{"(", $2, ")"} //TODO 105
	}
|	TypeLitNoPtr '(' Expression ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, ")"} //TODO 106
	}
|	'(' TypeLitNoPtr ')' '(' Expression ')'
	{
		$$ = []PrimaryExpr{"(", $2, ")", "(", $5, ")"} //TODO 107
	}
|	'(' '*' TypeLitNoPtr ')' '(' Expression ')'
	{
		$$ = []PrimaryExpr{"(", "*", $3, ")", "(", $6, ")"} //TODO 108
	}
|	PrimaryExpr '.' IDENTIFIER
	{
		$$ = []PrimaryExpr{$1, ".", $3} //TODO 109
	}
|	PrimaryExpr '[' Expression ']'
	{
		$$ = []PrimaryExpr{$1, "[", $3, "]"} //TODO 110
	}
|	PrimaryExpr '[' ':' Slice2 ']'
	{
		$$ = []PrimaryExpr{$1, "[", ":", $4, "]"} //TODO 111
	}
|	PrimaryExpr '[' Expression ':' Slice2 ']'
	{
		$$ = []PrimaryExpr{$1, "[", $3, ":", $5, "]"} //TODO 112
	}
|	PrimaryExpr '.' '(' Type ')'
	{
		$$ = []PrimaryExpr{$1, ".", "(", $4, ")"} //TODO 113
	}
|	PrimaryExpr '(' ')'
	{
		$$ = []PrimaryExpr{$1, "(", ")"} //TODO 114
	}
|	PrimaryExpr '(' ExpressionList ArgumentList2 ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, $4, ")"} //TODO 115
	}
|	PrimaryExpr '(' TypeLitNoPtr ',' ExpressionList ArgumentList2 ')'
	{
		$$ = []PrimaryExpr{$1, "(", $3, ",", $5, $6, ")"} //TODO 116
	}
|	PrimaryExpr '(' '*' TypeLitNoPtr ',' ExpressionList ArgumentList2 ')'
	{
		$$ = []PrimaryExpr{$1, "(", "*", $4, ",", $6, $7, ")"} //TODO 117
	}

Receiver:
	'(' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, ")"} //TODO 118
	}
|	'(' IDENTIFIER IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, $3, ")"} //TODO 119
	}
|	'(' '*' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", "*", $3, ")"} //TODO 120
	}
|	'(' IDENTIFIER '*' IDENTIFIER ')'
	{
		$$ = []Receiver{"(", $2, "*", $4, ")"} //TODO 121
	}

RecvExpr:
	Expression
	{
		$$ = $1 //TODO 122
	}

SelectStmt1:
	/* EMPTY */
	{
		$$ = []SelectStmt1(nil) //TODO 123
	}
|	SelectStmt1 CASE SendStmt ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, ":", $5) //TODO 124
	}
|	SelectStmt1 CASE RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, ":", $5) //TODO 125
	}
|	SelectStmt1 CASE ExpressionList '=' RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, "=", $5, ":", $7) //TODO 126
	}
|	SelectStmt1 CASE IDLIST_COLAS RecvExpr ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "case", $3, $4, ":", $6) //TODO 127
	}
|	SelectStmt1 DEFAULT ':' StatementList
	{
		$$ = append($1.([]SelectStmt1), "default", ":", $4) //TODO 128
	}

SendStmt:
	Expression COMM Expression
	{
		$$ = []SendStmt{$1, $2, $3} //TODO 129
	}

Signature:
	Parameters %prec notLParen
	{
		$$ = $1 //TODO 130
	}
|	Parameters Parameters
	{
		$$ = []Signature{$1, $2} //TODO 131
	}
|	Parameters Name
	{
		$$ = []Signature{$1, $2} //TODO 132
	}
|	Parameters TypeLit
	{
		$$ = []Signature{$1, $2} //TODO 133
	}

SimpleStmt:
	/* EMPTY */
	{
		$$ = nil //TODO 134
	}
|	Expression
	{
		$$ = $1 //TODO 135
	}
|	SendStmt
	{
		$$ = $1 //TODO 136
	}
|	Expression INC
	{
		$$ = []SimpleStmt{$1, $2} //TODO 137
	}
|	Expression DEC
	{
		$$ = []SimpleStmt{$1, $2} //TODO 138
	}
|	ExpressionList '=' ExpressionList
	{
		$$ = []SimpleStmt{$1, "=", $3} //TODO 139
	}
|	ExpressionList ADD_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 140
	}
|	ExpressionList AND_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 141
	}
|	ExpressionList MUL_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 142
	}
|	ExpressionList OR_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 143
	}
|	ExpressionList QUO_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 144
	}
|	ExpressionList REM_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 145
	}
|	ExpressionList SHL_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 146
	}
|	ExpressionList SHR_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 147
	}
|	ExpressionList SUB_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 148
	}
|	ExpressionList XOR_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 149
	}
|	ExpressionList AND_NOT_ASSIGN ExpressionList
	{
		$$ = []SimpleStmt{$1, $2, $3} //TODO 150
	}
|	IDLIST_COLAS ExpressionList
	{
		$$ = []SimpleStmt{$1, $2} //TODO 151
	}

Slice2:
	/* EMPTY */
	{
		$$ = nil //TODO 152
	}
|	Expression
	{
		$$ = $1 //TODO 153
	}

SliceType:
	'[' ']' ElementType
	{
		$$ = []SliceType{"[", "]", $3} //TODO 154
	}

SourceFile:
	%prec notPackage
	{
		yylex.(*lx).error("package statement must be first")
		goto ret1
	}
|	PACKAGE PackageName ';' SourceFile1 SourceFile2
	{
		$$ = []SourceFile{"package", $2, ";", $4, $5} //TODO 155
	}

SourceFile1:
	/* EMPTY */
	{
		$$ = []SourceFile1(nil) //TODO 156
	}
|	SourceFile1 IMPORT ImportSpec ';'
	{
		$$ = append($1.([]SourceFile1), "import", $3, ";") //TODO 157
	}
|	SourceFile1 IMPORT '(' ')' ';'
	{
		$$ = append($1.([]SourceFile1), "import", "(", ")", ";") //TODO 158
	}
|	SourceFile1 IMPORT '(' ImportSpec ImportDecl111 ')' ';'
	{
		$$ = append($1.([]SourceFile1), "import", "(", $4, $5, ")", ";") //TODO 159
	}

SourceFile2:
	/* EMPTY */
	{
		$$ = []SourceFile2(nil) //TODO 160
	}
|	SourceFile2 Declaration ';'
	{
		$$ = append($1.([]SourceFile2), $2, ";") //TODO 161
	}
|	SourceFile2 FUNC FunctionName Function ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, ";") //TODO 162
	}
|	SourceFile2 FUNC FunctionName Signature ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, ";") //TODO 163
	}
|	SourceFile2 FUNC Receiver MethodName Function ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, $5, ";") //TODO 164
	}
|	SourceFile2 FUNC Receiver MethodName Signature ';'
	{
		$$ = append($1.([]SourceFile2), "func", $3, $4, $5, ";") //TODO 165
	}

Start:
	SourceFile
	{
		_parserResult = $1 //TODO 166
	}

Statement:
	Declaration
	{
		$$ = $1 //TODO 167
	}
|	Label ':' Statement
	{
		$$ = []Statement{$1, ":", $3} //TODO 168
	}
|	SimpleStmt
	{
		$$ = $1 //TODO 169
	}
|	GO Expression
	{
		$$ = []Statement{"go", $2} //TODO 170
	}
|	RETURN
	{
		$$ = "return" //TODO 171
	}
|	RETURN ExpressionList
	{
		$$ = []Statement{"return", $2} //TODO 172
	}
|	BREAK
	{
		$$ = "break" //TODO 173
	}
|	BREAK Label
	{
		$$ = []Statement{"break", $2} //TODO 174
	}
|	CONTINUE
	{
		$$ = "continue" //TODO 175
	}
|	CONTINUE Label
	{
		$$ = []Statement{"continue", $2} //TODO 176
	}
|	GOTO Label
	{
		$$ = []Statement{"goto", $2} //TODO 177
	}
|	FALLTHROUGH
	{
		$$ = "fallthrough" //TODO 178
	}
|	Block
	{
		$$ = $1 //TODO 179
	}
|	IfStmt
	{
		$$ = $1 //TODO 180
	}
|	SWITCH LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, $3, "⎬"} //TODO 181
	}
|	SWITCH SimpleStmt ';' LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, $5, "⎬"} //TODO 182
	}
|	SWITCH Expression LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, $3, $4, "⎬"} //TODO 183
	}
|	SWITCH SimpleStmt ';' Expression LBR ExprSwitchStmt3 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, $5, $6, "⎬"} //TODO 184
	}
|	SWITCH TypeSwitchGuard '{' TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, "⎨", $4, "⎬"} //TODO 185
	}
|	SWITCH SimpleStmt ';' TypeSwitchGuard '{' TypeSwitchStmt2 '}'
	{
		$$ = []Statement{"switch", $2, ";", $4, "⎨", $6, "⎬"} //TODO 186
	}
|	SELECT '{' SelectStmt1 '}'
	{
		$$ = []Statement{"select", "⎨", $3, "⎬"} //TODO 187
	}
|	FOR LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, $3, "⎬"} //TODO 188
	}
|	FOR Condition LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, $3, $4, "⎬"} //TODO 189
	}
|	FOR InitStmt ';' ';' PostStmt LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, ";", ";", $5, $6, $7, "⎬"} //TODO 190
	}
|	FOR InitStmt ';' Condition ';' PostStmt LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, ";", $4, ";", $6, $7, $8, "⎬"} //TODO 191
	}
|	FOR ExpressionList '=' RANGE Expression LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, "=", "range", $5, $6, $7, "⎬"} //TODO 192
	}
|	FOR IDLIST_COLAS RANGE Expression LBR StatementList '}'
	{
		$$ = []Statement{"for", $2, "range", $4, $5, $6, "⎬"} //TODO 193
	}
|	DEFER Expression
	{
		$$ = []Statement{"defer", $2} //TODO 194
	}

StatementList:
	Statement StatementList1
	{
		$$ = []StatementList{$1, $2} //TODO 195
	}

StatementList1:
	/* EMPTY */
	{
		$$ = []StatementList1(nil) //TODO 196
	}
|	StatementList1 ';' Statement
	{
		$$ = append($1.([]StatementList1), ";", $3) //TODO 197
	}

StructType:
	STRUCT '{' '}'
	{
		$$ = []StructType{"struct", "⎨", "⎬"} //TODO 198
	}
|	STRUCT '{' FieldDecl StructType11 '}'
	{
		$$ = []StructType{"struct", "⎨", $3, $4, "⎬"} //TODO 199
	}

StructType11:
	/* EMPTY */
	{
		$$ = []StructType11(nil) //TODO 200
	}
|	StructType11 ';' FieldDecl
	{
		$$ = append($1.([]StructType11), ";", $3) //TODO 201
	}

Type:
	Name
	{
		$$ = $1 //TODO 202
	}
|	TypeLit
	{
		$$ = $1 //TODO 203
	}
|	'(' Type ')'
	{
		$$ = []Type{"(", $2, ")"} //TODO 204
	}

TypeDecl111:
	/* EMPTY */
	{
		$$ = []TypeDecl111(nil) //TODO 205
	}
|	TypeDecl111 ';' TypeSpec
	{
		$$ = append($1.([]TypeDecl111), ";", $3) //TODO 206
	}

TypeList1:
	/* EMPTY */
	{
		$$ = []TypeList1(nil) //TODO 207
	}
|	TypeList1 ',' Type
	{
		$$ = append($1.([]TypeList1), ",", $3) //TODO 208
	}

TypeLit:
	TypeLitNoPtr
	{
		$$ = $1 //TODO 209
	}
|	'*' Type
	{
		$$ = []TypeLit{"*", $2} //TODO 210
	}

TypeLitNoPtr:
	ArrayType
	{
		$$ = $1 //TODO 211
	}
|	StructType
	{
		$$ = $1 //TODO 212
	}
|	FUNC Signature
	{
		$$ = []TypeLitNoPtr{"func", $2} //TODO 213
	}
|	INTERFACE '{' '}'
	{
		$$ = []TypeLitNoPtr{"interface", "⎨", "⎬"} //TODO 214
	}
|	INTERFACE '{' MethodSpec InterfaceType11 '}'
	{
		$$ = []TypeLitNoPtr{"interface", "⎨", $3, $4, "⎬"} //TODO 215
	}
|	SliceType
	{
		$$ = $1 //TODO 216
	}
|	MapType
	{
		$$ = $1 //TODO 217
	}
|	CHAN ElementType
	{
		$$ = []TypeLitNoPtr{"chan", $2} //TODO 218
	}
|	CHANCOMM ElementType
	{
		$$ = []TypeLitNoPtr{$1, $2} //TODO 219
	}
|	COMMCHAN ElementType
	{
		$$ = []TypeLitNoPtr{$1, $2} //TODO 220
	}

TypeSpec:
	IDENTIFIER Type
	{
		$$ = []TypeSpec{$1, $2} //TODO 221
	}

TypeSwitchGuard:
	PrimaryExpr '.' '(' TYPE ')'
	{
		$$ = []TypeSwitchGuard{$1, ".", "(", "type", ")"} //TODO 222
	}
|	IDLIST_COLAS PrimaryExpr '.' '(' TYPE ')'
	{
		$$ = []TypeSwitchGuard{$1, $2, ".", "(", "type", ")"} //TODO 223
	}

TypeSwitchStmt2:
	/* EMPTY */
	{
		$$ = []TypeSwitchStmt2(nil) //TODO 224
	}
|	TypeSwitchStmt2 CASE Type TypeList1 ':' StatementList
	{
		$$ = append($1.([]TypeSwitchStmt2), "case", $3, $4, ":", $6) //TODO 225
	}
|	TypeSwitchStmt2 DEFAULT ':' StatementList
	{
		$$ = append($1.([]TypeSwitchStmt2), "default", ":", $4) //TODO 226
	}

UnaryExpr:
	PrimaryExpr
	{
		$$ = $1 //TODO 227
	}
|	'+' UnaryExpr
	{
		$$ = []UnaryExpr{"+", $2} //TODO 228
	}
|	'-' UnaryExpr
	{
		$$ = []UnaryExpr{"-", $2} //TODO 229
	}
|	'!' UnaryExpr
	{
		$$ = []UnaryExpr{"!", $2} //TODO 230
	}
|	'^' UnaryExpr
	{
		$$ = []UnaryExpr{"^", $2} //TODO 231
	}
|	'*' UnaryExpr
	{
		$$ = []UnaryExpr{"*", $2} //TODO 232
	}
|	'&' UnaryExpr
	{
		$$ = []UnaryExpr{"&", $2} //TODO 233
	}
|	COMM UnaryExpr
	{
		$$ = []UnaryExpr{$1, $2} //TODO 234
	}

Value:
	Expression
	{
		$$ = $1 //TODO 235
	}
|	LiteralValue
	{
		$$ = $1 //TODO 236
	}

VarDecl111:
	/* EMPTY */
	{
		$$ = []VarDecl111(nil) //TODO 237
	}
|	VarDecl111 ';'
	{
		lx := yylex.(*lx)
		lx.preamble, lx.toks, lx.ids, lx.state = 0, nil, nil, st3 //TODO named state alias
	}
	VarSpec
	{
		$$ = append($1.([]VarDecl111), ";", $4) //TODO 238
	}

VarSpec:
	IDENTIFIER_LIST Type
	{
		$$ = []VarSpec{$1, $2} //TODO 239
	}
|	IDENTIFIER_LIST Type '=' ExpressionList
	{
		$$ = []VarSpec{$1, $2, "=", $4} //TODO 240
	}
|	IDENTIFIER_LIST '=' ExpressionList
	{
		$$ = []VarSpec{$1, "=", $3} //TODO 241
	}

%%

//TODO remove demo stuff below

var _parserResult interface{}

type (
	ArgumentList2 interface{}
	ArrayType interface{}
	Block interface{}
	Condition interface{}
	ConstDecl111 interface{}
	ConstSpec interface{}
	Declaration interface{}
	Element interface{}
	ElementList1 interface{}
	ElementType interface{}
	ExprSwitchStmt3 interface{}
	Expression interface{}
	ExpressionList interface{}
	ExpressionList1 interface{}
	FieldDecl interface{}
	FieldDecl1 interface{}
	Function interface{}
	FunctionName interface{}
	IfStmt interface{}
	ImportDecl111 interface{}
	ImportPath interface{}
	ImportSpec interface{}
	InitStmt interface{}
	InterfaceType11 interface{}
	Label interface{}
	LiteralValue interface{}
	MapType interface{}
	MethodName interface{}
	MethodSpec interface{}
	Name interface{}
	PackageName interface{}
	ParameterDecl interface{}
	ParameterDecl2 interface{}
	ParameterList1 interface{}
	Parameters interface{}
	PostStmt interface{}
	PrimaryExpr interface{}
	Receiver interface{}
	RecvExpr interface{}
	SelectStmt1 interface{}
	SendStmt interface{}
	Signature interface{}
	SimpleStmt interface{}
	Slice2 interface{}
	SliceType interface{}
	SourceFile interface{}
	SourceFile1 interface{}
	SourceFile2 interface{}
	Start interface{}
	Statement interface{}
	StatementList interface{}
	StatementList1 interface{}
	StructType interface{}
	StructType11 interface{}
	Type interface{}
	TypeDecl111 interface{}
	TypeList1 interface{}
	TypeLit interface{}
	TypeLitNoPtr interface{}
	TypeSpec interface{}
	TypeSwitchGuard interface{}
	TypeSwitchStmt2 interface{}
	UnaryExpr interface{}
	Value interface{}
	VarDecl111 interface{}
	VarSpec interface{}
)
	
func _dump() string {
	s := fmt.Sprintf("%#v", _parserResult)
	s = strings.Replace(s, "%", "%%", -1)
	s = strings.Replace(s, "{", "{%i\n", -1)
	s = strings.Replace(s, "}", "%u\n}", -1)
	s = strings.Replace(s, ", ", ",\n", -1)
	var buf bytes.Buffer
	strutil.IndentFormatter(&buf, "| ").Format(s)
	buf.WriteString("\n")
	a := strings.Split(buf.String(), "\n")
	var r bytes.Buffer
	for _, v := range a {
		if strings.HasSuffix(v, "(nil)") || strings.HasSuffix(v, "(nil),") {
			continue
		}

		fmt.Fprintln(&r, v)
	}
	return r.String()
}

// End of demo stuff
