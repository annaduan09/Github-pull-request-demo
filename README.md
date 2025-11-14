# Urban Tech Club Github Pull Request Workshop
November 14, 2025
Anna Duan


![Merge conflict vibes](https://github.com/annaduan09/Github-conflict-demo/blob/30794f50c655c91d7c05b2bed9a6432eb5646ee5/merge%20conflict.png)

In this demo, participants will learn the basics of using Github repositories for version control, and practice the following functions:  
- **Fork**   
- **Clone**  
- **Branch**   
- **Commit**   
- **Push**  
- **Merge**  

They will also get practice collaborating on repositories, including best practices for working simultaneously and resolving conflicts. Data for this activity comes from [OpenStreetMaps](https://wiki.openstreetmap.org/), which is the theme for today in the #30DayMapChallenge.

# Part 0: Setup 
1. Split up into 3 groups. Decide who will be group 1, 2, and 3 (this is important!).
2. From each group, nominate one person with RStudio and Github Desktop on their laptop as your group scribe.
3. Please do not mix up your group numbers, or work out of sequence. We need to do Part 1, Part 2, and Part 3 in sequence for this to work.

# Part 1: Using Github repositories  
## Group 1  
1. **Fork** this repo. 
2. Invite Group 2 and Group 3's scribe as a collaborater. 

# Part 2: Creating branches  
## Group 1 
1. Open a branch, name it "fix-map-typos"
2. Find and fix the typos in lines 36-39 of the ggplot2 map
3. Go to Github Desktop to **commit** and **push** your changes when satisfied.

## Group 2
1. Open a branch from Group 1's repo, name it "adjust-theme-and-colors". 
2. Change the map's theme in line 46 to theme_minimal() and feel free to modify the map text colors in lines 50, 55, and 63.
3. Go to Github Desktop to **commit** and **push** your changes when satisfied.

## Group 3
1. Open a branch from Group 1's repo, name it "map-export-dimensions".
2. Modify the ggsave command in line 77 to export the map without distorting or cropping the map. Feel free to play with the dimensions as well as aspect ratio to make the map most visually appealing. Also give the map a descriptive file name.
3. When satisfied, export the map file to the repo.
4. Go to Github Desktop to **commit** and **push** your changes (making sure to include the new jpeg file) when satisfied.

# Part 3: Pull requests and merging  
1. Everybody goes to Github web and opens a pull request *against main*. Add a brief description of what you did.
2. Review time: group 1 reviews 2, 2 reviews 3, 3 reviews 1. Add a nice comment for your friend's work!  
3. Groups merge your own changes if no conflicts arise.
4. Admire our new map!
