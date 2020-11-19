#!/bin/bash

rm feeder.opml || printf "feeder.opml is not in dir. It will be created later on"

unzip *.zip

#declare -a id_Array
id_Array=()
#printf "id_Array = "${id_Array[*]}

while IFS=  read -r line
do
	if [[ "$line" == *"accountId"* ]]; then
    	#echo "$line"
    	read -rasplitIFS<<< "$line"

    	for word in "${splitIFS[@]}"; do
			#echo $word
			if [[ "$word" != *"accountId"* ]]; then
				if [[ "$word" != ":" ]]; then
					prefix='"'
					suffix='",'
					splitted=${word#"$prefix"}
					splitted=${splitted%"$suffix"}
					#echo $word
					username=$(curl --silent -d 'input='$splitted -X POST https://tweeterid.com/ajax.php)
					#if [[ "&username" == "error" ]]; then
					#	#end all
					#fi

					printf "\n"$splitted": "$username
					
					id_Array+=$username
					#printf " "${id_Array[*]}		
				fi
			fi
		done
  	fi
done < data/following.js

#printf "\n\nArray:\n"
#printf ${id_Array[*]}
#printf "\n\n"

users=$(echo $id_Array | tr "@" "\n")


echo '<opml version="1.1">' >> feeder.opml
echo "<script>" >> feeder.opml
echo 'try { Object.defineProperty(screen, "availTop", { value: 0 }); } catch (e) {} try { Object.defineProperty(screen, "availLeft", { value: 0 }); } catch (e) {} try { Object.defineProperty(screen, "availWidth", { value: 1600 }); } catch (e) {} try { Object.defineProperty(screen, "availHeight", { value: 900 }); } catch (e) {} try { Object.defineProperty(screen, "colorDepth", { value: 24 }); } catch (e) {} try { Object.defineProperty(screen, "pixelDepth", { value: 24 }); } catch (e) {} try { Object.defineProperty(navigator, "hardwareConcurrency", { value: 8 }); } catch (e) {} try { Object.defineProperty(navigator, "appVersion", { value: "5.0 (X11)" }); } catch (e) {} try { Object.defineProperty(navigator, "doNotTrack", { value: "unspecified" }); } catch (e) {} try { window.screenY = 0 } catch (e) { } try { window.screenTop = 0 } catch (e) { } try { window.top.window.outerHeight = window.screen.height } catch (e) { } try { window.screenX = 0 } catch (e) { } try { window.screenLeft = 0 } catch (e) { } try { window.top.window.outerWidth = 800 } catch (e) { }' >> feeder.opml
echo "</script>" >> feeder.opml
echo "<head>" >> feeder.opml
echo "<title> Feeder </title>" >> feeder.opml
echo "</head>" >> feeder.opml
echo "<body>" >> feeder.opml

for user in $users
do
	#printf "https://nitter.nixnet.services/" $user "/rss"
	echo '<outline title="'$user'" text="@'$user'" type="rss" xmlUrl="https://nitter.nixnet.services/'$user'/rss"/>' >> feeder.opml
done

echo "</body>" >> feeder.opml
echo "</opml> " >> feeder.opml

rm -r data
rm -r assets
rm Your\ archive.html

printf "\nfeeder.opml is ready\nimport it in your feeder app\n"

#curl -d 'input=20463983' -X POST https://tweeterid.com/ajax.php

#curl -d 'input='$1 -X POST https://tweeterid.com/ajax.php
