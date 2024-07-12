module IliadicSearch

using Genie, Genie.Router, Genie.Render

# Define the search function
function search_ancient_greek(term::String)
    # Dummy search function: replace with your actual search logic
    results = ["Result 1 for $term", "Result 2 for $term"]
    return results
end

# Define the route
route("/search") do
    term = Genie.Requests.queryparams()[:term]
    search_results = search_ancient_greek(term)
    Genie.Render.json(search_results)
end

end # module
