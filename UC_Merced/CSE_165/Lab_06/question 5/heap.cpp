#include <cstdio>
#include <new>
#include <cstddef>
using namespace std;

class Heap {
public:
    Heap() {
        printf("Heap::Heap()\n");
    }
    ~Heap() {
        printf("Heap::~Heap()\n");
    }
    static void* operator new(size_t);
    static void operator delete(void*, size_t);
    static void* operator new[](size_t sz);
    static void operator delete[](void* p, size_t);
};

void* Heap::operator new(size_t size) {
    while (true) {
        void* block = ::operator new(size);

        if (block) {
            printf("new() allocating %lu bytes in %p\n", static_cast<unsigned long>(size), block);
            return block;
        }

        new_handler globalHandler = set_new_handler(0);
        set_new_handler(globalHandler);
    }
}

void Heap::operator delete(void* p, size_t size) {
    printf("delete() freeing %lu bytes in %p\n", static_cast<unsigned long>(size), p);
    ::operator delete(p);
}

void* Heap::operator new[](size_t size) {
    printf("new[]() calling new(%lu)\n", static_cast<unsigned long>(size));
    return operator new(size);
}

void Heap::operator delete[](void* p, size_t size) {
    printf("delete[]() calling delete(%p, %lu)\n",
        p, static_cast<unsigned long>(size));
    operator delete(p, size);
}

int main() {
    Heap* pointer = new Heap;
    Heap* pointerArray = new Heap[2];
    delete pointer;
    delete[] pointerArray;
}
