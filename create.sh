#shared functions 
. shared.sh


itemNum="$(verifyNum)"
itemName="$(verifyName)"


read -p "simple name: " simpName
read -p "Unit price: " unitPrice


unitPure=${unitPrice//[A-Z]}
unitPure=${unitPure//[a-z]}
periodCount="${unitPrice//[^.]}"
while [[ $unitPrice !=  $unitPure || ${#periodCount} -ne 1  ]];do
    echo "Contains non integer or period, or doesn't meet character length requiremnets  "
    read -p "Unit price: " unitPrice
    unitPure=${unitPrice//[A-Z]}
    unitPure=${unitPure//[a-z]}
    periodCount=${unitPrice//[^.]}
done

read -p "Enter item quantity: " quantity
while [[  -n ${quantity//[0-9]} ]]; do
    echo "Contains alphabetical or  non correct characters  try again..."
    
    read -p "Enter item quanitity: " quantity
done 

read -p "Enter maximum quantity: " maxQuantity

while [[ -n ${maxQuantity//[0-9]} || $maxQuantity -lt $quantity ]]; do
    echo "Value entered isn't valid or max quantity is lesser than the quantity"
    read -p "Enter maximum quantity: " maxQuantity
done 

read -p "Enter an item description: " itemDesc
#folder and file detection/creation part

direct=data
queries=data/queries.log
file=data/$itemNum.item
if [ -d "$direct" ]; then
    echo "$direct directory found" 
else
    mkdir "$direct"
    echo "$direct folder not found, creating new one..."
fi
if [ -f "$file" ]; then
    echo "ERROR: $file already exist"
    exit 1
else
    touch $file
    echo "$itemName $simpName">>$file
    echo "$unitPrice $quantity / $maxQuantity">>$file
    echo "$itemDesc">>$file 
    echo "$file created"
fi
date=$(date "+[%Y-%M-%d %H:%m:%S]")
if [ -f "$queries" ]; then
    echo "log file found, using it" 
    echo "$date CREATED: $itemNum - $itemName - $quantity / $maxQuantity">>$queries
else
    echo "$queries not found, creating..."
    touch $queries
    echo "$date CREATED: $itemNum - $itemName - $quantity / $maxQuantity">>$queries
fi



