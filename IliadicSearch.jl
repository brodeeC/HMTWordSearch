module IliadicSearch

begin
    using PlutoUI
    using CitableBase
    using CitableText
    using CitableCorpus
    using PolytonicGreek
    using Unicode
    using SplitApplyCombine
    using HmtArchive, HmtArchive.Analysis
    using StringDistances
    using Genie.Router
    using Genie.Renderer.Json
    using Genie.Requests
    using HTTP
    using HTTP.URIs
    using JSON
    using JSON3
end

src = hmt_cex()

hmt_releaseinfo(src)

diplomatictexts = hmt_diplomatic(src)


function countWord(text::SubString{String}, word::String)::Int
    words = split(lowercase(text), ' ')
    target_word = lowercase(word)
    count = sum(w == target_word for w in words)
    return count
end

function search_ancient_greek(term::String)
    results = 0
    for i in 1:length(diplomatictexts.passages)
        urn = diplomatictexts.passages[i].urn.urn
        if urn[lastindex(urn)] != 't' && urn[lastindex(urn)] != 'e' && urn[lastindex(urn)] != 'a'
            results += countWord(diplomatictexts.passages[i].text, term)
        end
    end
    return results
end




# Define the routes using the route macro correctly
route("/", method = GET) do
    try
        html_content = read(joinpath(@__DIR__, "public", "index.html"), String)  # Read the HTML file content
        return HTTP.Response(200, [("Content-Type", "text/html")], html_content)
    catch e
        return HTTP.Response(500, "Error rendering HTML view: $e")
    end
end

route("/results.html", method = GET) do
    try
        html_content = read(joinpath(@__DIR__, "public", "results.html"), String)
        return HTTP.Response(200, [("Content-Type", "text/html")], html_content)
    catch e
        return HTTP.Response(500, "Error rendering HTML view: $e")
    end
end



route("/search", method = POST) do
    try
        search_query = jsonpayload()["query"]
        
        if isempty(search_query)
            return HTTP.Response(400, "Search query cannot be empty")
        end
        
        results = search_ancient_greek(search_query)
        
        return HTTP.Response(200, [("Content-Type", "text/plain")], string(results))
    catch err
        @error "Error processing request: $err"
        return HTTP.Response(500, "Error processing request: $err")
    end
end


export router
end