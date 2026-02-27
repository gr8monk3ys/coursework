#include <myLib.h>
#include <algorithm>

std::vector<std::string> readWordsFile(std::string filename){
    std::ifstream file(filename);
    std::string str; 

    std::vector<std::string> words;

    while (std::getline(file, str)){
        words.push_back(boost::to_upper_copy(str));
        
    }

    return words;
}

std::vector<std::string> dictionary;

std::unordered_map<std::string, bool> hashmap;

ucm::json checkWord(std::string word){

    ucm::json x;

    x["word"] = word;
    x["valid"] = false;

    auto got = hashmap.find(word);

    // This calls the hashmap and checks to see if the word exists in the list
    if(got != hashmap.end()){
        // It would be valid if got does not pass the end of the list
        x["valid"] = true;
        return x;
    } 
}

 ucm::json getList(){

    dictionary = readWordsFile("misc/english.txt");

    for(int i = 0; i < dictionary.size(); i++){
        hashmap.insert({dictionary[i], true});
    }

    ucm::json result;

    srand(time(NULL));

    // This is what I did to make the letters come out "good"

    int vowels[5] = {65, 69, 73, 79, 85};

    for(int i = 0; i < 9; i++){
        int r = rand() % 25 + 65;
        // This is to determine the frequency of every other letter
        if (rand() % 5 != 0){
            result.push_back(r);
        }      
        else {
            // This is to determine the frequency of the vowels
            result.push_back(vowels[rand() % sizeof(vowels)/sizeof(int)]);
        } 
     }

    return result;
 }

std::vector<std::string> powerset(std::string str){
    if (str.size() == 0){
        std::vector<std::string> result;
        result.push_back("");

        return result;
    }
    else{
        char head = str[0];
        std::string tail;
        tail = str.substr (1,std::string::npos);

        std::vector<std::string> res = powerset(tail);
        std::vector<std::string> ans = res;

        for (auto element : res){
            std::string temp = element;
            temp.insert(temp.begin(), head);
            ans.push_back(temp);
        }

        return ans;
    }
}

void permute(std::string a, int l, int r, std::vector<std::string>& results) {

    if (l == r)  {
        results.push_back(a);
    }  
    else {  
        for (int i = l; i <= r; i++) {   
            char temp = a[l];
            a[l] = a[i];
            a[i] = temp;
             
            permute(a, l+1, r, results);  

            temp = a[l];
            a[l] = a[i];
            a[i] = temp;  
        }  
    }  
}  


