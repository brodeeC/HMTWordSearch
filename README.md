# HMTWordSearch

## Make search more defined, but with options
1. User select between a list(?) of options
    a. Search with or without CASE endings
        I. Chop CASE off of word and perform the search while only looking at the word without the CASE
    b. Do we want to have a search that compares accents too?
    c. Titles/Lemma/Commentary
2. How do we want to handle invalid input
3. Design it so the pluto notebook inputs the word and it outputs into an HTML file.

07/11
- added a function to check the similarity between words given a threshold percentage.
- started creating functions to strengthen our search and give the user more of an opportunity to refine the search.

07/12
- Added Genie functionality to my Mac, as of right now I'm not sure I'll be able to connect it to the GitHub, I'm sure there's a way, we may have to create a new repo in order to put the new files in there. 
- Created Framework.html - it's the basics of the search bar, we'll want to potentially add colors, change fonts, what have you.
- Because of Genie, I have the files that will implement the code into HTML, we can keep working on it in the repo and I'll copy/paste it over to the Genie files. When we meet again I'll show you everything and we'll figure out how to setup the GitHub so you can access the files as well.
- We can still go with the user checking boxes to decide the search, or we can do every search and add a filter box and the user can decide what they want to see.

- [Link to chat with ChatGPT to set up Genie](https://chatgpt.com/share/44bb1118-f5d7-42be-ba6b-3813b28d85f4)
- The very last part of the chat is the tutorial and setup I used to use Genie on my Mac
    Note: I did change "AncientGreekSearch" to "IliadicSearch" in all instances
- Once you get to the part where you're creating files you'll need to open up the folder in Visual Studio Code
    1. Two finger click on the VSCode Icon and open a new window
    2. Hit the open option to bring up finder
    3. Find the IliadicSearch folder and open it
    4. Now you'll need to either import the files I added to the github, or copy paste the chat into the files you create
- Now you should have it structured the same way I do
- We'll still use this file for now and make the same changes to the same files we edit on our own versions

07/13
- I'm still working on getting the interface between Julia and HTML set up, it's very odd
- That took a while, but the html and Julia finally got along and the webpage works, now we just need our search functions... I think anyways, the results aren't displaying, it says they're undefined so we'll see what happens.
- okay so now the pages load, the result is in there, now all we need to do is finish making it more appealing to use
- changed some colors, fonts, and the layout, it looks pretty good, want to edit a couple of things about it but overall I'm very happy with today's progress!

## Tutorial on running Julia from command line
1. Open command line (terminal)
2. Copy this command into the terminal and hit enter: export PATH="$PATH:/Applications/Julia-1.9.app/Contents/Resources/julia/bin"
3. Copy this command into the terminal and hit enter: source ~/.zshrc
4. Now you should be able to type `julia` into the terminal and julia should start

## Tutorial on how to setup and run Genie
1. Open cmd line and ensure you can start Julia from it. 
2. Exit out of julia if you started it, but don't close the command line.
3. Enter command: mkdir IliadicSearch
4. Enter command: cd IliadicSearch
5. mkdir -p src/public config
6. Now you should have a folder on your computer named Iliadic Search and it should have 2 folders in it: src and config, inside src should be the public folder. 
7. Now, open the IliadicSearch folder in VSCode.
8. Add in the appropriate files, here's what the structure should look like.

IliadicSearch
- config
    - routes.jl
- src
    - public
        - index.html
        - results.html
    - IliadicSearch.jl
- Manifest.toml
- Project.toml
- start_server.jl

9. Now that you have all the files and the appropriate structure, copy/past all the code from the corresponding files in this GitHub!
10. Now, back to the terminal, at the top of the window it should show that we are looking inside of the IliadicSearch folder.
11. Next, enter the command: julia -e 'using Pkg; Pkg.activate("."); Pkg.add("Genie")'
12. Now Julia should be running inside the IliadicSearch folder.
13. All that's left is to open the Genie Server!
14. Enter the command: include("start_server.jl")
    - This will only work if Julia is running inside the folder
15. Wait a moment and you should see WARNING: replacing module IliadicSearch.
    [ Info: Starting Genie server...
    ┌ Info: 
    └ Web Server starting at http://127.0.0.1:8000 - press Ctrl/Cmd+C to stop the server.
15a. Once you see this pop up the server is in business!
16. Finally, go to your web browser of choice and enter 127.0.0.1:8000 into the search bar!


### Notes for Sunday Meetup
- You are so amazing, like holy cow you made a full on working web page!!! T^T
- What if we added a link called "Something" that just links to a rick roll XD
- I am totally taking this seriously.
- What if the first link is a cat vid and then we add another link called "Something Else" thats the rick roll?
- [Something](https://www.youtube.com/watch?v=FEHSMnoHIXQ&pp=ygURY2F0IHZpZGVvcyBmdW5ueSA%3D)
- [Something Else](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
- Maybe we can add a link to the Lexicon? So people can look up the word and its many possible meanings?
- [Lexicon](http://folio2.furman.edu/lsj/index.html)
- 

### Another weekend that he says "do something"
- Add more search methods and display them in the results.
