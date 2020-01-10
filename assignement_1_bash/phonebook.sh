#!/bin/bash 
clc ;
clear; 
if [ ! -f .phonebookDB.txt ] ;
then 
   touch .phonebookDB.txt;
fi 
file=.phonebookDB.txt;
case $1 in
-i)

read -p "Please Enter The Name : " Name 
read -p "Please Enter The Number :" Number


echo  $Name:$Number >> .phonebookDB.txt ;;

-v)
echo "All content : ";

cat  .phonebookDB.txt;;

-s)
   
read -p "Please Enter The Search Name :" un
 
cmd=$(grep -ci -w "$un" $file)

if [ "$cmd" != "0" ]; then

   Num=$(grep "$un" .phonebookDB.txt | cut -d':' -f2)
   echo ''
   echo "The phone number of $un is $Num ."
else
        echo "Name does not exist."
fi
;;

-e)
  > .phonebookDB.txt ;;

-d)

read -p "Please Enter The Search Name :" un
 
cmd=$(grep -ci -w "$un" $file)

if [ "$cmd" != "0" ]; then

sed -i -e "/$un/d" ./.phonebookDB.txt

else
        echo "Name does not exist."
fi
;;

*)

echo  "Insert new contact name and number, with the option "-i" "
echo  "View all saved contacts details, with the option "-v""
echo  "Search by contact name, with the option "-s""
echo  "Delete all records, with "-e"" 
echo  "Delete only one contact name, with "-d""


esac
