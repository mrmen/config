#!/bin/bash

cd ~/tmp


cat gmail_headers | sed -e 's/\\r//g; s/\\n//g' > out

sed -i 's/From:/\n--/g; s/Subject:/\n++/g' out
cat out | sed -e '/++/!d' > subject 
cat out | sed -e '/--/!d' > from 
rm out
cat from | sed  's/\(.* \)\(.*@[^> ]*\)\(.*\)/\2/g' from | tr -d '<' > from2
mv from2 from
sed -i "s/.*/<span color='red'>&<\/span>/g" from 
sed -i "s/++ //g; s/'$//g" subject
sed -i 's/=?.*?Q?//g; s/?=//g' subject

paste from subject > output

cat ent_headers | sed -e 's/\\r//g; s/\\n//g' > out

sed -i 's/From:/\n--/g; s/Subject:/\n++/g' out
cat out | sed -e '/++/!d' > subject 
cat out | sed -e '/--/!d' > from 
rm out
cat from | sed  's/\(.* \)\(.*@[^> ]*\)\(.*\)/\2/g' from | tr -d '<' > from2
mv from2 from
sed -i "s/.*/<span color='green'>&<\/span>/g" from 
sed -i "s/++ //g; s/'$//g" subject
sed -i 's/=?.*?Q?//g; s/?=//g' subject

paste from subject >> output
sed -i 's/\t/ : /g' output


