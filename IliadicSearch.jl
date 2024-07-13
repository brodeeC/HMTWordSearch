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

# Define route to serve index.html
route("/search", method = GET) do
    html_content = read(joinpath(@__DIR__, "..", "frontend", "assets", "index.html"), String)
    return html_content
end

# Define the search route
route("/search", method = POST) do
    #req = Genie.Requests.request()
    #body = String(req.body)
    #payload = JSON.parse(body)
    #term = payload["term"]
    determ = Genie.Requests.request()[:params]["term"]
    term = unescapeuri(determ)
    results = search_ancient_greek(term)
    return HTTP.Response(200, JSON.json(results))
    
end

# Export the router
export router

end # module
