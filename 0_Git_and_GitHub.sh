####################################### Documents ########################################

# Create a repository on github (e.g. demo_pipeline), You will see a link once you do that successfully.
https://github.com/your_username/demo_pipeline.git

# For more details:
https://try.github.io/levels/1/challenges/1

# You can include a README.md file in your folder to show-off your project
https://guides.github.com/features/mastering-markdown/#what


##################################### Push to github #####################################

# cd to the folder holds your project codes on your computer
cd /Users/songweizhi/PycharmProjects/MetaCHIP2
cd /Users/songweizhi/PycharmProjects/songweizhi.github.io
cd /Users/songweizhi/PycharmProjects/Tax4Fun2_short_tutorial
cd /Users/songweizhi/Library/Mobile Documents/com~apple~CloudDocs/SoftwareCommands
git init
git add .
echo '.idea' >> .gitignore
git rm -r --cached .idea
git add .gitignore
git commit -m "-"

# MarkerMAG
git remote add MarkerMAG https://github.com/songweizhi/MarkerMAG.git
git push -f MarkerMAG master

# Sponge_Hologenome
git remote add Sponge_Hologenome https://github.com/songweizhi/Sponge_Hologenome.git
git push -u Sponge_Hologenome master

# TreeSAK
git remote add TreeSAK https://github.com/songweizhi/TreeSAK.git
git push -u TreeSAK master

# DateArTree
git remote add DateArTree https://github.com/songweizhi/DateArTree.git
git push -u DateArTree master

# MetaCHIP2
git remote add MetaCHIP2 https://github.com/songweizhi/MetaCHIP2.git
git push -u MetaCHIP2 master

# songweizhi.github.io
git remote add songweizhi.github.io https://github.com/songweizhi/songweizhi.github.io.git
git push -u songweizhi.github.io master

# SoftwareCommands
git remote add SoftwareCommands https://github.com/songweizhi/SoftwareCommands.git
git push -u SoftwareCommands master

####################################### Wiki pages #######################################

# Clones the wiki locally
git clone https://github.com/songweizhi/Katana_cmds.wiki.git

# edit locally and push
cd /Users/songweizhi/PycharmProjects/Katana_cmds/Katana_cmds.wiki
git add .
git commit -m -
git push


############################# Remove idea folder from github #############################

echo '.idea' >> .gitignore
git rm -r --cached .idea
git add .gitignore
git commit -m -
git push
