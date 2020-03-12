#include <server.h>
#include <myLib.h>

using namespace ucm;

int main(int argc, char** argv){

    CrowServer server(argc, argv);

    server.renderHTML("/", "index.html");

    server.route("/hello", [](const request& req, response& res){
        std::string phrase = sayHello();

        res.sendHTML(phrase);
    });

    server.route("/echo", [](const request& req, response& res){
        if (req.url_params.hasKey("word")){
            std::string word = req.url_params.get("word");

            std::string answer = echoWord(word);
        
            res.sendHTML(answer);
        } 
        else{
            res.sendError400();
        }
    });

    server.route("/superbowl", [](const request& req, response& res){
        json data = getSuperBowlScore();

        res.sendJSON(data);
    });

    server.route("/uppercase", [](const request& req, response& res){
        if (req.url_params.hasKey("word")){
            std::string word = req.url_params.get("word");

            std::string answer = upperCase(word);
        
            res.sendHTML(answer);
        } 
        else{
            res.sendError400();
        }
    });

    server.run();

}
