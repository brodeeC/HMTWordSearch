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
end

src = hmt_cex()

hmt_releaseinfo(src)

diplomatictexts = hmt_diplomatic(src)


function countWord(text::SubString{String}, word::String)::Int
    # Convert the text to lowercase and split it into words by spaces
    words = split(lowercase(text), ' ')
    
    # Convert the word to lowercase
    target_word = lowercase(word)
    
    # Count the occurrences of the target word
    count = sum(w == target_word for w in words)
    
    return count
end




# Define the search function
function search_ancient_greek(term::String)
    i = 1
    results = 0
    urn = diplomatictexts.passages[i].urn.urn
    while i in 1:40485 
        if urn[lastindex(urn)] != "t"
            if urn[lastindex(urn)] != "e"
                if urn[lastindex(urn)] != "a"
        results += countWord(diplomatictexts.passages[i].text, term)
                end
            end
        end
        
        i += 1
    end
    return "Search results for $term"
end

# Define route to serve index.html
route("/", method = GET) do
    html_content = read(joinpath(@__DIR__, "..", "frontend", "assets", "index.html"), String)
    return html_content
end

# Define the search route
route("/search", method = GET) do
    #req = Genie.Requests.request()  # Qualify with Genie.Requests
    println(Genie.Requests.request())
    term = Genie.Requests.request()[:params]["term"]
    results = search_ancient_greek(term)
    return Genie.Renderer.Json.json(results)  # Qualify with Genie.Renderer.Json
end

# Export the router
export router

end # module
