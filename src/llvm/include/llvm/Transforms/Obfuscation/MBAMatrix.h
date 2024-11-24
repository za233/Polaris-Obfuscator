#include <algorithm>
#include <cstdint>
#include <map>
#include <vector>
namespace polaris {
class MBAMatrix {
private:
  int Line, Column;
  std::vector<std::vector<int64_t>> Elements;
  int64_t gcd(int64_t A, int64_t B) { return B == 0 ? A : gcd(B, A % B); }
  int64_t lcm(int64_t A, int64_t B) { return A * B / gcd(A, B); }
  void simplify();
  void gaussian();
  void sortLine();
  int getLineFirstNonZero(int LineIdx);
  void lineElimate(int Dst, int Src, int ColumnIdx);
  void calcLine(int64_t Factor1, int Dst, int64_t Factor2, int Src, bool IsAdd);

public:
  MBAMatrix(int Line, int Column) : Line(Line), Column(Column) {
    for (int i = 0; i < Line; i++) {
      std::vector<int64_t> LineNums;
      for (int j = 0; j < Column; j++) {
        LineNums.push_back(0);
      }
      Elements.push_back(LineNums);
    }
  }
  void fromArray(int64_t *Arr);
  int64_t getElement(int X, int Y);
  void setElement(int X, int Y, int64_t Val);

  int getRank();
  void solve(std::vector<int64_t> &Solution);
};
} // namespace polaris