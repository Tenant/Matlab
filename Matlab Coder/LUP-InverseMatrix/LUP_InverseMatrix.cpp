//
// File: LUP_InverseMatrix.cpp
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 11-Apr-2018 13:35:38
//

// Include Files
#include "rt_nonfinite.h"
#include "LUP_InverseMatrix.h"
#include "LUP_InverseMatrix_emxutil.h"
#include "eye.h"

// Function Definitions

//
// function A_=LUP_InverseMatrix(A)
//
//  ����LUP�ֽ�Ծ�������
//  �㷨����ʱ�临�Ӷ�Ϊn^3
// Arguments    : const emxArray_real_T *A
//                emxArray_real_T *A_
// Return Type  : void
//
void LUP_InverseMatrix(const emxArray_real_T *A, emxArray_real_T *A_)
{
  emxArray_real_T *E;
  emxArray_real_T *b_A;
  int i0;
  int k_;
  emxArray_real_T *L;
  emxArray_real_T *U;
  int N;
  emxArray_real_T *P;
  unsigned int unnamed_idx_1;
  int k;
  int ii;
  double delta1;
  int jj;
  emxArray_real_T *r0;
  emxArray_real_T *y;
  int i1;
  unsigned int b_jj;
  double c_jj;
  emxInit_real_T(&E, 2);
  emxInit_real_T(&b_A, 2);
  eye((double)A->size[0], E);
  i0 = b_A->size[0] * b_A->size[1];
  b_A->size[0] = A->size[0];
  b_A->size[1] = A->size[1];
  emxEnsureCapacity((emxArray__common *)b_A, i0, (int)sizeof(double));
  k_ = A->size[0] * A->size[1];
  for (i0 = 0; i0 < k_; i0++) {
    b_A->data[i0] = A->data[i0];
  }

  emxInit_real_T(&L, 2);
  emxInit_real_T(&U, 2);

  //  function [L, U, P]=LUP_DECOMPOSITION(A)
  //
  //  �����L, U,P����PA=LU, ����
  //  AΪ���������PΪ�û�����LΪ��λ�����Ǿ���UΪ�����Ǿ���
  //  �㷨����ʱ�临�Ӷ�Ϊn^3
  //  Ϊ�˱�֤�������ֵ�ȶ��ԣ��ݹ�ʱ��ÿ�о���ֵ����Ԫ���ƶ�����Ԫλ��
  //  Pͨ�������ʾ�û���������P(i)��ʾ�û������е�i�е�P(i)��Ԫ��Ϊ1����i������Ԫ��Ϊ0 
  N = A->size[0] - 1;
  eye((double)A->size[0], L);
  i0 = U->size[0] * U->size[1];
  U->size[0] = A->size[0];
  U->size[1] = A->size[0];
  emxEnsureCapacity((emxArray__common *)U, i0, (int)sizeof(double));
  k_ = A->size[0] * A->size[0];
  for (i0 = 0; i0 < k_; i0++) {
    U->data[i0] = 0.0;
  }

  emxInit_real_T(&P, 2);
  unnamed_idx_1 = (unsigned int)A->size[0];
  i0 = P->size[0] * P->size[1];
  P->size[0] = 1;
  P->size[1] = (int)unnamed_idx_1;
  emxEnsureCapacity((emxArray__common *)P, i0, (int)sizeof(double));
  if (P->size[1] >= 1) {
    P->data[P->size[1] - 1] = A->size[0];
    if (P->size[1] >= 2) {
      P->data[0] = 1.0;
      if (P->size[1] >= 3) {
        delta1 = ((double)A->size[0] - 1.0) / ((double)P->size[1] - 1.0);
        i0 = P->size[1];
        for (k = 0; k <= i0 - 3; k++) {
          P->data[1 + k] = 1.0 + (1.0 + (double)k) * delta1;
        }
      }
    }
  }

  for (k = 0; k <= N; k++) {
    delta1 = 0.0;
    k_ = k;
    i0 = N - k;
    for (ii = 0; ii <= i0; ii++) {
      unnamed_idx_1 = ((unsigned int)k + ii) + 1U;
      if (std::abs(b_A->data[((int)unnamed_idx_1 + b_A->size[0] * k) - 1]) >
          delta1) {
        delta1 = std::abs(b_A->data[((int)unnamed_idx_1 + b_A->size[0] * k) - 1]);
        k_ = (int)unnamed_idx_1 - 1;
      }
    }

    delta1 = P->data[k];
    P->data[k] = P->data[k_];
    P->data[k_] = delta1;
    for (ii = 0; ii <= N; ii++) {
      delta1 = b_A->data[k + b_A->size[0] * ii];
      b_A->data[k + b_A->size[0] * ii] = b_A->data[k_ + b_A->size[0] * ii];
      b_A->data[k_ + b_A->size[0] * ii] = delta1;
    }

    i0 = N + (int)(1.0 - ((1.0 + (double)k) + 1.0));
    for (ii = 0; ii <= i0; ii++) {
      unnamed_idx_1 = ((unsigned int)k + ii) + 2U;
      b_A->data[((int)unnamed_idx_1 + b_A->size[0] * k) - 1] /= b_A->data[k +
        b_A->size[0] * k];
      i1 = N + (int)(1.0 - ((1.0 + (double)k) + 1.0));
      for (jj = 0; jj <= i1; jj++) {
        b_jj = ((unsigned int)k + jj) + 2U;
        b_A->data[((int)unnamed_idx_1 + b_A->size[0] * ((int)b_jj - 1)) - 1] -=
          b_A->data[((int)unnamed_idx_1 + b_A->size[0] * k) - 1] * b_A->data[k +
          b_A->size[0] * ((int)b_jj - 1)];
      }
    }
  }

  for (ii = 0; ii <= N; ii++) {
    for (jj = 0; jj <= N; jj++) {
      if (1 + ii > 1 + jj) {
        L->data[ii + L->size[0] * jj] = b_A->data[ii + b_A->size[0] * jj];
      } else {
        U->data[ii + U->size[0] * jj] = b_A->data[ii + b_A->size[0] * jj];
      }
    }
  }

  emxFree_real_T(&b_A);

  //  ������ɣ�����
  i0 = A_->size[0] * A_->size[1];
  A_->size[0] = A->size[0];
  A_->size[1] = A->size[0];
  emxEnsureCapacity((emxArray__common *)A_, i0, (int)sizeof(double));
  ii = 0;
  emxInit_real_T1(&r0, 1);
  emxInit_real_T1(&y, 1);
  while (ii <= A->size[0] - 1) {
    //  function x=LUP_SOLVE(L, U, P, b)
    //
    //  ͨ��LUP�ֽ�������Է�����Ax=b, ����AΪ���������
    //  �㷨����ʱ�临�Ӷ�Ϊn^2��������ֵ�ȶ���
    //  PA=LU, A=P^-1 *(LU)
    //  PΪ�û�����LΪ��λ�����Ǿ���UΪ�����Ǿ���
    //  Pͨ�������ʾ�û���������P(i)��ʾ�û������е�i�е�P(i)��Ԫ��Ϊ1����i������Ԫ��Ϊ0 
    i0 = E->size[0];
    k_ = E->size[0];
    i1 = y->size[0];
    y->size[0] = k_;
    emxEnsureCapacity((emxArray__common *)y, i1, (int)sizeof(double));
    for (i1 = 0; i1 < k_; i1++) {
      y->data[i1] = 0.0;
    }

    k_ = E->size[0];
    i1 = r0->size[0];
    r0->size[0] = k_;
    emxEnsureCapacity((emxArray__common *)r0, i1, (int)sizeof(double));
    for (i1 = 0; i1 < k_; i1++) {
      r0->data[i1] = 0.0;
    }

    //  ��֪P, L��b, �������y, ����Ly=Pb, Ux=y, ʱ�临�Ӷ�Ϊn^2
    y->data[0] = E->data[((int)P->data[0] + E->size[0] * ii) - 1];
    for (k_ = 1; k_ - 1 <= i0 - 2; k_++) {
      delta1 = 0.0;
      for (jj = 0; jj < k_; jj++) {
        delta1 += L->data[k_ + L->size[0] * jj] * y->data[jj];
      }

      y->data[k_] = E->data[((int)P->data[k_] + E->size[0] * ii) - 1] - delta1;
    }

    //  ��֪U��y���������x, ʱ�临�Ӷ�Ϊn^2
    i1 = E->size[0] - 1;
    N = E->size[0] - 1;
    k_ = E->size[0] - 1;
    k = E->size[0] - 1;
    r0->data[i1] = y->data[N] / U->data[k_ + U->size[0] * k];
    i1 = (int)((1.0 + (-1.0 - ((double)i0 - 1.0))) / -1.0);
    for (k_ = 0; k_ < i1; k_++) {
      k = (i0 - k_) - 2;
      delta1 = 0.0;
      N = (int)((double)i0 + (1.0 - ((double)(k + 1) + 1.0)));
      for (jj = 0; jj < N; jj++) {
        c_jj = ((double)(k + 1) + 1.0) + (double)jj;
        delta1 += U->data[k + U->size[0] * ((int)c_jj - 1)] * r0->data[(int)c_jj
          - 1];
      }

      r0->data[k] = (y->data[k] - delta1) / U->data[k + U->size[0] * k];
    }

    //  �������������x
    k_ = r0->size[0];
    for (i0 = 0; i0 < k_; i0++) {
      A_->data[i0 + A_->size[0] * ii] = r0->data[i0];
    }

    ii++;
  }

  emxFree_real_T(&y);
  emxFree_real_T(&r0);
  emxFree_real_T(&P);
  emxFree_real_T(&U);
  emxFree_real_T(&L);
  emxFree_real_T(&E);

  //  ������ɣ�����A_
}

//
// File trailer for LUP_InverseMatrix.cpp
//
// [EOF]
//
