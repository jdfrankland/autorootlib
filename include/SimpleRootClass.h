//Created by KVClassFactory on Thu May 16 19:32:00 2013
//Author: John Frankland,,,

#ifndef __SIMPLEROOTCLASS_H
#define __SIMPLEROOTCLASS_H

#include "TObject.h"

class SimpleRootClass : public TObject
{

   public:
   SimpleRootClass();
   SimpleRootClass(const SimpleRootClass& obj);
   virtual ~SimpleRootClass();
   void Copy(TObject& obj) const;

   ClassDef(SimpleRootClass,1)//A simple class based on ROOT
};

#ifdef __MAKECINT__
#pragma link off all classes;
#pragma link C++ class SimpleRootClass+;
#endif
#endif
