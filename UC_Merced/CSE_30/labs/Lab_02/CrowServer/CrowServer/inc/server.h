#ifndef UCMSERVER
#define UCMSERVER

#include <string>
#include <crow/crow_all.h>

namespace ucm {
    
struct StaticAsset{
    std::string filename;
    std::string filetype;

    StaticAsset(std::string name, std::string type);
};


class CrowServer : public crow::SimpleApp {

    std::string templates_dir;
    std::string static_dir;

    std::string getData(std::string filename);
    void tokenize(std::string const &str, const char delim, std::vector<std::string> &out);
    void serveStatic(std::string static_dir);
    void strip(std::string& str);
    void setTemplatesAndStatic(int argc, char** argv);

    CrowServer(){};

public:

    CrowServer(int argc, char** argv);

    void run(int p = 18080);

    void route(std::string dyn_route_str, const std::function< void(const crow::request&, crow::response& res) >& cb);

    void renderHTML(std::string endpoint, std::string filename);
};

typedef crow::json::wvalue json;
typedef crow::request request;
typedef crow::response response;

}

#endif
