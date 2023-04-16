#!/bin/sh
# show web page in a dialog with a next step action
# Uses Zenity, 
echo "WIP"
tosurl="https://oldangrysheep.github.io/Download/TOS.html"
PrivacyPolicyURL="https://oldangrysheep.github.io/Download/Privacy.html"
# Defining X AND Y screen size
Xaxis=$(  | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Yaxis=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
echo "$Xaxis"
echo "$Yaxis"
#Begining to Define Functions
Grid () {
	zenity --list --title="Thumbnails" --column="Image" --column="Thumbnail" \
	--text="Select an image:" \
	$(for i in *.jpg; do echo $i $(convert -thumbnail 100 $i - | base64); done) \
	--width="$Xaxis" --height="$Yaxis" | awk '{print $2}' | base64 -d | display -
}
TermsOfService () {
zenity --text-info --title="Terms Of Service" --html --url=$tosurl \
       --checkbox="I agree to the terms of service"
rc=$?
echo $rc
case $rc in
    0)
        Grid
    ;;
    1)
        echo "Closed"
    ;;
   -1)
        echo "An unexpected error has occurred."
    ;;
esac
}
PrivacyPolicy () {
zenity --text-info --title="Terms Of Service" --html --url=$PrivacyPolicyURLurl \
       --checkbox="I agree to the terms of service"
rc=$?
echo $rc
case $rc in
    0)
        Grid
    ;;
    1)
        echo "Closed"
    ;;
   -1)
        echo "An unexpected error has occurred."
    ;;
esac
}
