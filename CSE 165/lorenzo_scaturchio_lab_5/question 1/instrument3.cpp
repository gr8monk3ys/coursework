#include <iostream>
using namespace std;
enum note { middleC, Csharp, Cflat };

class Instrument {
public:
    virtual void play(note) const {
        cout << "Instrument playing";
    }

    virtual void prepare() const {
        cout << "Instrument preparing";
    }
};

class Wind : public Instrument {
public:
    void play(note) const {
        cout << "Wind play";
    }
    void prepare() const {
        cout << "Wind prepare";
    }
};

void tune(Instrument& i) {
    i.prepare();
    i.play(middleC);
}

int main() {
    Wind flute;
    tune(flute);
}