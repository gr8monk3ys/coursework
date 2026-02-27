#ifndef MYLIB
#define MYLIB

#include <string>
#include <server.h>

ucm::json checkWord(std::string);

ucm::json getList();


std::vector<std::string> readWordsFile(std::string filename);
std::vector<std::string> powerset(std::string str);

void permute(std::string a, int l, int r, std::vector<std::string>& results);

#endif
