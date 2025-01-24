ê
pC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\WeatherForecast.cs
	namespace 	#
EvaluacionReservasHotel
 !
{ 
public 

class 
WeatherForecast  
{ 
public 
DateOnly 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ô
hC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
	DotNetEnv 	
.	 

Env
 
. 
Load 
( 
) 
; 
var

 
configuration

 
=

 
builder

 
.

 
Configuration

 )
;

) *
var 
connectionString 
= 
configuration $
.$ %
GetConnectionString% 8
(8 9
$str9 L
)L M
;M N
var 

dbPassword 
= 
Environment 
. "
GetEnvironmentVariable 3
(3 4
$str4 A
)A B
??C E
stringF L
.L M
EmptyM R
;R S
var 
dbUser 

= 
Environment 
. "
GetEnvironmentVariable /
(/ 0
$str0 9
)9 :
??; =
$str> B
;B C
var 
dbServer 
= 
Environment 
. "
GetEnvironmentVariable 1
(1 2
$str2 =
)= >
??? A
$strB M
;M N
var 

dbDatabase 
= 
Environment 
. "
GetEnvironmentVariable 3
(3 4
$str4 A
)A B
??C E
$strF Q
;Q R
connectionString 
= 
$" 
$str 
{ 
dbServer %
}% &
$str& 0
{0 1

dbDatabase1 ;
}; <
$str< E
{E F
dbUserF L
}L M
$strM W
{W X

dbPasswordX b
}b c
$str	c ù
"
ù û
;
û ü
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddDbContext 
< 
AppDBContext *
>* +
(+ ,
options, 3
=>4 6
options 
. 
UseSqlServer 
( 
connectionString )
)) *
)* +
;+ ,
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
}   
app"" 
."" 
UseHttpsRedirection"" 
("" 
)"" 
;"" 
app$$ 
.$$ 
UseAuthorization$$ 
($$ 
)$$ 
;$$ 
app&& 
.&& 
MapControllers&& 
(&& 
)&& 
;&& 
await(( 
app(( 	
.((	 

RunAsync((
 
((( 
)(( 
;(( ñb
àC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Migrations\20250123170111_InitialCreate.cs
	namespace 	#
EvaluacionReservasHotel
 !
.! "

Migrations" ,
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str $
,$ %
columns 
: 
table 
=> !
new" %
{ 
ConsultorioId !
=" #
table$ )
.) *
Column* 0
<0 1
int1 4
>4 5
(5 6
type6 :
:: ;
$str< A
,A B
nullableC K
:K L
falseM R
)R S
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Numero 
= 
table "
." #
Column# )
<) *
string* 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z
Piso 
= 
table  
.  !
Column! '
<' (
int( +
>+ ,
(, -
type- 1
:1 2
$str3 8
,8 9
nullable: B
:B C
falseD I
)I J
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
ConsultorioId? L
)L M
;M N
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
,  
columns 
: 
table 
=> !
new" %
{ 
MedicoId   
=   
table   $
.  $ %
Column  % +
<  + ,
int  , /
>  / 0
(  0 1
type  1 5
:  5 6
$str  7 <
,  < =
nullable  > F
:  F G
false  H M
)  M N
.!! 

Annotation!! #
(!!# $
$str!!$ 8
,!!8 9
$str!!: @
)!!@ A
,!!A B
Nombre"" 
="" 
table"" "
.""" #
Column""# )
<"") *
string""* 0
>""0 1
(""1 2
type""2 6
:""6 7
$str""8 G
,""G H
nullable""I Q
:""Q R
false""S X
)""X Y
,""Y Z
Apellido## 
=## 
table## $
.##$ %
Column##% +
<##+ ,
string##, 2
>##2 3
(##3 4
type##4 8
:##8 9
$str##: I
,##I J
nullable##K S
:##S T
false##U Z
)##Z [
,##[ \
Especialidad$$  
=$$! "
table$$# (
.$$( )
Column$$) /
<$$/ 0
string$$0 6
>$$6 7
($$7 8
type$$8 <
:$$< =
$str$$> M
,$$M N
nullable$$O W
:$$W X
false$$Y ^
)$$^ _
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% 1
,((1 2
x((3 4
=>((5 7
x((8 9
.((9 :
MedicoId((: B
)((B C
;((C D
})) 
))) 
;)) 
migrationBuilder++ 
.++ 
CreateTable++ (
(++( )
name,, 
:,, 
$str,, !
,,,! "
columns-- 
:-- 
table-- 
=>-- !
new--" %
{.. 

PacienteId// 
=//  
table//! &
.//& '
Column//' -
<//- .
int//. 1
>//1 2
(//2 3
type//3 7
://7 8
$str//9 >
,//> ?
nullable//@ H
://H I
false//J O
)//O P
.00 

Annotation00 #
(00# $
$str00$ 8
,008 9
$str00: @
)00@ A
,00A B
Nombre11 
=11 
table11 "
.11" #
Column11# )
<11) *
string11* 0
>110 1
(111 2
type112 6
:116 7
$str118 G
,11G H
nullable11I Q
:11Q R
false11S X
)11X Y
,11Y Z
Apellido22 
=22 
table22 $
.22$ %
Column22% +
<22+ ,
string22, 2
>222 3
(223 4
type224 8
:228 9
$str22: I
,22I J
nullable22K S
:22S T
false22U Z
)22Z [
,22[ \
FechaNacimiento33 #
=33$ %
table33& +
.33+ ,
Column33, 2
<332 3
DateTime333 ;
>33; <
(33< =
type33= A
:33A B
$str33C N
,33N O
nullable33P X
:33X Y
false33Z _
)33_ `
,33` a
Email44 
=44 
table44 !
.44! "
Column44" (
<44( )
string44) /
>44/ 0
(440 1
type441 5
:445 6
$str447 F
,44F G
nullable44H P
:44P Q
false44R W
)44W X
}55 
,55 
constraints66 
:66 
table66 "
=>66# %
{77 
table88 
.88 

PrimaryKey88 $
(88$ %
$str88% 3
,883 4
x885 6
=>887 9
x88: ;
.88; <

PacienteId88< F
)88F G
;88G H
}99 
)99 
;99 
migrationBuilder;; 
.;; 
CreateTable;; (
(;;( )
name<< 
:<< 
$str<< 
,<< 
columns== 
:== 
table== 
=>== !
new==" %
{>> 
CitaId?? 
=?? 
table?? "
.??" #
Column??# )
<??) *
int??* -
>??- .
(??. /
type??/ 3
:??3 4
$str??5 :
,??: ;
nullable??< D
:??D E
false??F K
)??K L
.@@ 

Annotation@@ #
(@@# $
$str@@$ 8
,@@8 9
$str@@: @
)@@@ A
,@@A B

PacienteIdAA 
=AA  
tableAA! &
.AA& '
ColumnAA' -
<AA- .
intAA. 1
>AA1 2
(AA2 3
typeAA3 7
:AA7 8
$strAA9 >
,AA> ?
nullableAA@ H
:AAH I
falseAAJ O
)AAO P
,AAP Q
MedicoIdBB 
=BB 
tableBB $
.BB$ %
ColumnBB% +
<BB+ ,
intBB, /
>BB/ 0
(BB0 1
typeBB1 5
:BB5 6
$strBB7 <
,BB< =
nullableBB> F
:BBF G
falseBBH M
)BBM N
,BBN O
ConsultorioIdCC !
=CC" #
tableCC$ )
.CC) *
ColumnCC* 0
<CC0 1
intCC1 4
>CC4 5
(CC5 6
typeCC6 :
:CC: ;
$strCC< A
,CCA B
nullableCCC K
:CCK L
falseCCM R
)CCR S
,CCS T
FechaDD 
=DD 
tableDD !
.DD! "
ColumnDD" (
<DD( )
DateTimeDD) 1
>DD1 2
(DD2 3
typeDD3 7
:DD7 8
$strDD9 D
,DDD E
nullableDDF N
:DDN O
falseDDP U
)DDU V
,DDV W
HoraEE 
=EE 
tableEE  
.EE  !
ColumnEE! '
<EE' (
TimeSpanEE( 0
>EE0 1
(EE1 2
typeEE2 6
:EE6 7
$strEE8 >
,EE> ?
nullableEE@ H
:EEH I
falseEEJ O
)EEO P
}FF 
,FF 
constraintsGG 
:GG 
tableGG "
=>GG# %
{HH 
tableII 
.II 

PrimaryKeyII $
(II$ %
$strII% /
,II/ 0
xII1 2
=>II3 5
xII6 7
.II7 8
CitaIdII8 >
)II> ?
;II? @
tableJJ 
.JJ 

ForeignKeyJJ $
(JJ$ %
nameKK 
:KK 
$strKK C
,KKC D
columnLL 
:LL 
xLL  !
=>LL" $
xLL% &
.LL& '
ConsultorioIdLL' 4
,LL4 5
principalTableMM &
:MM& '
$strMM( 6
,MM6 7
principalColumnNN '
:NN' (
$strNN) 8
,NN8 9
onDeleteOO  
:OO  !
ReferentialActionOO" 3
.OO3 4
CascadeOO4 ;
)OO; <
;OO< =
tablePP 
.PP 

ForeignKeyPP $
(PP$ %
nameQQ 
:QQ 
$strQQ 9
,QQ9 :
columnRR 
:RR 
xRR  !
=>RR" $
xRR% &
.RR& '
MedicoIdRR' /
,RR/ 0
principalTableSS &
:SS& '
$strSS( 1
,SS1 2
principalColumnTT '
:TT' (
$strTT) 3
,TT3 4
onDeleteUU  
:UU  !
ReferentialActionUU" 3
.UU3 4
CascadeUU4 ;
)UU; <
;UU< =
tableVV 
.VV 

ForeignKeyVV $
(VV$ %
nameWW 
:WW 
$strWW =
,WW= >
columnXX 
:XX 
xXX  !
=>XX" $
xXX% &
.XX& '

PacienteIdXX' 1
,XX1 2
principalTableYY &
:YY& '
$strYY( 3
,YY3 4
principalColumnZZ '
:ZZ' (
$strZZ) 5
,ZZ5 6
onDelete[[  
:[[  !
ReferentialAction[[" 3
.[[3 4
Cascade[[4 ;
)[[; <
;[[< =
}\\ 
)\\ 
;\\ 
migrationBuilder^^ 
.^^ 
CreateIndex^^ (
(^^( )
name__ 
:__ 
$str__ .
,__. /
table`` 
:`` 
$str`` 
,`` 
columnaa 
:aa 
$straa '
)aa' (
;aa( )
migrationBuildercc 
.cc 
CreateIndexcc (
(cc( )
namedd 
:dd 
$strdd )
,dd) *
tableee 
:ee 
$stree 
,ee 
columnff 
:ff 
$strff "
)ff" #
;ff# $
migrationBuilderhh 
.hh 
CreateIndexhh (
(hh( )
nameii 
:ii 
$strii +
,ii+ ,
tablejj 
:jj 
$strjj 
,jj 
columnkk 
:kk 
$strkk $
)kk$ %
;kk% &
}ll 	
	protectedoo 
overrideoo 
voidoo 
Downoo  $
(oo$ %
MigrationBuilderoo% 5
migrationBuilderoo6 F
)ooF G
{pp 	
migrationBuilderqq 
.qq 
	DropTableqq &
(qq& '
namerr 
:rr 
$strrr 
)rr 
;rr 
migrationBuildertt 
.tt 
	DropTablett &
(tt& '
nameuu 
:uu 
$struu $
)uu$ %
;uu% &
migrationBuilderww 
.ww 
	DropTableww &
(ww& '
namexx 
:xx 
$strxx 
)xx  
;xx  !
migrationBuilderzz 
.zz 
	DropTablezz &
(zz& '
name{{ 
:{{ 
$str{{ !
){{! "
;{{" #
}|| 	
}}} 
}~~ ‰8
ÄC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Controllers\PacientesController.cs
	namespace 	#
EvaluacionReservasHotel
 !
.! "
Controllers" -
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
PacientesController

 $
:

% &
ControllerBase

' 5
{ 
private 
readonly 
AppDBContext %
_appDbcontext& 3
;3 4
public 
PacientesController "
(" #
AppDBContext# /
appDBContext0 <
)< =
{ 	
_appDbcontext 
= 
appDBContext (
;( )
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetPacientes) 5
(5 6
)6 7
{ 	
var 
	pacientes 
= 
await !
_appDbcontext" /
./ 0
	Pacientes0 9
.9 :
ToListAsync: E
(E F
)F G
;G H
return 
Ok 
( 
	pacientes 
)  
;  !
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetPaciente) 4
(4 5
int5 8
id9 ;
); <
{ 	
var 
paciente 
= 
await  
_appDbcontext! .
.. /
	Pacientes/ 8
.8 9
	FindAsync9 B
(B C
idC E
)E F
;F G
if   
(   
paciente   
==   
null    
)    !
{!! 
return"" 
NotFound"" 
(""  
$str""  n
)""n o
;""o p
}## 
return$$ 
Ok$$ 
($$ 
paciente$$ 
)$$ 
;$$  
}%% 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
CreatePaciente))) 7
())7 8
Paciente))8 @
paciente))A I
)))I J
{** 	
bool,, 
existePaciente,, 
=,,  !
await,," '
_appDbcontext,,( 5
.,,5 6
	Pacientes,,6 ?
.-- 
AnyAsync-- 
(-- 
p-- 
=>-- 
p--  
.--  !
Email--! &
==--' )
paciente--* 2
.--2 3
Email--3 8
)--8 9
;--9 :
if// 
(// 
existePaciente// 
)// 
{00 
return11 
Conflict11 
(11  
$str11  ]
)11] ^
;11^ _
}22 
_appDbcontext55 
.55 
	Pacientes55 #
.55# $
Add55$ '
(55' (
paciente55( 0
)550 1
;551 2
await66 
_appDbcontext66 
.66  
SaveChangesAsync66  0
(660 1
)661 2
;662 3
return88 
Ok88 
(88 
new88 
{99 
paciente:: 
,:: 
mensaje;; 
=;; 
$str;; 9
}<< 
)<< 
;<< 
}== 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (
EditPacienteAA) 5
(AA5 6
intAA6 9
idAA: <
,AA< =
PacienteAA> F
pacienteAAG O
)AAO P
{BB 	
ifCC 
(CC 
idCC 
!=CC 
pacienteCC 
.CC 

PacienteIdCC )
)CC) *
{DD 
returnEE 

BadRequestEE !
(EE! "
$strEE" W
)EEW X
;EEX Y
}FF 
varHH 
pacienteExistenteHH !
=HH" #
awaitHH$ )
_appDbcontextHH* 7
.HH7 8
	PacientesHH8 A
.HHA B
	FindAsyncHHB K
(HHK L
idHHL N
)HHN O
;HHO P
ifII 
(II 
pacienteExistenteII !
==II" $
nullII% )
)II) *
{JJ 
returnKK 
NotFoundKK 
(KK  
$strKK  n
)KKn o
;KKo p
}LL 
pacienteExistenteNN 
.NN 
NombreNN $
=NN% &
pacienteNN' /
.NN/ 0
NombreNN0 6
;NN6 7
pacienteExistenteOO 
.OO 
ApellidoOO &
=OO' (
pacienteOO) 1
.OO1 2
ApellidoOO2 :
;OO: ;
pacienteExistentePP 
.PP 
FechaNacimientoPP -
=PP. /
pacientePP0 8
.PP8 9
FechaNacimientoPP9 H
;PPH I
pacienteExistenteQQ 
.QQ 
EmailQQ #
=QQ$ %
pacienteQQ& .
.QQ. /
EmailQQ/ 4
;QQ4 5
awaitRR 
_appDbcontextRR 
.RR  
SaveChangesAsyncRR  0
(RR0 1
)RR1 2
;RR2 3
returnTT 
OkTT 
(TT 
newTT 
{UU 
pacienteExistenteVV !
,VV! "
mensajeWW 
=WW 
$strWW :
}XX 
)XX 
;XX 
}YY 	
[\\ 	

HttpDelete\\	 
(\\ 
$str\\ 
)\\ 
]\\ 
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
DeletePaciente]]) 7
(]]7 8
int]]8 ;
id]]< >
)]]> ?
{^^ 	
var`` 
paciente`` 
=`` 
await``  
_appDbcontext``! .
.``. /
	Pacientes``/ 8
.``8 9
	FindAsync``9 B
(``B C
id``C E
)``E F
;``F G
ifaa 
(aa 
pacienteaa 
==aa 
nullaa  
)aa  !
{bb 
returncc 
NotFoundcc 
(cc  
$strcc  n
)ccn o
;cco p
}dd 
_appDbcontextgg 
.gg 
	Pacientesgg #
.gg# $
Removegg$ *
(gg* +
pacientegg+ 3
)gg3 4
;gg4 5
awaithh 
_appDbcontexthh 
.hh  
SaveChangesAsynchh  0
(hh0 1
)hh1 2
;hh2 3
returnjj 
Okjj 
(jj 
$"jj 
$strjj (
{jj( )
idjj) +
}jj+ ,
$strjj, @
"jj@ A
)jjA B
;jjB C
}kk 	
}ll 
}mm ô9
~C:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Controllers\MedicosController.cs
	namespace 	#
EvaluacionReservasHotel
 !
.! "
Controllers" -
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
MedicosController

 "
:

# $
ControllerBase

% 3
{ 
private 
readonly 
AppDBContext %
_appDbcontext& 3
;3 4
public 
MedicosController  
(  !
AppDBContext! -
appDBContext. :
): ;
{ 	
_appDbcontext 
= 
appDBContext (
;( )
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (

GetMedicos) 3
(3 4
)4 5
{ 	
var 
medicos 
= 
await 
_appDbcontext  -
.- .
Medicos. 5
.5 6
ToListAsync6 A
(A B
)B C
;C D
return 
Ok 
( 
medicos 
) 
; 
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
	GetMedico) 2
(2 3
int3 6
id7 9
)9 :
{ 	
var 
medico 
= 
await 
_appDbcontext ,
., -
Medicos- 4
.4 5
	FindAsync5 >
(> ?
id? A
)A B
;B C
if   
(   
medico   
==   
null   
)   
{!! 
return"" 
NotFound"" 
(""  
$str""  j
)""j k
;""k l
}## 
return$$ 
Ok$$ 
($$ 
medico$$ 
)$$ 
;$$ 
}%% 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
CreateMedico))) 5
())5 6
Medico))6 <
medico))= C
)))C D
{** 	
bool,, 
existeMedico,, 
=,, 
await,,  %
_appDbcontext,,& 3
.,,3 4
Medicos,,4 ;
.-- 
AnyAsync-- 
(-- 
m-- 
=>-- 
m--  
.--  !
Nombre--! '
==--( *
medico--+ 1
.--1 2
Nombre--2 8
&&--9 ;
m--< =
.--= >
Apellido--> F
==--G I
medico--J P
.--P Q
Apellido--Q Y
&&--Z \
m--] ^
.--^ _
Especialidad--_ k
==--l n
medico--o u
.--u v
Especialidad	--v Ç
)
--Ç É
;
--É Ñ
if// 
(// 
existeMedico// 
)// 
{00 
return11 
Conflict11 
(11  
$str11  v
)11v w
;11w x
}22 
_appDbcontext55 
.55 
Medicos55 !
.55! "
Add55" %
(55% &
medico55& ,
)55, -
;55- .
await66 
_appDbcontext66 
.66  
SaveChangesAsync66  0
(660 1
)661 2
;662 3
return88 
Ok88 
(88 
new88 
{99 
medico:: 
,:: 
mensaje;; 
=;; 
$str;; 7
}<< 
)<< 
;<< 
}== 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (

EditMedicoAA) 3
(AA3 4
intAA4 7
idAA8 :
,AA: ;
MedicoAA< B
medicoAAC I
)AAI J
{BB 	
ifCC 
(CC 
idCC 
!=CC 
medicoCC 
.CC 
MedicoIdCC %
)CC% &
{DD 
returnEE 

BadRequestEE !
(EE! "
$strEE" U
)EEU V
;EEV W
}FF 
varHH 
medicoExistenteHH 
=HH  !
awaitHH" '
_appDbcontextHH( 5
.HH5 6
MedicosHH6 =
.HH= >
	FindAsyncHH> G
(HHG H
idHHH J
)HHJ K
;HHK L
ifII 
(II 
medicoExistenteII 
==II  "
nullII# '
)II' (
{JJ 
returnKK 
NotFoundKK 
(KK  
$strKK  j
)KKj k
;KKk l
}LL 
medicoExistenteNN 
.NN 
NombreNN "
=NN# $
medicoNN% +
.NN+ ,
NombreNN, 2
;NN2 3
medicoExistenteOO 
.OO 
ApellidoOO $
=OO% &
medicoOO' -
.OO- .
ApellidoOO. 6
;OO6 7
medicoExistentePP 
.PP 
EspecialidadPP (
=PP) *
medicoPP+ 1
.PP1 2
EspecialidadPP2 >
;PP> ?
awaitQQ 
_appDbcontextQQ 
.QQ  
SaveChangesAsyncQQ  0
(QQ0 1
)QQ1 2
;QQ2 3
returnSS 
OkSS 
(SS 
newSS 
{TT 
medicoExistenteUU 
,UU  
mensajeVV 
=VV 
$strVV 8
}WW 
)WW 
;WW 
}XX 	
[[[ 	

HttpDelete[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
DeleteMedico\\) 5
(\\5 6
int\\6 9
id\\: <
)\\< =
{]] 	
var__ 
medico__ 
=__ 
await__ 
_appDbcontext__ ,
.__, -
Medicos__- 4
.__4 5
	FindAsync__5 >
(__> ?
id__? A
)__A B
;__B C
if`` 
(`` 
medico`` 
==`` 
null`` 
)`` 
{aa 
returnbb 
NotFoundbb 
(bb  
$strbb  j
)bbj k
;bbk l
}cc 
_appDbcontextff 
.ff 
Medicosff !
.ff! "
Removeff" (
(ff( )
medicoff) /
)ff/ 0
;ff0 1
awaitgg 
_appDbcontextgg 
.gg  
SaveChangesAsyncgg  0
(gg0 1
)gg1 2
;gg2 3
returnii 
Okii 
(ii 
$"ii 
$strii &
{ii& '
idii' )
}ii) *
$strii* >
"ii> ?
)ii? @
;ii@ A
}jj 	
}kk 
}ll °8
ÉC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Controllers\ConsultoriosController.cs
	namespace 	#
EvaluacionReservasHotel
 !
.! "
Controllers" -
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 "
ConsultoriosController

 '
:

( )
ControllerBase

* 8
{ 
private 
readonly 
AppDBContext %
_appDbcontext& 3
;3 4
public "
ConsultoriosController %
(% &
AppDBContext& 2
appDBContext3 ?
)? @
{ 	
_appDbcontext 
= 
appDBContext (
;( )
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetConsultorios) 8
(8 9
)9 :
{ 	
var 
consultorios 
= 
await $
_appDbcontext% 2
.2 3
Consultorios3 ?
.? @
ToListAsync@ K
(K L
)L M
;M N
return 
Ok 
( 
consultorios "
)" #
;# $
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetConsultorio) 7
(7 8
int8 ;
id< >
)> ?
{ 	
var 
consultorio 
= 
await #
_appDbcontext$ 1
.1 2
Consultorios2 >
.> ?
	FindAsync? H
(H I
idI K
)K L
;L M
if   
(   
consultorio   
==   
null   #
)  # $
{!! 
return"" 
NotFound"" 
(""  
$str""  t
)""t u
;""u v
}## 
return$$ 
Ok$$ 
($$ 
consultorio$$ !
)$$! "
;$$" #
}%% 	
[(( 	
HttpPost((	 
](( 
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
CreateConsultorio))) :
()): ;
Consultorio)); F
consultorio))G R
)))R S
{** 	
bool,, 
existeConsultorio,, "
=,,# $
await,,% *
_appDbcontext,,+ 8
.,,8 9
Consultorios,,9 E
.-- 
AnyAsync-- 
(-- 
c-- 
=>-- 
c--  
.--  !
Numero--! '
==--( *
consultorio--+ 6
.--6 7
Numero--7 =
&&--> @
c--A B
.--B C
Piso--C G
==--H J
consultorio--K V
.--V W
Piso--W [
)--[ \
;--\ ]
if// 
(// 
existeConsultorio// !
)//! "
{00 
return11 
Conflict11 
(11  
$str11  x
)11x y
;11y z
}22 
_appDbcontext55 
.55 
Consultorios55 &
.55& '
Add55' *
(55* +
consultorio55+ 6
)556 7
;557 8
await66 
_appDbcontext66 
.66  
SaveChangesAsync66  0
(660 1
)661 2
;662 3
return88 
Ok88 
(88 
new88 
{99 
consultorio:: 
,:: 
mensaje;; 
=;; 
$str;; <
}<< 
)<< 
;<< 
}== 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (
EditConsultorioAA) 8
(AA8 9
intAA9 <
idAA= ?
,AA? @
ConsultorioAAA L
consultorioAAM X
)AAX Y
{BB 	
ifCC 
(CC 
idCC 
!=CC 
consultorioCC !
.CC! "
ConsultorioIdCC" /
)CC/ 0
{DD 
returnEE 

BadRequestEE !
(EE! "
$strEE" Z
)EEZ [
;EE[ \
}FF 
varHH  
consultorioExistenteHH $
=HH% &
awaitHH' ,
_appDbcontextHH- :
.HH: ;
ConsultoriosHH; G
.HHG H
	FindAsyncHHH Q
(HHQ R
idHHR T
)HHT U
;HHU V
ifII 
(II  
consultorioExistenteII $
==II% '
nullII( ,
)II, -
{JJ 
returnKK 
NotFoundKK 
(KK  
$strKK  t
)KKt u
;KKu v
}LL  
consultorioExistenteNN  
.NN  !
NumeroNN! '
=NN( )
consultorioNN* 5
.NN5 6
NumeroNN6 <
;NN< = 
consultorioExistenteOO  
.OO  !
PisoOO! %
=OO& '
consultorioOO( 3
.OO3 4
PisoOO4 8
;OO8 9
awaitPP 
_appDbcontextPP 
.PP  
SaveChangesAsyncPP  0
(PP0 1
)PP1 2
;PP2 3
returnRR 
OkRR 
(RR 
newRR 
{SS  
consultorioExistenteTT $
,TT$ %
mensajeUU 
=UU 
$strUU =
}VV 
)VV 
;VV 
}WW 	
[ZZ 	

HttpDeleteZZ	 
(ZZ 
$strZZ 
)ZZ 
]ZZ 
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
DeleteConsultorio[[) :
([[: ;
int[[; >
id[[? A
)[[A B
{\\ 	
var^^ 
consultorio^^ 
=^^ 
await^^ #
_appDbcontext^^$ 1
.^^1 2
Consultorios^^2 >
.^^> ?
	FindAsync^^? H
(^^H I
id^^I K
)^^K L
;^^L M
if__ 
(__ 
consultorio__ 
==__ 
null__ #
)__# $
{`` 
returnaa 
NotFoundaa 
(aa  
$straa  t
)aat u
;aau v
}bb 
_appDbcontextee 
.ee 
Consultoriosee &
.ee& '
Removeee' -
(ee- .
consultorioee. 9
)ee9 :
;ee: ;
awaitff 
_appDbcontextff 
.ff  
SaveChangesAsyncff  0
(ff0 1
)ff1 2
;ff2 3
returnhh 
Okhh 
(hh 
$"hh 
$strhh +
{hh+ ,
idhh, .
}hh. /
$strhh/ C
"hhC D
)hhD E
;hhE F
}ii 	
}jj 
}kk Ôx
mC:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\AppDBContext.cs
	namespace 	
GestionCitasMedicas
 
{ 
public		 

class		 
AppDBContext		 
:		 
	DbContext		  )
{

 
public 
AppDBContext 
( 
DbContextOptions ,
<, -
AppDBContext- 9
>9 :
options; B
)B C
:D E
baseF J
(J K
optionsK R
)R S
{T U
}V W
public 
DbSet 
< 
Paciente 
> 
	Pacientes (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
DbSet 
< 
Medico 
> 
Medicos $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
DbSet 
< 
Cita 
> 
Citas  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
DbSet 
< 
Consultorio  
>  !
Consultorios" .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
modelBuilder 
. 
Entity 
<  
Paciente  (
>( )
() *
)* +
.+ ,
Property, 4
(4 5
p5 6
=>7 9
p: ;
.; <

PacienteId< F
)F G
.G H
ValueGeneratedOnAddH [
([ \
)\ ]
;] ^
modelBuilder 
. 
Entity 
<  
Medico  &
>& '
(' (
)( )
.) *
Property* 2
(2 3
m3 4
=>5 7
m8 9
.9 :
MedicoId: B
)B C
.C D
ValueGeneratedOnAddD W
(W X
)X Y
;Y Z
modelBuilder 
. 
Entity 
<  
Cita  $
>$ %
(% &
)& '
.' (
Property( 0
(0 1
c1 2
=>3 5
c6 7
.7 8
CitaId8 >
)> ?
.? @
ValueGeneratedOnAdd@ S
(S T
)T U
;U V
modelBuilder 
. 
Entity 
<  
Consultorio  +
>+ ,
(, -
)- .
.. /
Property/ 7
(7 8
c8 9
=>: <
c= >
.> ?
ConsultorioId? L
)L M
.M N
ValueGeneratedOnAddN a
(a b
)b c
;c d
modelBuilder 
. 
Entity 
<  
Cita  $
>$ %
(% &
)& '
. 
HasOne 
( 
c 
=> 
c 
. 
Paciente '
)' (
. 
WithMany 
( 
) 
. 
HasForeignKey 
( 
c  
=>! #
c$ %
.% &

PacienteId& 0
)0 1
;1 2
modelBuilder   
.   
Entity   
<    
Cita    $
>  $ %
(  % &
)  & '
.!! 
HasOne!! 
(!! 
c!! 
=>!! 
c!! 
.!! 
Medico!! %
)!!% &
."" 
WithMany"" 
("" 
)"" 
.## 
HasForeignKey## 
(## 
c##  
=>##! #
c##$ %
.##% &
MedicoId##& .
)##. /
;##/ 0
modelBuilder%% 
.%% 
Entity%% 
<%%  
Cita%%  $
>%%$ %
(%%% &
)%%& '
.&& 
HasOne&& 
(&& 
c&& 
=>&& 
c&& 
.&& 
Consultorio&& *
)&&* +
.'' 
WithMany'' 
('' 
)'' 
.(( 
HasForeignKey(( 
((( 
c((  
=>((! #
c(($ %
.((% &
ConsultorioId((& 3
)((3 4
;((4 5
})) 	
}** 
public,, 

class,, 
Paciente,, 
{-- 
public.. 
int.. 

PacienteId.. 
{.. 
get..  #
;..# $
set..% (
;..( )
}..* +
[00 	
Required00	 
(00 
ErrorMessage00 
=00  
$str00! <
)00< =
]00= >
[11 	
RegularExpression11	 
(11 
$str11 +
,11+ ,
ErrorMessage11- 9
=11: ;
$str11< m
)11m n
]11n o
[22 	
StringLength22	 
(22 
$num22 
,22 
ErrorMessage22 &
=22' (
$str22) W
)22W X
]22X Y
public33 
string33 
Nombre33 
{33 
get33 "
;33" #
set33$ '
;33' (
}33) *
[55 	
Required55	 
(55 
ErrorMessage55 
=55  
$str55! >
)55> ?
]55? @
[66 	
RegularExpression66	 
(66 
$str66 +
,66+ ,
ErrorMessage66- 9
=66: ;
$str66< o
)66o p
]66p q
[77 	
StringLength77	 
(77 
$num77 
,77 
ErrorMessage77 &
=77' (
$str77) Y
)77Y Z
]77Z [
public88 
string88 
Apellido88 
{88  
get88! $
;88$ %
set88& )
;88) *
}88+ ,
[:: 	
Required::	 
(:: 
ErrorMessage:: 
=::  
$str::! I
)::I J
]::J K
[;; 	+
CustomFechaNacimientoValidation;;	 (
];;( )
public<< 
DateTime<< 
FechaNacimiento<< '
{<<( )
get<<* -
;<<- .
set<</ 2
;<<2 3
}<<4 5
[>> 	
Required>>	 
(>> 
ErrorMessage>> 
=>>  
$str>>! ;
)>>; <
]>>< =
[?? 	
EmailAddress??	 
(?? 
ErrorMessage?? "
=??# $
$str??% =
)??= >
]??> ?
public@@ 
string@@ 
Email@@ 
{@@ 
get@@ !
;@@! "
set@@# &
;@@& '
}@@( )
}AA 
publicCC 

classCC 
MedicoCC 
{DD 
publicEE 
intEE 
MedicoIdEE 
{EE 
getEE !
;EE! "
setEE# &
;EE& '
}EE( )
[GG 	
RequiredGG	 
(GG 
ErrorMessageGG 
=GG  
$strGG! <
)GG< =
]GG= >
[HH 	
RegularExpressionHH	 
(HH 
$strHH +
,HH+ ,
ErrorMessageHH- 9
=HH: ;
$strHH< m
)HHm n
]HHn o
[II 	
StringLengthII	 
(II 
$numII 
,II 
ErrorMessageII &
=II' (
$strII) W
)IIW X
]IIX Y
publicJJ 
stringJJ 
NombreJJ 
{JJ 
getJJ "
;JJ" #
setJJ$ '
;JJ' (
}JJ) *
[LL 	
RequiredLL	 
(LL 
ErrorMessageLL 
=LL  
$strLL! >
)LL> ?
]LL? @
[MM 	
RegularExpressionMM	 
(MM 
$strMM +
,MM+ ,
ErrorMessageMM- 9
=MM: ;
$strMM< o
)MMo p
]MMp q
[NN 	
StringLengthNN	 
(NN 
$numNN 
,NN 
ErrorMessageNN &
=NN' (
$strNN) Y
)NNY Z
]NNZ [
publicOO 
stringOO 
ApellidoOO 
{OO  
getOO! $
;OO$ %
setOO& )
;OO) *
}OO+ ,
[QQ 	
RequiredQQ	 
(QQ 
ErrorMessageQQ 
=QQ  
$strQQ! B
)QQB C
]QQC D
[RR 	
StringLengthRR	 
(RR 
$numRR 
,RR 
ErrorMessageRR &
=RR' (
$strRR) ]
)RR] ^
]RR^ _
publicSS 
stringSS 
EspecialidadSS "
{SS# $
getSS% (
;SS( )
setSS* -
;SS- .
}SS/ 0
}TT 
publicVV 

classVV 
CitaVV 
{WW 
publicXX 
intXX 
CitaIdXX 
{XX 
getXX 
;XX  
setXX! $
;XX$ %
}XX& '
[ZZ 	
RequiredZZ	 
(ZZ 
ErrorMessageZZ 
=ZZ  
$strZZ! E
)ZZE F
]ZZF G
public[[ 
int[[ 

PacienteId[[ 
{[[ 
get[[  #
;[[# $
set[[% (
;[[( )
}[[* +
[]] 	
Required]]	 
(]] 
ErrorMessage]] 
=]]  
$str]]! C
)]]C D
]]]D E
public^^ 
int^^ 
MedicoId^^ 
{^^ 
get^^ !
;^^! "
set^^# &
;^^& '
}^^( )
[`` 	
Required``	 
(`` 
ErrorMessage`` 
=``  
$str``! H
)``H I
]``I J
publicaa 
intaa 
ConsultorioIdaa  
{aa! "
getaa# &
;aa& '
setaa( +
;aa+ ,
}aa- .
[cc 	
Requiredcc	 
(cc 
ErrorMessagecc 
=cc  
$strcc! ;
)cc; <
]cc< =
[dd 	'
CustomFechaFuturaValidationdd	 $
]dd$ %
publicee 
DateTimeee 
Fechaee 
{ee 
getee  #
;ee# $
setee% (
;ee( )
}ee* +
[gg 	
Requiredgg	 
(gg 
ErrorMessagegg 
=gg  
$strgg! :
)gg: ;
]gg; <
publichh 
TimeSpanhh 
Horahh 
{hh 
gethh "
;hh" #
sethh$ '
;hh' (
}hh) *
[jj 	

JsonIgnorejj	 
]jj 
publickk 
Pacientekk 
?kk 
Pacientekk !
{kk" #
getkk$ '
;kk' (
setkk) ,
;kk, -
}kk. /
[mm 	

JsonIgnoremm	 
]mm 
publicnn 
Mediconn 
?nn 
Mediconn 
{nn 
getnn  #
;nn# $
setnn% (
;nn( )
}nn* +
[pp 	

JsonIgnorepp	 
]pp 
publicqq 
Consultorioqq 
?qq 
Consultorioqq '
{qq( )
getqq* -
;qq- .
setqq/ 2
;qq2 3
}qq4 5
}rr 
publictt 

classtt 
Consultoriott 
{uu 
publicvv 
intvv 
ConsultorioIdvv  
{vv! "
getvv# &
;vv& '
setvv( +
;vv+ ,
}vv- .
[xx 	
Requiredxx	 
(xx 
ErrorMessagexx 
=xx  
$strxx! K
)xxK L
]xxL M
[yy 	
StringLengthyy	 
(yy 
$numyy 
,yy 
ErrorMessageyy %
=yy& '
$stryy( d
)yyd e
]yye f
publiczz 
stringzz 
Numerozz 
{zz 
getzz "
;zz" #
setzz$ '
;zz' (
}zz) *
[|| 	
Required||	 
(|| 
ErrorMessage|| 
=||  
$str||! :
)||: ;
]||; <
[}} 	
Range}}	 
(}} 
$num}} 
,}} 
$num}} 
,}} 
ErrorMessage}} "
=}}# $
$str}}% G
)}}G H
]}}H I
public~~ 
int~~ 
Piso~~ 
{~~ 
get~~ 
;~~ 
set~~ "
;~~" #
}~~$ %
} 
[
ÇÇ 
AttributeUsage
ÇÇ 
(
ÇÇ 
AttributeTargets
ÇÇ $
.
ÇÇ$ %
Property
ÇÇ% -
)
ÇÇ- .
]
ÇÇ. /
public
ÉÉ 

class
ÉÉ 6
(CustomFechaNacimientoValidationAttribute
ÉÉ 9
:
ÉÉ: ;!
ValidationAttribute
ÉÉ< O
{
ÑÑ 
	protected
ÖÖ 
override
ÖÖ 
ValidationResult
ÖÖ +
IsValid
ÖÖ, 3
(
ÖÖ3 4
object
ÖÖ4 :
?
ÖÖ: ;
value
ÖÖ< A
,
ÖÖA B
ValidationContext
ÖÖC T
validationContext
ÖÖU f
)
ÖÖf g
{
ÜÜ 	
if
áá 
(
áá 
value
áá 
is
áá 
DateTime
áá !
fechaNacimiento
áá" 1
&&
áá2 4
fechaNacimiento
áá5 D
>
ááE F
DateTime
ááG O
.
ááO P
Now
ááP S
.
ááS T
AddYears
ááT \
(
áá\ ]
-
áá] ^
$num
áá^ `
)
áá` a
)
ááa b
{
àà 
return
ââ 
new
ââ 
ValidationResult
ââ +
(
ââ+ ,
$str
ââ, V
)
ââV W
;
ââW X
}
ää 
return
ãã 
ValidationResult
ãã #
.
ãã# $
Success
ãã$ +
!
ãã+ ,
;
ãã, -
}
åå 	
}
çç 
[
êê 
AttributeUsage
êê 
(
êê 
AttributeTargets
êê $
.
êê$ %
Property
êê% -
)
êê- .
]
êê. /
public
ëë 

class
ëë 2
$CustomFechaFuturaValidationAttribute
ëë 5
:
ëë6 7!
ValidationAttribute
ëë8 K
{
íí 
	protected
ìì 
override
ìì 
ValidationResult
ìì +
IsValid
ìì, 3
(
ìì3 4
object
ìì4 :
?
ìì: ;
value
ìì< A
,
ììA B
ValidationContext
ììC T
validationContext
ììU f
)
ììf g
{
îî 	
if
ïï 
(
ïï 
value
ïï 
is
ïï 
DateTime
ïï !
fecha
ïï" '
&&
ïï( *
fecha
ïï+ 0
<
ïï1 2
DateTime
ïï3 ;
.
ïï; <
Now
ïï< ?
)
ïï? @
{
ññ 
return
óó 
new
óó 
ValidationResult
óó +
(
óó+ ,
$str
óó, d
)
óód e
;
óóe f
}
òò 
return
ôô 
ValidationResult
ôô #
.
ôô# $
Success
ôô$ +
!
ôô+ ,
;
ôô, -
}
öö 	
}
õõ 
}úú úh
|C:\Users\aange\Videos\EvaluacionReservasHotel\EvaluacionReservasHotel\EvaluacionReservasHotel\Controllers\CitasController.cs
	namespace 	#
EvaluacionReservasHotel
 !
.! "
Controllers" -
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 
CitasController

  
:

! "
ControllerBase

# 1
{ 
private 
readonly 
AppDBContext %
_appDbcontext& 3
;3 4
public 
CitasController 
( 
AppDBContext +
appDBContext, 8
)8 9
{ 	
_appDbcontext 
= 
appDBContext (
;( )
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetCitas) 1
(1 2
[2 3
	FromQuery3 <
]< =
int> A
pageB F
=G H
$numI J
,J K
[L M
	FromQueryM V
]V W
intX [
pageSize\ d
=e f
$numg i
)i j
{ 	
try 
{ 
var 
citas 
= 
await !
_appDbcontext" /
./ 0
Citas0 5
. 
Include 
( 
c 
=> !
c" #
.# $
Paciente$ ,
), -
. 
Include 
( 
c 
=> !
c" #
.# $
Medico$ *
)* +
. 
Include 
( 
c 
=> !
c" #
.# $
Consultorio$ /
)/ 0
. 
Skip 
( 
( 
page 
-  !
$num" #
)# $
*% &
pageSize' /
)/ 0
. 
Take 
( 
pageSize "
)" #
. 
ToListAsync  
(  !
)! "
;" #
if!! 
(!! 
!!! 
citas!! 
.!! 
Any!! 
(!! 
)!!  
)!!  !
return"" 
NotFound"" #
(""# $
$str""$ J
)""J K
;""K L
return$$ 
Ok$$ 
($$ 
new$$ 
{%% 

TotalCitas&& 
=&&  
await&&! &
_appDbcontext&&' 4
.&&4 5
Citas&&5 :
.&&: ;

CountAsync&&; E
(&&E F
)&&F G
,&&G H
PaginaActual''  
=''! "
page''# '
,''' (
TamanoPagina((  
=((! "
pageSize((# +
,((+ ,
Citas)) 
=)) 
citas)) !
}** 
)** 
;** 
}++ 
catch,, 
(,, 
	Exception,, 
ex,, 
),,  
{-- 
return.. 

StatusCode.. !
(..! "
StatusCodes.." -
...- .(
Status500InternalServerError... J
,..J K
$"..L N
$str..N f
{..f g
ex..g i
...i j
Message..j q
}..q r
"..r s
)..s t
;..t u
}// 
}00 	
[33 	
HttpGet33	 
(33 
$str33 
)33 
]33 
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (
GetCita44) 0
(440 1
int441 4
id445 7
)447 8
{55 	
try66 
{77 
var88 
cita88 
=88 
await88  
_appDbcontext88! .
.88. /
Citas88/ 4
.99 
Include99 
(99 
c99 
=>99 !
c99" #
.99# $
Paciente99$ ,
)99, -
.:: 
Include:: 
(:: 
c:: 
=>:: !
c::" #
.::# $
Medico::$ *
)::* +
.;; 
Include;; 
(;; 
c;; 
=>;; !
c;;" #
.;;# $
Consultorio;;$ /
);;/ 0
.<< 
FirstOrDefaultAsync<< (
(<<( )
c<<) *
=><<+ -
c<<. /
.<</ 0
CitaId<<0 6
==<<7 9
id<<: <
)<<< =
;<<= >
if>> 
(>> 
cita>> 
==>> 
null>>  
)>>  !
return?? 
NotFound?? #
(??# $
$str??$ 9
)??9 :
;??: ;
returnAA 
OkAA 
(AA 
citaAA 
)AA 
;AA  
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 

StatusCodeEE !
(EE! "
StatusCodesEE" -
.EE- .(
Status500InternalServerErrorEE. J
,EEJ K
$"EEL N
$strEEN d
{EEd e
exEEe g
.EEg h
MessageEEh o
}EEo p
"EEp q
)EEq r
;EEr s
}FF 
}GG 	
[JJ 	
HttpPostJJ	 
]JJ 
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (

CreateCitaKK) 3
(KK3 4
[KK4 5
FromBodyKK5 =
]KK= >
CitaKK? C
citaKKD H
)KKH I
{LL 	
ifMM 
(MM 
!MM 

ModelStateMM 
.MM 
IsValidMM #
)MM# $
returnNN 

BadRequestNN !
(NN! "

ModelStateNN" ,
)NN, -
;NN- .
tryPP 
{QQ 
varSS 
pacienteSS 
=SS 
awaitSS $
_appDbcontextSS% 2
.SS2 3
	PacientesSS3 <
.SS< =
	FindAsyncSS= F
(SSF G
citaSSG K
.SSK L

PacienteIdSSL V
)SSV W
;SSW X
varTT 
medicoTT 
=TT 
awaitTT "
_appDbcontextTT# 0
.TT0 1
MedicosTT1 8
.TT8 9
	FindAsyncTT9 B
(TTB C
citaTTC G
.TTG H
MedicoIdTTH P
)TTP Q
;TTQ R
varUU 
consultorioUU 
=UU  !
awaitUU" '
_appDbcontextUU( 5
.UU5 6
ConsultoriosUU6 B
.UUB C
	FindAsyncUUC L
(UUL M
citaUUM Q
.UUQ R
ConsultorioIdUUR _
)UU_ `
;UU` a
ifWW 
(WW 
pacienteWW 
==WW 
nullWW  $
||WW% '
medicoWW( .
==WW/ 1
nullWW2 6
||WW7 9
consultorioWW: E
==WWF H
nullWWI M
)WWM N
returnXX 

BadRequestXX %
(XX% &
$strXX& Q
)XXQ R
;XXR S
_appDbcontextZZ 
.ZZ 
CitasZZ #
.ZZ# $
AddZZ$ '
(ZZ' (
citaZZ( ,
)ZZ, -
;ZZ- .
await[[ 
_appDbcontext[[ #
.[[# $
SaveChangesAsync[[$ 4
([[4 5
)[[5 6
;[[6 7
return]] 
CreatedAtAction]] &
(]]& '
nameof]]' -
(]]- .
GetCita]]. 5
)]]5 6
,]]6 7
new]]8 ;
{]]< =
id]]> @
=]]A B
cita]]C G
.]]G H
CitaId]]H N
}]]O P
,]]P Q
cita]]R V
)]]V W
;]]W X
}^^ 
catch__ 
(__ 
	Exception__ 
ex__ 
)__  
{`` 
returnaa 

StatusCodeaa !
(aa! "
StatusCodesaa" -
.aa- .(
Status500InternalServerErroraa. J
,aaJ K
$"aaL N
$straaN c
{aac d
exaad f
.aaf g
Messageaag n
}aan o
"aao p
)aap q
;aaq r
}bb 
}cc 	
[ff 	
HttpPutff	 
(ff 
$strff 
)ff 
]ff 
publicgg 
asyncgg 
Taskgg 
<gg 
IActionResultgg '
>gg' (
EditCitagg) 1
(gg1 2
intgg2 5
idgg6 8
,gg8 9
[gg: ;
FromBodygg; C
]ggC D
CitaggE I
citaggJ N
)ggN O
{hh 	
ifii 
(ii 
idii 
!=ii 
citaii 
.ii 
CitaIdii !
)ii! "
returnjj 

BadRequestjj !
(jj! "
$strjj" A
)jjA B
;jjB C
ifll 
(ll 
!ll 

ModelStatell 
.ll 
IsValidll #
)ll# $
returnmm 

BadRequestmm !
(mm! "

ModelStatemm" ,
)mm, -
;mm- .
tryoo 
{pp 
varqq 
citaExistenteqq !
=qq" #
awaitqq$ )
_appDbcontextqq* 7
.qq7 8
Citasqq8 =
.qq= >
	FindAsyncqq> G
(qqG H
idqqH J
)qqJ K
;qqK L
ifrr 
(rr 
citaExistenterr !
==rr" $
nullrr% )
)rr) *
returnss 
NotFoundss #
(ss# $
$strss$ 9
)ss9 :
;ss: ;
citaExistentevv 
.vv 

PacienteIdvv (
=vv) *
citavv+ /
.vv/ 0

PacienteIdvv0 :
;vv: ;
citaExistenteww 
.ww 
MedicoIdww &
=ww' (
citaww) -
.ww- .
MedicoIdww. 6
;ww6 7
citaExistentexx 
.xx 
ConsultorioIdxx +
=xx, -
citaxx. 2
.xx2 3
ConsultorioIdxx3 @
;xx@ A
citaExistenteyy 
.yy 
Fechayy #
=yy$ %
citayy& *
.yy* +
Fechayy+ 0
;yy0 1
citaExistentezz 
.zz 
Horazz "
=zz# $
citazz% )
.zz) *
Horazz* .
;zz. /
await|| 
_appDbcontext|| #
.||# $
SaveChangesAsync||$ 4
(||4 5
)||5 6
;||6 7
return~~ 
Ok~~ 
(~~ 
new~~ 
{~~ 
Mensaje~~  '
=~~( )
$str~~* F
,~~F G
Cita~~H L
=~~M N
citaExistente~~O \
}~~] ^
)~~^ _
;~~_ `
} 
catch
ÄÄ 
(
ÄÄ 
	Exception
ÄÄ 
ex
ÄÄ 
)
ÄÄ  
{
ÅÅ 
return
ÇÇ 

StatusCode
ÇÇ !
(
ÇÇ! "
StatusCodes
ÇÇ" -
.
ÇÇ- .*
Status500InternalServerError
ÇÇ. J
,
ÇÇJ K
$"
ÇÇL N
$str
ÇÇN d
{
ÇÇd e
ex
ÇÇe g
.
ÇÇg h
Message
ÇÇh o
}
ÇÇo p
"
ÇÇp q
)
ÇÇq r
;
ÇÇr s
}
ÉÉ 
}
ÑÑ 	
[
áá 	

HttpDelete
áá	 
(
áá 
$str
áá 
)
áá 
]
áá 
public
àà 
async
àà 
Task
àà 
<
àà 
IActionResult
àà '
>
àà' (

DeleteCita
àà) 3
(
àà3 4
int
àà4 7
id
àà8 :
)
àà: ;
{
ââ 	
try
ää 
{
ãã 
var
åå 
cita
åå 
=
åå 
await
åå  
_appDbcontext
åå! .
.
åå. /
Citas
åå/ 4
.
åå4 5
	FindAsync
åå5 >
(
åå> ?
id
åå? A
)
ååA B
;
ååB C
if
çç 
(
çç 
cita
çç 
==
çç 
null
çç  
)
çç  !
return
éé 
NotFound
éé #
(
éé# $
$str
éé$ 9
)
éé9 :
;
éé: ;
_appDbcontext
êê 
.
êê 
Citas
êê #
.
êê# $
Remove
êê$ *
(
êê* +
cita
êê+ /
)
êê/ 0
;
êê0 1
await
ëë 
_appDbcontext
ëë #
.
ëë# $
SaveChangesAsync
ëë$ 4
(
ëë4 5
)
ëë5 6
;
ëë6 7
return
ìì 
Ok
ìì 
(
ìì 
$"
ìì 
$str
ìì (
{
ìì( )
id
ìì) +
}
ìì+ ,
$str
ìì, D
"
ììD E
)
ììE F
;
ììF G
}
îî 
catch
ïï 
(
ïï 
	Exception
ïï 
ex
ïï 
)
ïï  
{
ññ 
return
óó 

StatusCode
óó !
(
óó! "
StatusCodes
óó" -
.
óó- .*
Status500InternalServerError
óó. J
,
óóJ K
$"
óóL N
$str
óóN f
{
óóf g
ex
óóg i
.
óói j
Message
óój q
}
óóq r
"
óór s
)
óós t
;
óót u
}
òò 
}
ôô 	
}
öö 
}õõ 