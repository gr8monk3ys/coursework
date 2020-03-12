#include <server.h>

#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include <unordered_map>
#include <algorithm>
#include <boost/filesystem.hpp>

using namespace ucm;

StaticAsset::StaticAsset(std::string name, std::string type){
	filename = name;
	filetype = type;
}

std::string CrowServer::getData(std::string filename){
	std::ifstream inFile;
	inFile.open(filename);

	std::stringstream strStream;
	strStream << inFile.rdbuf();
	std::string str = strStream.str();

	return str;
}

void CrowServer::tokenize(std::string const &str, const char delim, std::vector<std::string> &out) {
	size_t start;
	size_t end = 0;

	while ((start = str.find_first_not_of(delim, end)) != std::string::npos)
	{
		end = str.find(delim, start);
		out.push_back(str.substr(start, end - start));
	}
}

void CrowServer::serveStatic(std::string static_dir){
	namespace fs = boost::filesystem;

	fs::path full_path( fs::initial_path<fs::path>() );
	full_path = fs::system_complete( fs::path( static_dir ) );

	std::vector<StaticAsset>assets;

	if ( fs::exists( full_path ) ){
		fs::directory_iterator end_iter;
		for ( fs::directory_iterator dir_itr( full_path ); dir_itr != end_iter; ++dir_itr ){
			std::string name = (dir_itr->path().filename().string());
	
			const char delim = '.';

			std::vector<std::string> out;
			tokenize(name, delim, out);
			
			std::string ext = out[1];

			std::string type;

			if (ext == "ico"){
				type = "image/x-icon";
			}
			else if (ext == "js"){
				type = "application/javascript";
			}
			assets.push_back(StaticAsset(name, type));
		}

	}


	for (auto itr = assets.begin(); itr != assets.end(); itr++){
		std::string filename = (*itr).filename;
		std::string filetype = (*itr).filetype;

		std::string dyn_route_str = "/" + filename;
		char dyn_route[64];
		strncpy(dyn_route, dyn_route_str.c_str(), sizeof(dyn_route));
		dyn_route[sizeof(dyn_route) - 1] = 0;

		route_dynamic(dyn_route)//.methods("GET"_method)
		([=](const crow::request&, crow::response& res){
			std::string data = getData(static_dir + "/" +filename);

			res.add_header("Access-Control-Allow-Origin", "*");
			res.add_header("Content-Type", filetype);
			res.write(data);
			res.end();
		});
	}
}

void CrowServer::strip(std::string& str){
	char chars[] = " ";

	for (unsigned int i = 0; i < strlen(chars); ++i)
	{
		str.erase (std::remove(str.begin(), str.end(), chars[i]), str.end());
	}

	if (*(str.end()-1) == '/'){
		str.erase(str.end()-1);
	}
}

void CrowServer::setTemplatesAndStatic(int argc, char** argv){
	if (argc < 5){
		std::cout << "Usage: <executable> -t <templates_dir> -s <static_dir>" << std::endl;
		std::exit(1);
	}
	else{
		for (int i = 1; i < argc; i++){
			
			std::string curr = argv[i];
			
			if (curr == "-t"){
				if (i < argc - 1){
					templates_dir = argv[i+1];
					
				}
				else{
					std::cout << "Usage: <executable> -t <templates_dir> -s <static_dir>" << std::endl;
					std::exit(1);
				}
			}
			else if (curr == "-s"){
				if (i < argc - 1){
					static_dir = argv[i+1];
				}
				else{
					std::cout << "Usage: <executable> -t <templates_dir> -s <static_dir>" << std::endl;
					std::exit(1);
				}
			}
		}
	}

	strip(templates_dir);
	strip(static_dir);
}

CrowServer::CrowServer(int argc, char** argv){
	setTemplatesAndStatic(argc, argv);

	serveStatic(static_dir);
}


void CrowServer::run(int p){
	port(p).multithreaded().run();
}

void CrowServer::route(std::string dyn_route_str, const std::function< void(const crow::request&, crow::response& res) >& cb){
	
	char dyn_route[64];
	strncpy(dyn_route, dyn_route_str.c_str(), sizeof(dyn_route));
	dyn_route[sizeof(dyn_route) - 1] = 0;

	route_dynamic(dyn_route)(cb);
}

void CrowServer::renderHTML(std::string endpoint, std::string filename){

	route(endpoint, [=](const crow::request&, crow::response& res){
		std::string html = getData(templates_dir + "/" + filename);
		
		res.add_header("Access-Control-Allow-Origin", "*");
		res.add_header("Content-Type", "text/html");
		res.write(html);
		res.end();
	});
}
