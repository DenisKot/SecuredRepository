”
[C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\BaseEntity.cs
	namespace 	
Core
 
{ 
public 

abstract 
class 

BaseEntity $
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
}		 
}

 û
`C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\Domain\Employee.cs
	namespace 	
Core
 
. 
Domain 
{ 
public 

class 
Employee 
: 

BaseEntity &
{ 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 

SecondName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}		 è
bC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\Domain\Permission.cs
	namespace 	
Core
 
. 
Domain 
{ 
public 

class 

Permission 
: 

BaseEntity (
{ 
public 
virtual 
User 
User  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 Ê
\C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\Domain\User.cs
	namespace 	
Core
 
. 
Domain 
{ 
public 

class 
User 
: 

BaseEntity "
{ 
public 
User 
( 
) 
{ 	
this		 
.		 
Permissions		 
=		 
new		 "
HashSet		# *
<		* +

Permission		+ 5
>		5 6
(		6 7
)		7 8
;		8 9
}

 	
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
ICollection 
< 

Permission %
>% &
Permissions' 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} ÿ
\C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\IRepository.cs
	namespace 	
Core
 
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where		 
TEntity		 
:		 

BaseEntity		 "
{

 
IEnumerable 
< 
TEntity 
> 
Get  
(  !

Expression 
< 
Func 
< 
TEntity #
,# $
bool% )
>) *
>* +
filter, 2
=3 4
null5 9
,9 :
Func 
< 

IQueryable 
< 
TEntity #
># $
,$ %
IOrderedQueryable& 7
<7 8
TEntity8 ?
>? @
>@ A
orderByB I
=J K
nullL P
,P Q
string 
includeProperties $
=% &
$str' )
)) *
;* +
TEntity 
GetById 
( 
object 
id !
)! "
;" #
void 
Insert 
( 
TEntity 
entity "
)" #
;# $
void 
Delete 
( 
object 
id 
) 
; 
void 
Delete 
( 
TEntity 
entityToDelete *
)* +
;+ ,
void 
Update 
( 
TEntity 
entityToUpdate *
)* +
;+ ,
} 
} Î
\C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\IUnitOfWork.cs
	namespace 	
Core
 
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
void 
BeginTransaction 
( 
) 
;  
void		 
EndTransaction		 
(		 
)		 
;		 
void

 
Rollback

 
(

 
)

 
;

 
void 
SaveChanges 
( 
) 
; 
Task 
SaveChangesAsync 
( 
) 
;  
} 
} ì
]C:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\IUserSession.cs
	namespace 	
Core
 
{ 
public 

	interface 
IUserSession !
{ 
int 
? 
Id 
{ 
get 
; 
} 
IEnumerable 
< 
string 
> 
Permissions '
{( )
get* -
;- .
}/ 0
}		 
}

 ì
hC:\Users\dkote\Documents\Project\SecuredRepository\SecuredRepository\src\Core\Properties\AssemblyInfo.cs
[ 
assembly 	
:	 

AssemblyTitle 
( 
$str 
)  
]  !
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
$str !
)! "
]" #
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