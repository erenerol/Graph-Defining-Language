
%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
    int yylineno;
    #define YYDEBUG 0
    %}


%token GRAPH DIRECTEDGRAPH UNDIRECTEDGRAPH VERTEX EDGE QUERY QUERYINGFOREQUAL QUERYSTART INCLUDE STARTWITH ENDWITH SUBSTRING PREDICATE EDGESTART EDGEFINISH PLUS MINUS DIV STAR DOT COMMA NOT QUESTION OR
%token MAP LIST SET LESSTHAN LESSTHANEQUAL GREATERTHAN GREATERTHANEQUAL LEFTPARAM RIGHTPARAM LEFTBRACKET RIGHTBRACKET LEFTBRACE RIGHTBRACE INT
%token ASSIGN ID ASSOCIATE
%token FLOAT STRING
%token DIRECTEDLINE UNDIRECTEDLINE
%left STAR PLUS

%%

program: start;

start: q_start
    |q_def
    |var_def
    |
;

//q_start:
//	ID QUERYSTART ID(l_
// | symbol q_body)*
//	| ID QUERYSTART q_body (l_symbol | symbol q_body)*
//	;
q_start:
ID QUERYSTART ID q_start_tail
| ID QUERYSTART q_body q_start_tail

q_start_tail:
l_symbol q_body q_start_tail
|symbol ID q_start_tail
|symbol q_body q_start_tail
|l_symbol {yyerror("Missing second id.");}
|
;


q_def:
QUERY ID ASSIGN q_body
| QUERY ID {yyerror("Missing ASSIGN SYMBOL.");}
| ID ASSIGN q_body {yyerror("Missing QUERY TYPE.");}
| QUERY ASSIGN q_body {yyerror("Missing ASSIGNED VERIABLE.");}


;


//q_body:
//	(q_vertex (q_edge q_vertex?)* q_edge?)
//	|(ID (symbol ID |l_symbol)*)
//	;

q_body:
q_vertex q_body_extension q_edge
| q_vertex q_body_extension
| ID q_body_second_extension
;
q_body_extension:
q_edge q_vertex q_body_extension
|q_edge q_body_extension
|
;
q_body_second_extension:
symbol ID q_body_second_extension
| l_symbol q_body_second_extension
|
;

q_edge: EDGESTART predicate qe_body EDGEFINISH
|EDGESTART predicate qe_body  {yyerror("Missing EDGE FINISH SYMBOL.");}
|
;
qe_body: var s_type var
|
;
predicate: PREDICATE
|
;
q_vertex: LEFTBRACKET predicate qv_body RIGHTBRACKET
;
qv_body: var s_type var
|
;
symbol: q_body
| ID
| OR
;
l_symbol: PLUS
| STAR
;
var: ID var_tail
| INT var_tail
| u_var var_tail
;
u_var: QUESTION ID
;
var_tail: PLUS ID
|
;
s_type: QUERYINGFOREQUAL
| LESSTHAN
| LESSTHANEQUAL
|GREATERTHAN
| GREATERTHANEQUAL
| STARTWITH
| ENDWITH
| INCLUDE
| substr
;
substr: SUBSTRING LEFTPARAM distance RIGHTPARAM
;
distance: INT
| ASSOCIATE INT
| INT ASSOCIATE
| INT ASSOCIATE INT
;
//
var_def:
ID ASSIGN var_type op
;
var_type:
ID
| INT
| FLOAT
;
op:
PLUS var_type op
| MINUS var_type op
| STAR var_type op
| DIV var_type op
| DIV {yyerror("Missing ID after div.");}
| STAR {yyerror("Missing ID after mult.");}
| MINUS {yyerror("Missing ID after minus.");}
|
;
//
%%

void yyerror(char *s){
    fprintf(stderr, "%d: Near line %d = %s\n", yynerrs, yylineno, s);
}

int main(void){
    #if YYDEBUG
    yydebug = 1;
    #endif
    
    yyparse();
    
    if(yynerrs < 1){
        printf("Parsing is successful\n");
    }
    return 0;
}