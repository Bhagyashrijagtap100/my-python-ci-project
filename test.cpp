#include <cassert>
#include <iostream>

int add(int a, int b) {
    return a + b;
}

int main() {
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
     assert(add(2, 1) == 0);

  
    std::cout << "All three tests passed ✅" << std::endl;
    return 0;
}
