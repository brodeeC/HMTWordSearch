### To start the server, open a Julia REPL and enter "include("start_server.jl")"

### To access, navigate to http://localhost:8000 in browser



using Genie
include("config/routes.jl")
Genie.AppServer.startup(port=8000)
