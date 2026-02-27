#include <myLib.h>
using namespace std;


std::string sayHello(){
    return "Hello World";
}

std::string echoWord(std::string word){
    reverse(word.begin(), word.end());
    return word;
}

ucm::json getSuperBowlScore(){
        ucm::json data;      
          
        data["home_team"] = "New England Patriots";
        data["home_score"] = 13;
        data["away_team"] = "Los Angeles Rams";
        data["away_score"] = 3;

        return data;
}

std::string upperCase(std::string word) {
    std::string upperWord = word;

    transform(upperWord.begin(), upperWord.end(), upperWord.begin(), :: toupper);

    if(word == upperWord){
        transform(word.begin(), word.end(), word.begin(), :: tolower);
    }

    return "Uppercase[" + upperWord + "] : Lowercase[" + word + "]";
}

