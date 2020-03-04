
echo "Enter one of the following actions or press CTRL-D to exit."
echo "C - create new inventory item"
echo "R - read existing inventory item"
echo "U - update existing inventory item"
echo "D - delte existing inventory item"
echo "T - calculate total value of inventory item"
read  input 
clear
#typing bash infront of scripts for compatibility reasons
input=${input,,}
case $input in
    c)
        bash create.sh
        ;;
    r)
        bash read.sh
        ;;
    u)
        bash update.sh
        ;;
    d)
        bash delete.sh
        ;;
    t)
        bash total.sh
        ;;
    *)
        echo "menu item not found for $input"
        exit 1
        ;;
esac
