ﬂ
iC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\ApplicationModule.cs
	namespace

 	
Application


 
{ 
public 

static 
class 
ApplicationModule )
{ 
public 
static 
void 
	Configure $
($ %
	Container% .
	container/ 8
)8 9
{ 	
PersistenceModule 
. 
	Configure '
(' (
	container( 1
)1 2
;2 3
	container 
. 
Register 
< 

IValidator )
<) *
Employee* 2
>2 3
,3 4
EmployeeValidator5 F
>F G
(G H
)H I
;I J
	container 
. 
Register 
< 

IValidator )
<) *
User* .
>. /
,/ 0
UserValidator1 >
>> ?
(? @
)@ A
;A B
	container 
. 
Register 
< 
IManager '
<' (
Employee( 0
>0 1
,1 2
Manager3 :
<: ;
Employee; C
>C D
>D E
(E F
)F G
;G H
	container 
. 
Register 
< 
IManager '
<' (
User( ,
>, -
,- .
Manager/ 6
<6 7
User7 ;
>; <
>< =
(= >
)> ?
;? @
	container 
. 
Register 
< %
IEntityOperationValidator 8
<8 9
Employee9 A
>A B
,B C3
'EntityOperationEntityOperationValidatorD k
<k l
Employeel t
>t u
>u v
(v w
)w x
;x y
	container 
. 
Register 
< %
IEntityOperationValidator 8
<8 9
User9 =
>= >
,> ?3
'EntityOperationEntityOperationValidator@ g
<g h
Userh l
>l m
>m n
(n o
)o p
;p q
}!! 	
}"" 
}## ã
xC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Exception\AppValidationException.cs
	namespace 	
Application
 
. 
	Exception 
{ 
public 

class "
AppValidationException '
:( )
System* 0
.0 1
	Exception1 :
{ 
public "
AppValidationException %
(% &
string& ,
message- 4
)4 5
:6 7
base8 <
(< =
message= D
)D E
{ 	
} 	
} 
}		 ©
hC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Manager\IManager.cs
	namespace 	
Application
 
. 
Manager 
{ 
public		 

	interface		 
IManager		 
<		 
TEntity		 %
>		% &
where

 
TEntity

 
:

 

BaseEntity

 !
{ 
TEntity 
Insert 
( 
TEntity 
instance '
)' (
;( )
IEnumerable 
< 
TEntity 
> 
GetAll #
(# $
)$ %
;% &
TEntity 
GetById 
( 
object 
id !
)! "
;" #
void 
Delete 
( 
object 
id 
) 
; 
void 
Update 
( 
TEntity 
entityToUpdate *
)* +
;+ ,
IEnumerable 
< 
TEntity 
> 
Get  
(  !

Expression 
< 
Func 
< 
TEntity #
,# $
bool% )
>) *
>* +
filter, 2
=3 4
null5 9
,9 :
Func 
< 

IQueryable 
< 
TEntity #
># $
,$ %
IOrderedQueryable& 7
<7 8
TEntity8 ?
>? @
>@ A
orderByB I
=J K
nullL P
,P Q
string 
includeProperties $
=% &
$str' )
)) *
;* +
bool 
IgnorePermissions 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ≈1
gC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Manager\Manager.cs
	namespace		 	
Application		
 
.		 
Manager		 
{

 
public 

class 
Manager 
< 
TEntity  
>  !
:" #
IManager$ ,
<, -
TEntity- 4
>4 5
where 
TEntity 
: 

BaseEntity "
{ 
private 
readonly %
IEntityOperationValidator 2
<2 3
TEntity3 :
>: ;$
entityOperationValidator< T
;T U
private 
readonly 
IRepository $
<$ %
TEntity% ,
>, -

repository. 8
;8 9
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public 
Manager 
( %
IEntityOperationValidator 0
<0 1
TEntity1 8
>8 9$
entityOperationValidator: R
,R S
IRepositoryT _
<_ `
TEntity` g
>g h

repositoryi s
,s t
IUnitOfWork	u Ä

unitOfWork
Å ã
)
ã å
{ 	
this 
. $
entityOperationValidator )
=* +$
entityOperationValidator, D
;D E
this 
. 

repository 
= 

repository (
;( )
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
} 	
public 
bool 
IgnorePermissions %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
false6 ;
;; <
public 
TEntity 
Insert 
( 
TEntity %
instance& .
). /
{ 	
this 
. $
entityOperationValidator )
.) *
Validate* 2
(2 3
instance3 ;
,; <
EntityOperationType= P
.P Q
CreateQ W
,W X
thisY ]
.] ^
IgnorePermissions^ o
)o p
;p q
this 
. 

repository 
. 
Insert "
(" #
instance# +
)+ ,
;, -
this 
. 

unitOfWork 
. 
SaveChanges '
(' (
)( )
;) *
return!! 
instance!! 
;!! 
}"" 	
public$$ 
IEnumerable$$ 
<$$ 
TEntity$$ "
>$$" #
GetAll$$$ *
($$* +
)$$+ ,
{%% 	
this&& 
.&& $
entityOperationValidator&& )
.&&) *
CheckPermission&&* 9
(&&9 :
EntityOperationType&&: M
.&&M N
Read&&N R
)&&R S
;&&S T
return'' 
this'' 
.'' 

repository'' "
.''" #
Get''# &
(''& '
)''' (
;''( )
}(( 	
public** 
TEntity** 
GetById** 
(** 
object** %
id**& (
)**( )
{++ 	
this,, 
.,, $
entityOperationValidator,, )
.,,) *
CheckPermission,,* 9
(,,9 :
EntityOperationType,,: M
.,,M N
Read,,N R
),,R S
;,,S T
return-- 
this-- 
.-- 

repository-- "
.--" #
GetById--# *
(--* +
id--+ -
)--- .
;--. /
}.. 	
public00 
void00 
Delete00 
(00 
object00 !
id00" $
)00$ %
{11 	
this22 
.22 $
entityOperationValidator22 )
.22) *
CheckPermission22* 9
(229 :
EntityOperationType22: M
.22M N
Delete22N T
)22T U
;22U V
this33 
.33 

repository33 
.33 
Delete33 "
(33" #
id33# %
)33% &
;33& '
}44 	
public66 
void66 
Update66 
(66 
TEntity66 "
entityToUpdate66# 1
)661 2
{77 	
this88 
.88 $
entityOperationValidator88 )
.88) *
Validate88* 2
(882 3
entityToUpdate883 A
,88A B
EntityOperationType88C V
.88V W
Update88W ]
)88] ^
;88^ _
this99 
.99 

repository99 
.99 
Update99 "
(99" #
entityToUpdate99# 1
)991 2
;992 3
}:: 	
public<< 
IEnumerable<< 
<<< 
TEntity<< "
><<" #
Get<<$ '
(<<' (

Expression<<( 2
<<<2 3
Func<<3 7
<<<7 8
TEntity<<8 ?
,<<? @
bool<<A E
><<E F
><<F G
filter<<H N
=<<O P
null<<Q U
,<<U V
Func<<W [
<<<[ \

IQueryable<<\ f
<<<f g
TEntity<<g n
><<n o
,<<o p
IOrderedQueryable	<<q Ç
<
<<Ç É
TEntity
<<É ä
>
<<ä ã
>
<<ã å
orderBy
<<ç î
=
<<ï ñ
null
<<ó õ
,
<<õ ú
string
<<ù £
includeProperties
<<§ µ
=
<<∂ ∑
$str
<<∏ ∫
)
<<∫ ª
{== 	
this>> 
.>> $
entityOperationValidator>> )
.>>) *
CheckPermission>>* 9
(>>9 :
EntityOperationType>>: M
.>>M N
Read>>N R
)>>R S
;>>S T
return?? 
this?? 
.?? 

repository?? "
.??" #
Get??# &
(??& '
filter??' -
,??- .
orderBy??/ 6
,??6 7
includeProperties??8 I
)??I J
;??J K
}@@ 	
}AA 
}BB ¥
xC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Manager\Validators\UserValidator.cs
	namespace 	
Application
 
. 
Manager 
. 

Validators (
{ 
public 

class 
UserValidator 
:  
AbstractValidator! 2
<2 3
User3 7
>7 8
{ 
public		 
UserValidator		 
(		 
)		 
{

 	
this 
. 
RuleFor 
( 
emp 
=> 
emp  #
.# $
Name$ (
)( )
.) *
NotEmpty* 2
(2 3
)3 4
.4 5
MaximumLength5 B
(B C
StringLengthC O
.O P
NormalP V
)V W
;W X
} 	
} 
} Ω
ÇC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\ValidatorSupport\IEntityOperationValidator.cs
	namespace 	
Application
 
. 
ValidatorSupport &
{ 
public 

	interface %
IEntityOperationValidator .
<. /
TEntity/ 6
>6 7
where 
TEntity 
: 

BaseEntity "
{ 
void		 
Validate		 
(		 
TEntity		 
instance		 &
,		& '
EntityOperationType		( ;
entityOperationType		< O
,		O P
bool		Q U
ignorePermissions		V g
=		h i
false		j o
)		o p
;		p q
void 
CheckPermission 
( 
EntityOperationType 0
entityOperationType1 D
)D E
;E F
} 
} ì#
êC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\ValidatorSupport\EntityOperationEntityOperationValidator.cs
	namespace		 	
Application		
 
.		 
ValidatorSupport		 &
{

 
internal 
class 3
'EntityOperationEntityOperationValidator :
<: ;
TEntity; B
>B C
:D E%
IEntityOperationValidatorF _
<_ `
TEntity` g
>g h
where 
TEntity 
: 

BaseEntity !
{ 
private 
readonly 

IValidator #
<# $
TEntity$ +
>+ ,
	validator- 6
;6 7
private 
readonly 
IUserSession %
userSession& 1
;1 2
public 3
'EntityOperationEntityOperationValidator 6
(6 7

IValidator7 A
<A B
TEntityB I
>I J
	validatorK T
,T U
IUserSessionV b
userSessionc n
)n o
{ 	
this 
. 
	validator 
= 
	validator &
;& '
this 
. 
userSession 
= 
userSession *
;* +
} 	
public 
void 
Validate 
( 
TEntity $
instance% -
,- .
EntityOperationType/ B
entityOperationTypeC V
,V W
boolX \
ignorePermissions] n
=o p
falseq v
)v w
{ 	
if 
( 
! 
ignorePermissions "
)" #
{ 
this 
. 
CheckPermission $
($ %
entityOperationType% 8
)8 9
;9 :
} 
var 
result 
= 
this 
. 
	validator '
.' (
Validate( 0
(0 1
instance1 9
)9 :
;: ;
if 
( 
! 
result 
. 
IsValid 
)  
{   
var!! 
sb!! 
=!! 
new!! 
StringBuilder!! *
(!!* +
)!!+ ,
;!!, -
foreach"" 
("" 
var"" 
failure"" $
in""% '
result""( .
."". /
Errors""/ 5
)""5 6
{## 
sb$$ 
.$$ 

AppendLine$$ !
($$! "
$str$$" -
+$$. /
failure$$0 7
.$$7 8
PropertyName$$8 D
+$$E F
$str$$G h
+$$i j
failure$$k r
.$$r s
ErrorMessage$$s 
)	$$ Ä
;
$$Ä Å
}%% 
throw'' 
new'' "
AppValidationException'' 0
(''0 1
sb''1 3
.''3 4
ToString''4 <
(''< =
)''= >
)''> ?
;''? @
}(( 
})) 	
public++ 
void++ 
CheckPermission++ #
(++# $
EntityOperationType++$ 7
entityOperationType++8 K
)++K L
{,, 	
var-- 

entityName-- 
=-- 
typeof-- #
(--# $
TEntity--$ +
)--+ ,
.--, -
Name--- 1
;--1 2
var.. 

permission.. 
=.. 
$".. 
{..  

entityName..  *
}..* +
...+ ,
{.., -
entityOperationType..- @
}..@ A
"..A B
;..B C
if00 
(00 
!00 
userSession00 
.00 
Permissions00 (
.00( )
Contains00) 1
(001 2

permission002 <
)00< =
)00= >
{11 
var22 
message22 
=22 
$"22  2
&You have no permissions for operation 22  F
{22F G
entityOperationType22G Z
}22Z [
 of 22[ _
{22_ `

entityName22` j
}22j k
 entity22k r
"22r s
;22s t
throw33 
new33 "
AppValidationException33 0
(330 1
message331 8
)338 9
;339 :
}44 
}55 	
}66 
}77 ã
|C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Manager\Validators\EmployeeValidator.cs
	namespace 	
Application
 
. 
Manager 
. 

Validators (
{ 
public 

class 
EmployeeValidator "
:# $
AbstractValidator% 6
<6 7
Employee7 ?
>? @
{ 
public		 
EmployeeValidator		  
(		  !
)		! "
{

 	
this 
. 
RuleFor 
( 
emp 
=> 
emp  #
.# $
	FirstName$ -
)- .
.. /
NotEmpty/ 7
(7 8
)8 9
.9 :
MaximumLength: G
(G H
StringLengthH T
.T U
NormalU [
)[ \
;\ ]
this 
. 
RuleFor 
( 
emp 
=> 
emp  #
.# $

SecondName$ .
). /
./ 0
NotEmpty0 8
(8 9
)9 :
.: ;
MaximumLength; H
(H I
StringLengthI U
.U V
NormalV \
)\ ]
;] ^
this 
. 
RuleFor 
( 
emp 
=> 
emp  #
.# $
Surname$ +
)+ ,
., -
MaximumLength- :
(: ;
StringLength; G
.G H
NormalH N
)N O
;O P
} 	
} 
} ö
oC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Application\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str &
)& '
]' (
[		 
assembly		 	
:			 

AssemblyDescription		 
(		 
$str		 !
)		! "
]		" #
[

 
assembly

 	
:

	 
!
AssemblyConfiguration

  
(

  !
$str

! #
)

# $
]

$ %
[ 
assembly 	
:	 

AssemblyCompany 
( 
$str 
) 
] 
[ 
assembly 	
:	 

AssemblyProduct 
( 
$str (
)( )
]) *
[ 
assembly 	
:	 

AssemblyCopyright 
( 
$str 0
)0 1
]1 2
[ 
assembly 	
:	 

AssemblyTrademark 
( 
$str 
)  
]  !
[ 
assembly 	
:	 

AssemblyCulture 
( 
$str 
) 
] 
[ 
assembly 	
:	 


ComVisible 
( 
false 
) 
] 
[ 
assembly 	
:	 

Guid 
( 
$str 6
)6 7
]7 8
[## 
assembly## 	
:##	 

AssemblyVersion## 
(## 
$str## $
)##$ %
]##% &
[$$ 
assembly$$ 	
:$$	 

AssemblyFileVersion$$ 
($$ 
$str$$ (
)$$( )
]$$) *