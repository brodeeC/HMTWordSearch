md""" I really hope this works."""

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
end

src = hmt_cex()

hmt_releaseinfo(src)

textcatalog = hmt_textcatalog(src)

diplomatictexts = hmt_diplomatic(src)

normalizedtexts = hmt_normalized(src)

function stripAndLowerCase(str)
	smg = Unicode.normalize(str, stripmark = true)
	lowercase(smg)
end

function countWord(text::SubString{String}, word::String)::Int
    # Convert the text to lowercase and split it into words by spaces
    words = split(lowercase(text), ' ')
    
    # Convert the word to lowercase
    target_word = lowercase(word)
    
    # Count the occurrences of the target word
    count = sum(w == target_word for w in words)
    
    return count
end

text = normalizedtexts

function loopOcc(word)
	i = 1
	boop = 0
	urn = diplomatictexts.passages[i].urn.urn
	while i in 1:40485 
		if urn[lastindex(urn)] != "t"
			if urn[lastindex(urn)] != "e"
				if urn[lastindex(urn)] != "a"
		boop += countWord(diplomatictexts.passages[i].text, word)
				end
			end
		end
		
		i += 1
	end
	return boop
end



word = "Ἀγαμέμνων"

loopOcc(word)


# We may have to "unlock" threshold and be able to change it when we call this method to adjust based on the length of the word.
# Function to find matches with 90% or greater similarity
function doesMatch(database::String, target::String, threshold::Float64=0.8)
    metric = DamerauLevenshtein()
    for word in database
        distance = evaluate(metric, word, target)
        max_length = max(length(word), length(target))
        similarity = 1 - distance / max_length
        if similarity >= threshold
            return false
        end
    end
    return true
end