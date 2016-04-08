# Copy into a "Run Shell Script" workflow in Automator
# Save workflow as an application
# Drag-and-drop a plaintext file on to the application

timestamp=$(date +%H.%M.%S)

first=$(osascript -e 'try' -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear first." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)' -e 'on error number -128' -e 'do shell script "killall UFDSort"' -e 'end try')
second=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear second." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
third=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear third." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
fourth=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear fourth." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
fifth=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear fifth." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
sixth=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear sixth." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
seventh=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear seventh." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');
eighth=$(osascript -e 'set _firstField to text returned of (display dialog "Enter the column that you would like to appear eighth." default answer "" buttons {"Cancel", "Next"} default button 2 giving up after 300)');

awk -F, -v c1="$first" -v c2="$second" -v c3="$third" -v c4="$fourth" -v c5="$fifth" -v c6="$sixth" -v c7="$seventh" -v c8="$eighth" 'BEGIN{OFS=FS} {print $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8}' "$1" | 
sed -e 's/,\([^ ]\)/, \1/g' -e "s/ ,  /, /g" -e "s/ , /, /g" -e "s/,  /, /g" -e "s/,,/,/g" -e "s/^ //g" | 
sed -e "s/, ,//" -e "s/,$//" > ~/Desktop/SortResults_$timestamp.txt;
