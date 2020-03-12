#include <server.h>
#include <myLib.h>

using namespace ucm;

int main(int argc, char** argv){

    CrowServer server(argc, argv);

    server.renderHTML("/", "index.html");

    server.route("/checkWord", [=](const request& req, response& res){
        if (req.url_params.hasKey("word")){
            std::string word = req.url_params.get("word");

            ucm::json answer = checkWord(word);
        
            res.sendJSON(answer);
        } 
        else{
            res.sendError400();
        }
    });

    server.route("/list", [](const request& req, response& res){
        ucm::json theList = getList();

        res.sendJSON(theList);
    });

    server.run();
}
