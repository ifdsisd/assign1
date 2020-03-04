 . shared.sh
 wordArray=()
itemNum="$(verifyNum)"
itemFile="data/$itemNum.item"
if [ -f $itemFile ]; then
    while IFS= read -r line; do
        #populating array
        wordArray+=("$line")
     done<$itemFile
else
    echo "$itemFile not found " 
    exit  1
fi
itemSplit=()
for word in ${wordArray[0]}; do
    itemSplit+=("$word")
done
echo "Item Number: $itemNum" 
echo "Item Name: ${itemSplit[0]}"
echo "Simple Name: ${itemSplit[1]}" 

itemSplit=()
for nums in ${wordArray[1]}; do
    itemSplit+=("$nums")
done
echo "Unit Price ${itemSplit[0]}"
echo "Quantity ${itemSplit[1]} ${itemSplit[2]} ${itemSplit[3]}" 
echo "${wordArray[2]}" 


