md""" I really hope this works."""
begin
	using PlutoUI
	using CitableBase
	using CitableText
	using CitableCorpus
	using PolytonicGreek
	using Unicode
	using SplitApplyCombine
end
using HmtArchive, HmtArchive.Analysis

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