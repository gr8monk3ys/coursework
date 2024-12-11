#ifndef HANDLE_H
#define HANDLE_H

class Handle {
    struct Cheshire;
    Cheshire* smile;
public:
    Handle();
    void initialize();
    void cleanup();
    int read();
    void change(int);
    ~Handle();
};
#endif