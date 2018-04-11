//
// File: LUP_InverseMatrix_types.h
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 11-Apr-2018 13:35:38
//
#ifndef LUP_INVERSEMATRIX_TYPES_H
#define LUP_INVERSEMATRIX_TYPES_H

// Include Files
#include "rtwtypes.h"

// Type Definitions
#ifndef struct_emxArray__common
#define struct_emxArray__common

struct emxArray__common
{
  void *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

#endif                                 //struct_emxArray__common

#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  double *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

#endif                                 //struct_emxArray_real_T
#endif

//
// File trailer for LUP_InverseMatrix_types.h
//
// [EOF]
//
