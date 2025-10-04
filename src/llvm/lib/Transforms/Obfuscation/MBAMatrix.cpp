#include "llvm/Transforms/Obfuscation/MBAMatrix.h"
#include <algorithm>
#include <cstdint>
#include <map>
#include <vector>
namespace polaris {
void MBAMatrix::simplify() {
  for (int i = 0; i < Line; i++) {
    int64_t Gcd = 0;
    for (int j = 0; j < Column; j++) {
      int64_t Val = abs(getElement(i, j));
      if (Val == 0) {
        continue;
      }
      if (Gcd == 0) {
        Gcd = Val;
      } else {
        Gcd = gcd(Val, Gcd);
      }
    }
    if (Gcd != 0 && Gcd != 1) {
      for (int j = 0; j < Column; j++) {
        setElement(i, j, getElement(i, j) / Gcd);
      }
    }
  }
}
int MBAMatrix::getLineFirstNonZero(int LineIdx) {
  for (int i = 0; i < Column; i++) {
    if (getElement(LineIdx, i) != 0) {
      return i;
    }
  }
  return Column;
}
void MBAMatrix::sortLine() {
  std::vector<uint64_t> Tbl;
  MBAMatrix TempMat(Line, Column);
  for (int i = 0; i < Line; i++) {
    for (int j = 0; j < Column; j++) {
      TempMat.setElement(i, j, getElement(i, j));
    }
  }
  for (int i = 0; i < Line; i++) {
    Tbl.push_back(i);
  }

  for (int i = 0; i < Line - 1; i++) {
    for (int j = 0; j < Line - i - 1; j++) {
      if (getLineFirstNonZero(Tbl[j]) > getLineFirstNonZero(Tbl[j + 1])) {
        uint64_t Tmp;
        Tmp = Tbl[j];
        Tbl[j] = Tbl[j + 1];
        Tbl[j + 1] = Tmp;
      }
    }
  }
  for (int i = 0; i < Line; i++) {
    for (int j = 0; j < Column; j++) {
      setElement(i, j, TempMat.getElement(Tbl[i], j));
    }
  }
}
void MBAMatrix::calcLine(int64_t Factor1, int Dst, int64_t Factor2, int Src,
                         bool IsAdd) {
  for (int i = 0; i < Column; i++) {
    int64_t Val = getElement(Dst, i) * Factor1;
    if (!IsAdd) {
      Val -= getElement(Src, i) * Factor2;
    } else {
      Val += getElement(Src, i) * Factor2;
    }
    setElement(Dst, i, Val);
  }
}
void MBAMatrix::lineElimate(int Dst, int Src, int ColumnIdx) {
  int64_t A = getElement(Dst, ColumnIdx), B = getElement(Src, ColumnIdx);
  if (A == 0 || B == 0) {
    return;
  }
  bool IsAdd = (A > 0) ^ (B > 0);
  int64_t FactorA = lcm(abs(A), abs(B)) / abs(A),
          FactorB = lcm(abs(A), abs(B)) / abs(B);
  calcLine(FactorA, Dst, FactorB, Src, IsAdd);
}
void MBAMatrix::gaussian() {
  sortLine();
  for (int i = 0; i < Line; i++) {
    sortLine();
    int Start = getLineFirstNonZero(i);
    if (Start == Column) {
      break;
    }
    for (int j = i + 1; j < Line; j++) {
      lineElimate(j, i, Start);
    }
    simplify();
    sortLine();
  }

  int Rank = getRank();
  for (int i = Rank - 1; i > 0; i--) {
    sortLine();
    int Z = getLineFirstNonZero(i);
    if (Z == Column) {
      break;
    }
    for (int j = i - 1; j >= 0; j--) {
      lineElimate(j, i, Z);
    }
    simplify();
    sortLine();
  }
  sortLine();
}

void MBAMatrix::setElement(int X, int Y, int64_t Val) {
  // assert(X < Line && Y < Column);
  Elements[X][Y] = Val;
}
int64_t MBAMatrix::getElement(int X, int Y) {
  // assert(X < Line && Y < Column);
  return Elements[X][Y];
}

void MBAMatrix::fromArray(int64_t *Arr) {
  for (int i = 0; i < Line; i++) {
    for (int j = 0; j < Column; j++) {
      setElement(i, j, Arr[i * Column + j]);
    }
  }
}
int MBAMatrix::getRank() {
  int Rank = 0;
  for (int i = 0; i < Line; i++) {
    if (getLineFirstNonZero(i) != Column) {
      Rank++;
    }
  }
  return Rank;
}
void MBAMatrix::solve(std::vector<int64_t> &Solution) {
  Solution.clear();
  for (int i = 0; i < Column; i++) {
    Solution.push_back(0);
  }
  gaussian();
  std::vector<int64_t> Result;
  std::vector<int> Vars;
  int Rank = getRank();
  for (int i = 0; i < Rank; i++) {
    Vars.push_back(getLineFirstNonZero(i));
  }
  std::map<int, int> FreeFactor;
  for (int i = Rank - 1; i >= 0; i--) {
    int VarIdx = getLineFirstNonZero(i);
    int64_t Factor = abs(getElement(i, VarIdx));
    // assert(Factor != 0);
    for (int j = VarIdx + 1; j < Column; j++) {
      int64_t Val = getElement(i, j);
      if (Val != 0) {
        if (FreeFactor.find(j) == FreeFactor.end()) {
          FreeFactor[j] = Factor;
        } else {
          FreeFactor[j] = lcm(FreeFactor[j], Factor);
        }
      }
    }
  }
  for (auto Iter = FreeFactor.begin(); Iter != FreeFactor.end(); Iter++) {
    Solution[Iter->first] = (rand() % 200 + 1) * Iter->second;
  }
  for (int i = Rank - 1; i >= 0; i--) {
    int VarIdx = getLineFirstNonZero(i);
    int64_t Num = 0;
    for (int j = VarIdx + 1; j < Column; j++) {
      int C = getElement(i, j);
      if (C != 0) {
        Num += C * Solution[j];
      }
    }
    // assert(Num % getElement(i, VarIdx) == 0);
    Num /= getElement(i, VarIdx);
    Solution[VarIdx] = -Num;
  }
}
} // namespace polaris
