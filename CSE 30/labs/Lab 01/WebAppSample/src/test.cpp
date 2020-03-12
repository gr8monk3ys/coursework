#include <igloo/igloo.h>

#include "myLib.h"

using namespace igloo;


Context(AdderFunction) {

	Spec(SimpleTest) {
		Assert::That(add(3, 5), Equals(8));
	}

	Spec(NegativeNumbers) {
		Assert::That(add(-5, -2), Equals(-7));
	} 

	Spec(PositiveAndNegative) {
		Assert::That(add(-4, 3), Equals(-1));
	}
};

int main() {
	// Run all the tests defined above
	return TestRunner::RunAllTests();
}
