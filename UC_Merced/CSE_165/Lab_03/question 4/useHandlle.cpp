#include "handle.h"
#include "handle.cpp"

int main() {
    Handle u;
    u.initialize();
    u.read();
    u.change(1);
    u.cleanup();
}
