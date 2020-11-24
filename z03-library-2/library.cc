//
// Created by Hedzr Yeh on 2020/6/24.
//

#include "mucht/mucht.hh"
#include <iostream>

#include "the-compiler.h"

#if The_COMPILER_IS_AppleClang
#define COMPILER 1
#endif

#if The_COMPILER_IS_GNU
#define COMPILER 2
#endif

#if The_COMPILER_CXX_VARIADIC_TEMPLATES
template<int I, int... Is>
struct Interface;

template<int I>
struct Interface<I>
{
  static int accumulate()
  {
    return I;
  }
};

template<int I, int... Is>
struct Interface
{
  static int accumulate()
  {
    return I + Interface<Is...>::accumulate();
  }
};
#else
template<int I1, int I2 = 0, int I3 = 0, int I4 = 0>
struct Interface
{
    static int accumulate() { return I1 + I2 + I3 + I4; }
};
#endif


void hello(std::string const &name) {
    std::cout << "Hello, " << name << "!\n";
}
