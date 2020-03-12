#include <crow/crow_all.h>

#include <iostream>
#include <sstream>
#include <string>
#include <fstream>
#include <myLib.h>
#include <vector>
#include <unordered_map>
#include <algorithm>

#include <boost/filesystem.hpp>

struct StaticAsset{
    std::string filename;
    std::string filetype;

    StaticAsset(std::string name, std::string type){
        filename = name;
        filetype = type;
    }
};

std::string getData(std::string filename){
    std::ifstream inFile;
    inFile.open(filename);

    std::stringstream strStream;
    strStream << inFile.rdbuf();
    std::string str = strStream.str();

    return str;
}

void tokenize(std::string const &str, const char delim,
			std::vector<std::string> &out)
{
	size_t start;
	size_t end = 0;

	while ((start = str.find_first_not_of(delim, end)) != std::string::npos)
	{
		end = str.find(delim, start);
		out.push_back(str.substr(start, end - start));
	}
}

void serveStatic(crow::SimpleApp& app, std::string static_dir){
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

        app.route_dynamic(dyn_route)
        ([=](const crow::request&, crow::response& res){
            std::string data = getData(static_dir + "/" +filename);

            res.add_header("Access-Control-Allow-Origin", "*");
            res.add_header("Content-Type", filetype);
            res.write(data);
            res.end();
        });
    }
}

void strip(std::string& str){
    char chars[] = " ";

   for (unsigned int i = 0; i < strlen(chars); ++i)
   {
      str.erase (std::remove(str.begin(), str.end(), chars[i]), str.end());
   }

   if (*(str.end()-1) == '/'){
       str.erase(str.end()-1);
   }
}

int main(int argc, char** argv){

    std::string templates_dir;
    std::string static_dir;

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

    std::cout << "Templates: " << templates_dir << std::endl;
    std::cout << "Static: " << static_dir << std::endl;

    crow::SimpleApp app;

    serveStatic(app, static_dir);

    CROW_ROUTE(app, "/")
        ([=](const crow::request& req, crow::response& res){

            std::string html = getData(templates_dir + "/index.html");
            
            res.add_header("Access-Control-Allow-Origin", "*");
            res.add_header("Content-Type", "text/html");
            res.write(html);
            res.end();
        });


    CROW_ROUTE(app,"/add/<int>/<int>")
        ([](const crow::request& req, crow::response& res, int a, int b){

            int result = add(a, b);
            
            res.add_header("Access-Control-Allow-Origin", "*");
            res.add_header("Content-Type", "text/html");
            res.write(std::to_string(result));
            res.end();
        });

            CROW_ROUTE(app,"/times/<int>/<int>")
        ([](const crow::request& req, crow::response& res, int a, int b){

            int result = times(a, b);
            
            res.add_header("Access-Control-Allow-Origin", "*");
            res.add_header("Content-Type", "text/html");
            res.write(std::to_string(result));
            res.end();
        });

    app.port(18080).multithreaded().run();
}
