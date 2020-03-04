function verifyNum {

read -p "Enter item number: " itemNum
while [[  ${#itemNum} -ne 4 || -n ${itemNum//[0-9]} ]]; do
    
    read -p "[ERROR]: Invalid Input,  Item Number: " itemNum
    
done    
echo "$itemNum"
}
function verifyName {

read -p "Item name: " itemName

while [[ $itemName = *[[:space:]]* || $itemName =~ ^[[:space:]] || $itemName =~ [[:space:]]$ ]]; do
    read -p "[ERROR]: Invalid Input, Item name: " itemName
done
echo $itemName

}
