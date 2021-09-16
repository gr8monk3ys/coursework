#include <iostream>
using namespace std;

int main()
{
    double radius;
    const double pi = 3.14;

    cout << "Type in a radius: ";
    cin >> radius;
    double area = (pi * (radius * radius));
    cout << "The area of the circle is: " << area << endl;
}
