#ifndef PSTASH_H
#define PSTASH_H

class PStash {
  int num;
  int next;
  void** storage;
  void inflate(int increase);
public:
  PStash() : num(0), storage(0), next(0) {}
  ~PStash();
  int add(void* element);
  void* operator[](int index) const;
  void* remove(int index);
  
  int count() const { return next; }
};
#endif
