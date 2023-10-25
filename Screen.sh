
######################################################### Screen Handling #########################################################

######################################################### tmux-based #########################################################
# creat new session 
tmux new -s session_name

# list session 
tmux ls

# reattach session 
tmux attach -t session_name

# kill session 
tmux kill-session -t session_name

# detach session 
CTRL + b then d #(hold ctrl, press b, let go of both of the keys, and press d)


######################################################### use windows under session ######################################################### 
# creat window 
ctrl + b then c #(hold ctrl, press b, let go of both of the keys, and press c)

# switch windows 
ctrl + direction key 

# dettach window
ctrl + b then d # only detach session is available 

# kill window
exit 


######################################################### screen-based #########################################################

#################### creat new screen ####################
screen -S name 

#################### list screen ####################
screen -ls

#################### reattach a detached screen ####################
screen -r name

#################### reattach a atttached screen ####################
screen -x

#################### detach screen ####################
ctrl+a d

#################### kill screen ####################
ctrl+a+shift+k

#################### Kill detached screen ####################
screen -X -S name quit
screen -XS name quit



screen -S ale 


screen -r ale

