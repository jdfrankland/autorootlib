//Created by KVClassFactory on Thu May 16 19:32:00 2013
//Author: John Frankland,,,

#ifndef __DerivedRootClass_H
#define __DerivedRootClass_H

#include "SimpleRootClass.h"

class DerivedRootClass : public SimpleRootClass
{

   public:
   DerivedRootClass();
   DerivedRootClass(const DerivedRootClass& obj);
   virtual ~DerivedRootClass();
   void Copy(TObject& obj) const;

   ClassDef(DerivedRootClass,1)//A derived class based on ROOT
};

#ifdef __MAKECINT__
#pragma link off all classes;
#pragma link C++ class DerivedRootClass+;
#endif
#endif
