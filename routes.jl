# This file should include any additional routes

using Genie.Router

# Include your module
include("../src/IliadicSearch.jl")

# Export routes defined in your module
export IliadicSearch

# Exporting the router from your module allows Genie to use the routes defined in IliadicSearch.jl
