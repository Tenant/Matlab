#include "rt_nonfinite.h"
#include "LUP_InverseMatrix.h"
#include "main.h"
#include "LUP_InverseMatrix_terminate.h"
#include "LUP_InverseMatrix_emxAPI.h"
#include "LUP_InverseMatrix_initialize.h"
#include <iostream>

using namespace std;

// Function Declarations
static double argInit_real_T();
static emxArray_real_T *c_argInit_UnboundedxUnbounded_r();
static void main_LUP_InverseMatrix();

// Function Definitions

//
// Arguments    : void
// Return Type  : double
//
static double argInit_real_T()
{
	return 0.0;
}

//
// Arguments    : void
// Return Type  : emxArray_real_T *
//
static emxArray_real_T *c_argInit_UnboundedxUnbounded_r()
{
  emxArray_real_T *result;
  static int iv0[3] = { 3, 3, 3 };

  int idx0;
  int idx1;

  // Set the size of the array.
  // Change this size to the value that the application requires.
  result = emxCreateND_real_T(3, *(int (*)[3])&iv0[0]);
  result->data[0] = 1;
  result->data[1] = 2;
  result->data[2] = 3;
  result->data[3] = 7;
  result->data[4] = 9;
  result->data[5] = 8;
  result->data[6] = 5;
  result->data[7] = 6;
  result->data[8] = 4;

  return result;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_LUP_InverseMatrix()
{
  emxArray_real_T *A_;
  emxArray_real_T *A;
  emxInitArray_real_T(&A_, 2);

  // Initialize function 'LUP_InverseMatrix' input arguments.
  // Initialize function input argument 'A'.
  A = c_argInit_UnboundedxUnbounded_r();

  // Call the entry-point 'LUP_InverseMatrix'.
  LUP_InverseMatrix(A, A_);
  for (int i = 0; i < A_->size[0U]; i++) {
	  for(int j = 0; j < A_->size[1U]; j++) {
		  cout << A_->data[i*A_->size[0] + j] << " ";
	  }
	  cout << "\b\n";
  }
  emxDestroyArray_real_T(A_);
  emxDestroyArray_real_T(A);
}

//
// Arguments    : int argc
//                const char * const argv[]
// Return Type  : int
//
int main(int, const char * const [])
{
  // Initialize the application.
  // You do not need to do this more than one time.
  LUP_InverseMatrix_initialize();

  // Invoke the entry-point functions.
  // You can call entry-point functions multiple times.
  main_LUP_InverseMatrix();

  // Terminate the application.
  // You do not need to do this more than one time.
  LUP_InverseMatrix_terminate();
  getchar();
  getchar();
  return 0;
}

