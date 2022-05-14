#include "pStash.h"
#include <iostream>
#include <cstring>
using namespace std;

int PStash::add(void* element) {
  const int inflateSize = 10;
  if (next >= num)
    inflate(inflateSize);
  storage[next++] = element;
  return(next - 1);
}

PStash::~PStash() {
  delete[]storage;
}

void* PStash::operator[](int index) const {
  if (index >= next) {
    return 0;
  }

  return storage[index];
}

void* PStash::remove(int index) {
  void* v = operator[](index);
  if (v != 0) storage[index] = 0;
  return v;
}

void PStash::inflate(int increase) {
  const int psz = sizeof(void*);
  void** st = new void* [num + increase];
  memset(st, 0, (num + increase) * psz);
  memcpy(st, storage, num * psz);
  num += increase;
  delete[] storage;
  storage = st;
}
