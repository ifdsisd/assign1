.  shared.sh
wordArray=()
function createArray()
{
	while IFS= read -r line; do
		wordArray+=("$line")
	done<$itemFile





}	
itemNum="$(verifyNum)"



itemFile=data/$itemNum.item

if [ -f $itemFile ]; then 
		
	createArray

	itemSplit=()
	for word in ${wordArray[0]}; do
		itemSplit+=("$word")
	done
	
	
	
	itemNums=()
	for nums in ${wordArray[1]}; do
		itemNums+=("$nums")
	done

	date=$(date "+[%Y-%M-%d %H:%m:%S]")

	echo "$date DELETED: $itemNum - ${itemSplit[0]} - ${itemSplit[1]} - ${itemNums[1]}">>data/queries.log	


	rm -rf data/$itemNum.item


else
	echo "ERROR: item $itemNum not found"
fi
