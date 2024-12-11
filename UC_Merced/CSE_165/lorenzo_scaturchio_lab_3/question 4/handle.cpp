#include "Handle.h"
#include "require.h"

struct Handle::Cheshire {
    int i;
};

Handle::Handle() {
    printf("Contructor called.\n");
}

void Handle::initialize() {
    smile = new Cheshire;
    smile->i = 0;
}

void Handle::cleanup() {
    delete smile;
}

int Handle::read() {
    return smile->i;
}

void Handle::change(int x) {
    smile->i = x;
}

Handle::~Handle() {
    printf("Object was destroyed by destructor\n");
}
