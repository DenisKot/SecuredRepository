‡
uC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\App_Start\BundleConfig.cs
	namespace 	
SecuredPersistance
 
{ 
public 

class 
BundleConfig 
{ 
public		 
static		 
void		 
RegisterBundles		 *
(		* +
BundleCollection		+ ;
bundles		< C
)		C D
{

 	
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) ;
); <
.< =
Include= D
(D E
$str 7
)7 8
)8 9
;9 :
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) >
)> ?
.? @
Include@ G
(G H
$str 4
)4 5
)5 6
;6 7
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) >
)> ?
.? @
Include@ G
(G H
$str /
)/ 0
)0 1
;1 2
bundles 
. 
Add 
( 
new 
ScriptBundle (
(( )
$str) >
)> ?
.? @
Include@ G
(G H
$str .
). /
)/ 0
;0 1
bundles 
. 
Add 
( 
new 
StyleBundle '
(' (
$str( 7
)7 8
.8 9
Include9 @
(@ A
$str /
,/ 0
$str *
)* +
)+ ,
;, -
} 	
} 
} ™
uC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\App_Start\FilterConfig.cs
	namespace 	
SecuredPersistance
 
{ 
public 

class 
FilterConfig 
{ 
public 
static 
void !
RegisterGlobalFilters 0
(0 1"
GlobalFilterCollection1 G
filtersH O
)O P
{		 	
filters

 
.

 
Add

 
(

 
new

  
HandleErrorAttribute

 0
(

0 1
)

1 2
)

2 3
;

3 4
} 	
} 
} à	
tC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\App_Start\RouteConfig.cs
	namespace 	
SecuredPersistance
 
{		 
public

 

class

 
RouteConfig

 
{ 
public 
static 
void 
RegisterRoutes )
() *
RouteCollection* 9
routes: @
)@ A
{ 	
routes 
. 
IgnoreRoute 
( 
$str ;
); <
;< =
routes 
. 
MapRoute 
( 
name 
: 
$str 
,  
url 
: 
$str 1
,1 2
defaults 
: 
new 
{ 

controller  *
=+ ,
$str- 3
,3 4
action5 ;
=< =
$str> E
,E F
idG I
=J K
UrlParameterL X
.X Y
OptionalY a
}b c
) 
; 
} 	
} 
} ó
ÇC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\App_Start\SimpleInjectorInitializer.cs
[ 
assembly 	
:	 

WebActivator 
. &
PostApplicationStartMethod 2
(2 3
typeof3 9
(9 :
SecuredPersistence: L
.L M
	App_StartM V
.V W%
SimpleInjectorInitializerW p
)p q
,q r
$strs 
)	 Ä
]
Ä Å
	namespace 	
SecuredPersistence
 
. 
	App_Start &
{ 
public 

static 
class %
SimpleInjectorInitializer 1
{ 
public 
static 
	Container 

Initialize  *
(* +
)+ ,
{ 	
var 
	container 
= 
new 
	Container  )
() *
)* +
;+ ,
	container 
. 
Options 
. "
DefaultScopedLifestyle 4
=5 6
new7 :
WebRequestLifestyle; N
(N O
)O P
;P Q
InitializeContainer 
(  
	container  )
)) *
;* +
	container 
. "
RegisterMvcControllers ,
(, -
Assembly- 5
.5 6 
GetExecutingAssembly6 J
(J K
)K L
)L M
;M N
	container 
. 
Verify 
( 
) 
; 
DependencyResolver 
. 
SetResolver *
(* +
new+ .,
 SimpleInjectorDependencyResolver/ O
(O P
	containerP Y
)Y Z
)Z [
;[ \
GlobalFilters   
.   
Filters   !
.  ! "
Add  " %
(  % &
	container  & /
.  / 0
GetInstance  0 ;
<  ; <(
UnitOfWorkMvcFilterAttribute  < X
>  X Y
(  Y Z
)  Z [
)  [ \
;  \ ]
GlobalFilters!! 
.!! 
Filters!! !
.!!! "
Add!!" %
(!!% &
new!!& )$
ExceptionFilterAttribute!!* B
(!!B C
)!!C D
)!!D E
;!!E F
return## 
	container## 
;## 
}$$ 	
private&& 
static&& 
void&& 
InitializeContainer&& /
(&&/ 0
	Container&&0 9
	container&&: C
)&&C D
{'' 	
ApplicationModule(( 
.(( 
	Configure(( '
(((' (
	container((( 1
)((1 2
;((2 3
	container** 
.** 
Register** 
<** (
UnitOfWorkMvcFilterAttribute** ;
>**; <
(**< =
	Lifestyle**= F
.**F G
	Transient**G P
)**P Q
;**Q R
	container++ 
.++ 
Register++ 
<++ 
IUserSession++ +
,+++ ,
UserSession++- 8
>++8 9
(++9 :
	Lifestyle++: C
.++C D
	Transient++D M
)++M N
;++N O
},, 	
}-- 
}.. ∫
uC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\App_Start\WebApiConfig.cs
	namespace 	
SecuredPersistance
 
{ 
public 

static 
class 
WebApiConfig $
{		 
public

 
static

 
void

 
Register

 #
(

# $
HttpConfiguration

$ 5
config

6 <
)

< =
{ 	
config 
. "
MapHttpAttributeRoutes )
() *
)* +
;+ ,
config 
. 
Routes 
. 
MapHttpRoute &
(& '
name 
: 
$str "
," #
routeTemplate 
: 
$str 6
,6 7
defaults 
: 
new 
{ 
id  "
=# $
RouteParameter% 3
.3 4
Optional4 <
}= >
) 
; 
} 	
} 
} ˚&
|C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Controllers\AccountController.cs
	namespace 	
SecuredPersistence
 
. 
Controllers (
{ 
public 

class 
AccountController "
:# $

Controller% /
{ 
private 
readonly 
IManager !
<! "
User" &
>& '
userManager( 3
;3 4
public 
AccountController  
(  !
IManager! )
<) *
User* .
>. /
userManager0 ;
); <
{ 	
this 
. 
userManager 
= 
userManager *
;* +
} 	
[ 	
HttpPost	 
] 
public 
ActionResult 
Register $
($ % 
CustomPrincipalModel% 9
principalsModel: I
)I J
{ 	
var 
permissions 
= 
new !
List" &
<& '

Permission' 1
>1 2
(2 3
)3 4
;4 5
foreach 
( 
var 

permission #
in$ &
principalsModel' 6
.6 7
Permissions7 B
)B C
{ 
permissions 
. 
Add 
(  
new  #

Permission$ .
{ 
Name 
= 

permission %
}   
)   
;   
}!! 
var## 
user## 
=## 
new## 
User## 
{$$ 
Name%% 
=%% 
principalsModel%% &
.%%& '
Name%%' +
,%%+ ,
Permissions&& 
=&& 
permissions&& )
}'' 
;'' 
this)) 
.)) 
userManager)) 
.)) 
IgnorePermissions)) .
=))/ 0
true))1 5
;))5 6
this** 
.** 
userManager** 
.** 
Insert** #
(**# $
user**$ (
)**( )
;**) *
principalsModel++ 
.++ 
Id++ 
=++  
user++! %
.++% &
Id++& (
;++( )
var-- 

serializer-- 
=-- 
new--   
JavaScriptSerializer--! 5
(--5 6
)--6 7
;--7 8
var.. 
userData.. 
=.. 

serializer.. %
...% &
	Serialize..& /
(../ 0
principalsModel..0 ?
)..? @
;..@ A%
FormsAuthenticationTicket00 %

authTicket00& 0
=001 2
new003 6%
FormsAuthenticationTicket007 P
(00P Q
$num11 
,11 
user22 
.22 
Name22 
,22 
DateTime33 
.33 
Now33 
,33 
DateTime44 
.44 
Now44 
.44 

AddMinutes44 '
(44' (
$num44( *
)44* +
,44+ ,
false55 
,55 
userData66 
)66 
;66 
string88 
	encTicket88 
=88 
FormsAuthentication88 2
.882 3
Encrypt883 :
(88: ;

authTicket88; E
)88E F
;88F G

HttpCookie99 
faCookie99 
=99  !
new99" %

HttpCookie99& 0
(990 1
FormsAuthentication991 D
.99D E
FormsCookieName99E T
,99T U
	encTicket99V _
)99_ `
;99` a
this:: 
.:: 
Response:: 
.:: 
Cookies:: !
.::! "
Add::" %
(::% &
faCookie::& .
)::. /
;::/ 0
CustomPrincipal<< 
newUser<< #
=<<$ %
new<<& )
CustomPrincipal<<* 9
(<<9 :

authTicket<<: D
.<<D E
Name<<E I
)<<I J
{== 
Id>> 
=>> 
principalsModel>> $
.>>$ %
Id>>% '
,>>' (
Name?? 
=?? 
principalsModel?? &
.??& '
Name??' +
,??+ ,
Permissions@@ 
=@@ 
principalsModel@@ -
.@@- .
Permissions@@. 9
}AA 
;AA 
SystemCC 
.CC 
WebCC 
.CC 
HttpContextCC "
.CC" #
CurrentCC# *
.CC* +
UserCC+ /
=CC0 1
newUserCC2 9
;CC9 :
returnEE 
thisEE 
.EE 
RedirectToActionEE (
(EE( )
$strEE) 0
,EE0 1
$strEE2 =
)EE= >
;EE> ?
}FF 	
}GG 
}HH á6
~C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Controllers\EmployeesController.cs
	namespace 	
SecuredPersistence
 
. 
Controllers (
{ 
public 

class 
EmployeesController $
:% &

Controller' 1
{		 
private

 
readonly

 
IManager

 !
<

! "
Employee

" *
>

* +
manager

, 3
;

3 4
public 
EmployeesController "
(" #
IManager# +
<+ ,
Employee, 4
>4 5
manager6 =
)= >
{ 	
this 
. 
manager 
= 
manager "
;" #
} 	
public 
ActionResult 
Index !
(! "
)" #
{ 	
return 
View 
( 
manager 
.  
GetAll  &
(& '
)' (
)( )
;) *
} 	
public 
ActionResult 
Details #
(# $
int$ '
?' (
id) +
)+ ,
{ 	
if 
( 
id 
== 
null 
) 
{ 
return 
new  
HttpStatusCodeResult /
(/ 0
HttpStatusCode0 >
.> ?

BadRequest? I
)I J
;J K
} 
Employee 
employee 
= 
this  $
.$ %
manager% ,
., -
GetById- 4
(4 5
id5 7
)7 8
;8 9
if 
( 
employee 
== 
null  
)  !
{   
return!! 
HttpNotFound!! #
(!!# $
)!!$ %
;!!% &
}"" 
return## 
View## 
(## 
employee##  
)##  !
;##! "
}$$ 	
public'' 
ActionResult'' 
Create'' "
(''" #
)''# $
{(( 	
return)) 
View)) 
()) 
))) 
;)) 
}** 	
[,, 	
HttpPost,,	 
],, 
[-- 	$
ValidateAntiForgeryToken--	 !
]--! "
public.. 
ActionResult.. 
Create.. "
(.." #
[..# $
Bind..$ (
(..( )
Include..) 0
=..1 2
$str..3 T
)..T U
]..U V
Employee..W _
employee..` h
)..h i
{// 	
if00 
(00 

ModelState00 
.00 
IsValid00 "
)00" #
{11 
this22 
.22 
manager22 
.22 
Insert22 #
(22# $
employee22$ ,
)22, -
;22- .
return33 
RedirectToAction33 '
(33' (
$str33( /
)33/ 0
;330 1
}44 
return66 
View66 
(66 
employee66  
)66  !
;66! "
}77 	
public:: 
ActionResult:: 
Edit::  
(::  !
int::! $
?::$ %
id::& (
)::( )
{;; 	
if<< 
(<< 
id<< 
==<< 
null<< 
)<< 
{== 
return>> 
new>>  
HttpStatusCodeResult>> /
(>>/ 0
HttpStatusCode>>0 >
.>>> ?

BadRequest>>? I
)>>I J
;>>J K
}?? 
Employee@@ 
employee@@ 
=@@ 
this@@  $
.@@$ %
manager@@% ,
.@@, -
GetById@@- 4
(@@4 5
id@@5 7
)@@7 8
;@@8 9
ifAA 
(AA 
employeeAA 
==AA 
nullAA  
)AA  !
{BB 
returnCC 
HttpNotFoundCC #
(CC# $
)CC$ %
;CC% &
}DD 
returnEE 
ViewEE 
(EE 
employeeEE  
)EE  !
;EE! "
}FF 	
[II 	
HttpPostII	 
]II 
[JJ 	$
ValidateAntiForgeryTokenJJ	 !
]JJ! "
publicKK 
ActionResultKK 
EditKK  
(KK  !
[KK! "
BindKK" &
(KK& '
IncludeKK' .
=KK/ 0
$strKK1 R
)KKR S
]KKS T
EmployeeKKU ]
employeeKK^ f
)KKf g
{LL 	
ifMM 
(MM 

ModelStateMM 
.MM 
IsValidMM "
)MM" #
{NN 
thisOO 
.OO 
managerOO 
.OO 
UpdateOO #
(OO# $
employeeOO$ ,
)OO, -
;OO- .
returnPP 
RedirectToActionPP '
(PP' (
$strPP( /
)PP/ 0
;PP0 1
}QQ 
returnRR 
ViewRR 
(RR 
employeeRR  
)RR  !
;RR! "
}SS 	
publicVV 
ActionResultVV 
DeleteVV "
(VV" #
intVV# &
?VV& '
idVV( *
)VV* +
{WW 	
ifXX 
(XX 
idXX 
==XX 
nullXX 
)XX 
{YY 
returnZZ 
newZZ  
HttpStatusCodeResultZZ /
(ZZ/ 0
HttpStatusCodeZZ0 >
.ZZ> ?

BadRequestZZ? I
)ZZI J
;ZZJ K
}[[ 
Employee\\ 
employee\\ 
=\\ 
this\\  $
.\\$ %
manager\\% ,
.\\, -
GetById\\- 4
(\\4 5
id\\5 7
)\\7 8
;\\8 9
if]] 
(]] 
employee]] 
==]] 
null]]  
)]]  !
{^^ 
return__ 
HttpNotFound__ #
(__# $
)__$ %
;__% &
}`` 
returnaa 
Viewaa 
(aa 
employeeaa  
)aa  !
;aa! "
}bb 	
[ee 	
HttpPostee	 
,ee 

ActionNameee 
(ee 
$stree &
)ee& '
]ee' (
[ff 	$
ValidateAntiForgeryTokenff	 !
]ff! "
publicgg 
ActionResultgg 
DeleteConfirmedgg +
(gg+ ,
intgg, /
idgg0 2
)gg2 3
{hh 	
thisii 
.ii 
managerii 
.ii 
Deleteii 
(ii  
idii  "
)ii" #
;ii# $
returnjj 
RedirectToActionjj #
(jj# $
$strjj$ +
)jj+ ,
;jj, -
}kk 	
}ll 
}mm Ú%
yC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Controllers\HomeController.cs
	namespace 	
SecuredPersistence
 
. 
Controllers (
{ 
public		 

class		 
HomeController		 
:		  !

Controller		" ,
{

 
private 
readonly 
IUserSession %
userSession& 1
;1 2
public 
HomeController 
( 
IUserSession *
userSession+ 6
)6 7
{ 	
this 
. 
userSession 
= 
userSession *
;* +
} 	
public 
ActionResult 
Index !
(! "
)" #
{ 	
this 
. 
ViewBag 
. 
Permissions $
=% &
this' +
.+ ,
GetPermissions, :
(: ;
); <
;< =
this 
. 
ViewBag 
. 
IsAuthorized %
=& '
this( ,
., -
userSession- 8
.8 9
Id9 ;
.; <
HasValue< D
;D E
return 
this 
. 
View 
( 
) 
; 
} 	
public 
ActionResult 
About !
(! "
)" #
{ 	
this 
. 
ViewBag 
. 
Message  
=! "
$str# G
;G H
return 
this 
. 
View 
( 
) 
; 
} 	
public!! 
ActionResult!! 
List!!  
(!!  !
)!!! "
{"" 	
return## 
this## 
.## 
View## 
(## 
)## 
;## 
}$$ 	
private&& 
IList&& 
<&& 
SelectListItem&& $
>&&$ %
GetPermissions&&& 4
(&&4 5
)&&5 6
{'' 	
var(( 
nameOfEntity(( 
=(( 
nameof(( %
(((% &
Employee((& .
)((. /
;((/ 0
return)) 
new)) 
List)) 
<)) 
SelectListItem)) *
>))* +
{** 
new++ 
SelectListItem++ "
{++# $
Text++$ (
=++) *
$"+++ -
{++- .
nameOfEntity++. :
}++: ;
{++< =
EntityOperationType++= P
.++P Q
Create++Q W
}++W X
"++X Y
,++Y Z
Value++[ `
=++a b
$"++c e
{++e f
nameOfEntity++f r
}++r s
.++s t
{++t u 
EntityOperationType	++u à
.
++à â
Create
++â è
}
++è ê
"
++ê ë
}
++ë í
,
++í ì
new,, 
SelectListItem,, "
{,,# $
Text,,$ (
=,,) *
$",,+ -
{,,- .
nameOfEntity,,. :
},,: ;
{,,< =
EntityOperationType,,= P
.,,P Q
Read,,Q U
},,U V
",,V W
,,,W X
Value,,Y ^
=,,_ `
$",,a c
{,,c d
nameOfEntity,,d p
},,p q
.,,q r
{,,r s 
EntityOperationType	,,s Ü
.
,,Ü á
Read
,,á ã
}
,,ã å
"
,,å ç
}
,,ç é
,
,,é è
new-- 
SelectListItem-- "
{--# $
Text--$ (
=--) *
$"--+ -
{--- .
nameOfEntity--. :
}--: ;
{--< =
EntityOperationType--= P
.--P Q
Delete--Q W
}--W X
"--X Y
,--Y Z
Value--[ `
=--a b
$"--c e
{--e f
nameOfEntity--f r
}--r s
.--s t
{--t u 
EntityOperationType	--u à
.
--à â
Delete
--â è
}
--è ê
"
--ê ë
}
--ë í
,
--í ì
new.. 
SelectListItem.. "
{..# $
Text..$ (
=..) *
$"..+ -
{..- .
nameOfEntity... :
}..: ;
{..< =
EntityOperationType..= P
...P Q
Update..Q W
}..W X
"..X Y
,..Y Z
Value..[ `
=..a b
$"..c e
{..e f
nameOfEntity..f r
}..r s
...s t
{..t u 
EntityOperationType	..u à
.
..à â
Update
..â è
}
..è ê
"
..ê ë
}
..ë í
,
..í ì
}// 
;// 
}00 	
}11 
}22 Ω
C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Filters\ExceptionFilterAttribute.cs
	namespace 	
SecuredPersistence
 
. 
Filters $
{ 
public 

class $
ExceptionFilterAttribute )
:* +
IExceptionFilter, <
{ 
public		 
void		 
OnException		 
(		  
ExceptionContext		  0
filterContext		1 >
)		> ?
{

 	
if 
( 
filterContext 
. 
	Exception '
is( *"
AppValidationException+ A
)A B
{ 
var 
	exception 
= 
filterContext  -
.- .
	Exception. 7
as8 :"
AppValidationException; Q
;Q R
var 
contentResult !
=" #
new$ '
ContentResult( 5
(5 6
)6 7
;7 8
contentResult 
. 
Content %
=& '
$"( *'
Validation Error! Details: * E
{E F
	exceptionF O
.O P
MessageP W
}W X
"X Y
;Y Z
filterContext 
. 
Result $
=% &
contentResult' 4
;4 5
filterContext 
. 
ExceptionHandled .
=/ 0
true1 5
;5 6
} 
} 	
} 
} É&
ÉC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Filters\UnitOfWorkApiFilterAttribute.cs
	namespace		 	
SecuredPersistence		
 
.		 
Filters		 $
{

 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
,D E
AllowMultipleF S
=T U
trueV Z
,Z [
	Inherited\ e
=f g
trueh l
)l m
]m n
public 

class (
UnitOfWorkApiFilterAttribute -
:. /!
ActionFilterAttribute0 E
,E F
IExceptionFilterG W
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public (
UnitOfWorkApiFilterAttribute +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
)B C
{ 	
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
} 	
public 
bool 
AllowMultiple !
{" #
get$ '
;' (
}) *
public 
override 
void 
OnActionExecuting .
(. /
HttpActionContext/ @
actionContextA N
)N O
{ 	
this 
. 

unitOfWork 
. 
BeginTransaction ,
(, -
)- .
;. /
base 
. 
OnActionExecuting "
(" #
actionContext# 0
)0 1
;1 2
} 	
public 
override 
Task "
OnActionExecutingAsync 3
(3 4
HttpActionContext4 E
actionContextF S
,S T
CancellationTokenU f
cancellationTokeng x
)x y
{ 	
this 
. 

unitOfWork 
. 
BeginTransaction ,
(, -
)- .
;. /
return   
base   
.   "
OnActionExecutingAsync   .
(  . /
actionContext  / <
,  < =
cancellationToken  > O
)  O P
;  P Q
}!! 	
public## 
override## 
void## 
OnActionExecuted## -
(##- .%
HttpActionExecutedContext##. G!
actionExecutedContext##H ]
)##] ^
{$$ 	
this%% 
.%% 

unitOfWork%% 
.%% 
SaveChanges%% '
(%%' (
)%%( )
;%%) *
this&& 
.&& 

unitOfWork&& 
.&& 
EndTransaction&& *
(&&* +
)&&+ ,
;&&, -
this'' 
.'' 

unitOfWork'' 
.'' 
Dispose'' #
(''# $
)''$ %
;''% &
base(( 
.(( 
OnActionExecuted(( !
(((! "!
actionExecutedContext((" 7
)((7 8
;((8 9
})) 	
public++ 
override++ 
Task++ !
OnActionExecutedAsync++ 2
(++2 3%
HttpActionExecutedContext++3 L!
actionExecutedContext++M b
,++b c
CancellationToken++d u
cancellationToken	++v á
)
++á à
{,, 	
this-- 
.-- 

unitOfWork-- 
.-- 
SaveChangesAsync-- ,
(--, -
)--- .
;--. /
this.. 
... 

unitOfWork.. 
... 
EndTransaction.. *
(..* +
)..+ ,
;.., -
this// 
.// 

unitOfWork// 
.// 
Dispose// #
(//# $
)//$ %
;//% &
return00 
base00 
.00 !
OnActionExecutedAsync00 -
(00- .!
actionExecutedContext00. C
,00C D
cancellationToken00E V
)00V W
;00W X
}11 	
public33 
Task33 '
ExecuteExceptionFilterAsync33 /
(33/ 0%
HttpActionExecutedContext330 I!
actionExecutedContext33J _
,33_ `
CancellationToken33a r
cancellationToken	33s Ñ
)
33Ñ Ö
{44 	

unitOfWork77 
.77 
Rollback77 
(77  
)77  !
;77! "
return88 
Task88 
.88 
Run88 
(88 
(88 
)88 
=>88 !
{88" #
}88$ %
,88% &
cancellationToken88' 8
)888 9
;889 :
}99 	
}:: 
};; æ
ÄC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Filters\UnitOfWorkMvcActionFilter.cs
	namespace 	
SecuredPersistence
 
. 
Filters $
{ 
public 

class %
UnitOfWorkMvcActionFilter *
:+ ,
IActionFilter- :
{ 
private 
readonly 
IUnitOfWork $

unitOfWork% /
;/ 0
public

 %
UnitOfWorkMvcActionFilter

 (
(

( )
IUnitOfWork

) 4

unitOfWork

5 ?
)

? @
{ 	
this 
. 

unitOfWork 
= 

unitOfWork (
;( )
} 	
public 
void 
OnActionExecuting %
(% &"
ActionExecutingContext& <
filterContext= J
)J K
{ 	
this 
. 

unitOfWork 
. 
BeginTransaction ,
(, -
)- .
;. /
} 	
public 
void 
OnActionExecuted $
($ %!
ActionExecutedContext% :
filterContext; H
)H I
{ 	
this 
. 

unitOfWork 
. 
SaveChanges '
(' (
)( )
;) *
this 
. 

unitOfWork 
. 
EndTransaction *
(* +
)+ ,
;, -
} 	
} 
} Ç
ÉC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Filters\UnitOfWorkMvcFilterAttribute.cs
	namespace 	
SecuredPersistence
 
. 
Filters $
{		 
[

 
AttributeUsage

 
(

 
AttributeTargets

 $
.

$ %
Class

% *
|

+ ,
AttributeTargets

- =
.

= >
Method

> D
,

D E
AllowMultiple

F S
=

T U
true

V Z
,

Z [
	Inherited

\ e
=

f g
true

h l
)

l m
]

m n
public 

class (
UnitOfWorkMvcFilterAttribute -
:. /!
ActionFilterAttribute0 E
,E F
IExceptionFilterG W
{ 
private 
IUnitOfWork 

unitOfWork &
=>' )
this* .
.. /
	container/ 8
.8 9
GetInstance9 D
<D E
IUnitOfWorkE P
>P Q
(Q R
)R S
;S T
private 
readonly 
	Container "
	container# ,
;, -
public (
UnitOfWorkMvcFilterAttribute +
(+ ,
	Container, 5
	container6 ?
)? @
{ 	
this 
. 
	container 
= 
	container &
;& '
} 	
public 
override 
void 
OnActionExecuting .
(. /"
ActionExecutingContext/ E
filterContextF S
)S T
{ 	
this 
. 

unitOfWork 
. 
BeginTransaction ,
(, -
)- .
;. /
base 
. 
OnActionExecuting "
(" #
filterContext# 0
)0 1
;1 2
} 	
public 
override 
void 
OnActionExecuted -
(- .!
ActionExecutedContext. C
filterContextD Q
)Q R
{ 	
this 
. 

unitOfWork 
. 
SaveChanges '
(' (
)( )
;) *
this 
. 

unitOfWork 
. 
EndTransaction *
(* +
)+ ,
;, -
base 
. 
OnActionExecuted !
(! "
filterContext" /
)/ 0
;0 1
}   	
public"" 
void"" 
OnException"" 
(""  
ExceptionContext""  0
filterContext""1 >
)""> ?
{## 	
this$$ 
.$$ 

unitOfWork$$ 
.$$ 
Rollback$$ $
($$$ %
)$$% &
;$$& '
}%% 	
}&& 
}'' ±
jC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Global.asax.cs
	namespace 	
SecuredPersistence
 
{ 
public 

class 
MvcApplication 
:  !
System" (
.( )
Web) ,
., -
HttpApplication- <
{ 
	protected 
void 
Application_Start (
(( )
)) *
{ 	%
SimpleInjectorInitializer %
.% &

Initialize& 0
(0 1
)1 2
;2 3
AreaRegistration 
. 
RegisterAllAreas -
(- .
). /
;/ 0
GlobalConfiguration 
.  
	Configure  )
() *
WebApiConfig* 6
.6 7
Register7 ?
)? @
;@ A
FilterConfig 
. !
RegisterGlobalFilters .
(. /
GlobalFilters/ <
.< =
Filters= D
)D E
;E F
RouteConfig 
. 
RegisterRoutes &
(& '

RouteTable' 1
.1 2
Routes2 8
)8 9
;9 :
BundleConfig 
. 
RegisterBundles (
(( )
BundleTable) 4
.4 5
Bundles5 <
)< =
;= >
} 	
	protected 
void /
#Application_PostAuthenticateRequest :
(: ;
Object; A
senderB H
,H I
	EventArgsJ S
eT U
)U V
{ 	

HttpCookie 

authCookie !
=" #
Request$ +
.+ ,
Cookies, 3
[3 4
FormsAuthentication4 G
.G H
FormsCookieNameH W
]W X
;X Y
if   
(   

authCookie   
!=   
null   "
)  " #
{!! %
FormsAuthenticationTicket"" )

authTicket""* 4
=""5 6
FormsAuthentication""7 J
.""J K
Decrypt""K R
(""R S

authCookie""S ]
.""] ^
Value""^ c
)""c d
;""d e 
JavaScriptSerializer$$ $

serializer$$% /
=$$0 1
new$$2 5 
JavaScriptSerializer$$6 J
($$J K
)$$K L
;$$L M 
CustomPrincipalModel&& $
serializeModel&&% 3
=&&4 5

serializer&&6 @
.&&@ A
Deserialize&&A L
<&&L M 
CustomPrincipalModel&&M a
>&&a b
(&&b c

authTicket&&c m
.&&m n
UserData&&n v
)&&v w
;&&w x
CustomPrincipal(( 
newUser((  '
=((( )
new((* -
CustomPrincipal((. =
(((= >

authTicket((> H
.((H I
Name((I M
)((M N
;((N O
newUser)) 
.)) 
Id)) 
=)) 
serializeModel)) +
.))+ ,
Id)), .
;)). /
newUser** 
.** 
Name** 
=** 
serializeModel** -
.**- .
Name**. 2
;**2 3
newUser++ 
.++ 
Permissions++ #
=++$ %
serializeModel++& 4
.++4 5
Permissions++5 @
;++@ A
HttpContext-- 
.-- 
Current-- #
.--# $
User--$ (
=--) *
newUser--+ 2
;--2 3
}.. 
}// 	
}00 
}11 …
uC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Models\CustomPrincipal.cs
	namespace 	
SecuredPersistence
 
. 
Models #
{ 
public 

class 
CustomPrincipal  
:! "
ICustomPrincipal# 3
{ 
public 
	IIdentity 
Identity !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public		 
bool		 
IsInRole		 
(		 
string		 #
role		$ (
)		( )
{		* +
return		, 2
false		3 8
;		8 9
}		: ;
public 
CustomPrincipal 
( 
string %
email& +
)+ ,
{ 	
this 
. 
Identity 
= 
new 
GenericIdentity  /
(/ 0
email0 5
)5 6
;6 7
} 	
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
IEnumerable 
< 
string !
>! "
Permissions# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} ÷
zC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Models\CustomPrincipalModel.cs
	namespace 	
SecuredPersistence
 
. 
Models #
{ 
public 

class  
CustomPrincipalModel %
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public

 
IEnumerable

 
<

 
string

 !
>

! "
Permissions

# .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
} 
} ©
vC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Models\ICustomPrincipal.cs
	namespace 	
SecuredPersistence
 
. 
Models #
{ 
	interface 
ICustomPrincipal 
:  

IPrincipal! +
{ 
int 
Id 
{ 
get 
; 
set 
; 
} 
string		 
Name		 
{		 
get		 
;		 
set		 
;		 
}		  !
IEnumerable

 
<

 
string

 
>

 
Permissions

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
} 
} °
vC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str -
)- .
]. /
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
$str /
)/ 0
]0 1
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
["" 
assembly"" 	
:""	 

AssemblyVersion"" 
("" 
$str"" $
)""$ %
]""% &
[## 
assembly## 	
:##	 

AssemblyFileVersion## 
(## 
$str## (
)##( )
]##) *≠	
sC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\SecuredPersistance\Services\UserSession.cs
	namespace 	
SecuredPersistence
 
. 
Services %
{ 
internal 
class 
UserSession 
:  
IUserSession! -
{		 
public

 
int

 
?

 
Id

 
=>

 
(

 
HttpContext

 &
.

& '
Current

' .
.

. /
User

/ 3
as

4 6
CustomPrincipal

7 F
)

F G
?

G H
.

H I
Id

I K
;

K L
public 
IEnumerable 
< 
string !
>! "
Permissions# .
=>/ 1
(2 3
HttpContext3 >
.> ?
Current? F
.F G
UserG K
asL N
CustomPrincipalO ^
)^ _
?_ `
.` a
Permissionsa l
??m o
newp s
Listt x
<x y
stringy 
>	 Ä
(
Ä Å
)
Å Ç
;
Ç É
} 
} 