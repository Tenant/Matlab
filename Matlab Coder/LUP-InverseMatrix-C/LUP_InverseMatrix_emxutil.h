/*
 * File: LUP_InverseMatrix_emxutil.h
 *
 * MATLAB Coder version            : 3.2
 * C/C++ source code generated on  : 11-Apr-2018 19:36:21
 */

#ifndef LUP_INVERSEMATRIX_EMXUTIL_H
#define LUP_INVERSEMATRIX_EMXUTIL_H

/* Include Files */
#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "LUP_InverseMatrix_types.h"

/* Function Declarations */
extern void emxEnsureCapacity(emxArray__common *emxArray, int oldNumel, int
  elementSize);
extern void emxFree_real_T(emxArray_real_T **pEmxArray);
extern void emxInit_real_T(emxArray_real_T **pEmxArray, int numDimensions);
extern void emxInit_real_T1(emxArray_real_T **pEmxArray, int numDimensions);

#endif

/*
 * File trailer for LUP_InverseMatrix_emxutil.h
 *
 * [EOF]
 */
