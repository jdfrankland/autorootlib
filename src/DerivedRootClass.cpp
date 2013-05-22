//Created by KVClassFactory on Thu May 16 19:32:00 2013
//Author: John Frankland,,,

#include "DerivedRootClass.h"

ClassImp(DerivedRootClass)

////////////////////////////////////////////////////////////////////////////////
// BEGIN_HTML <!--
/* -->
<h2>DerivedRootClass</h2>
<h4>A simple class based on ROOT</h4>
<!-- */
// --> END_HTML
////////////////////////////////////////////////////////////////////////////////

DerivedRootClass::DerivedRootClass()
{
   // Default constructor
}

//________________________________________________________________

DerivedRootClass::DerivedRootClass(const DerivedRootClass& obj) : SimpleRootClass()
{
   // Copy constructor
   // This ctor is used to make a copy of an existing object (for example
   // when a method returns an object), and it is always a good idea to
   // implement it.
   // If your class allocates memory in its constructor(s) then it is ESSENTIAL :-)

   obj.Copy(*this);
}

DerivedRootClass::~DerivedRootClass()
{
   // Destructor
}

//________________________________________________________________

void DerivedRootClass::Copy(TObject& obj) const
{
   // This method copies the current state of 'this' object into 'obj'
   // You should add here any member variables, for example:
   //    (supposing a member variable DerivedRootClass::fToto)
   //    CastedObj.fToto = fToto;
   // or
   //    CastedObj.SetToto( GetToto() );

   SimpleRootClass::Copy(obj);
   //DerivedRootClass& CastedObj = (DerivedRootClass&)obj;
}

