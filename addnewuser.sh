#!/bin/bash

# SCript to add new user; assign password, create a group, add the new user into the group and make the new user a sudoer

echo "Add new user name"

read name

sudo useradd $name

#Confirm if new user is successfuly added

echo "CHECK IF NAME IS IN THE PASSWD FILE BELOW"

sudo cat /etc/passwd | grep $name

#if new user name appears in the /etc/passwd folder

#then

echo "USER ADDED SUCCESSFULLY!"

echo "If truly successful, Input- username again"

read inputted_username

sudo passwd $inputted_username

echo "PASSWORD SET-UP IS COMPLETED"

# create a group
echo "NOW CREATE A NEW GROUP"
echo "input NEW GROUP NAME"

read groupname

sudo groupadd $groupname

# add new user to the newly created group

echo "NOW ADD NEW USER TO THE NEWLY CREATED GROUP"

echo "input user name again"

read username

sudo usermod -G  $groupname $username

echo "CONFIRM NEW USER IS ADDED TO GROUP"

sudo cat /etc/group | grep $username

echo "IS USERNAME AND GROUP DISPLAYED ABOVE: $username and $groupname?"

echo "if yes, INPUT USERNAME AGAIN to proceed to adding user into the SUDOERS' group"

read added_username

sudo echo "$added_username ALL = (ALL) NOPASSWD:ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$added_username"

#Confirm new user is successully added to the sudoers group

echo "HURRAY! JOB COMPLETED"

echo "NEW USER ADDITION TO SERVER, MANAGERS GROUP AND SUDOERS GROUP SUCCESSFULL"


#Author: Godswill Gozie Nsofor
