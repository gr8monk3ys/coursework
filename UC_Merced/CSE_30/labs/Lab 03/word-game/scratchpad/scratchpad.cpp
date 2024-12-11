#include <iostream>
#include <myLib.h>


int main(){
	std::string test = "ABCDEFGHI";
	std::vector<std::string> ps = powerset(test);
	std::vector<std::string> result;

    std::cout << "Substring Permutations ";
    for (std::string item : ps){
        if(item.size() > 0){
			std::vector<std::string> curr;
			permute(item, 0, item.size()-1, curr);

			for (int i = 0; i < curr.size(); i++){
				result.push_back(curr[i]);
			}
		} 
    } 

	std::cout << "(" << result.size() << ")" << std::endl << std::endl;

	// for (int i = 0; i < result.size(); i++){
	// 	std::cout << result[i] << std::endl;
	// }
	return 0;
}
