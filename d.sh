# $1 is the starting address value
# $2 is the number of quadwords (1 line = 1 quadword = 16 bytes)

numArgs=$#

#define default values
startingAddr=0
numQW=4

if [ $numArgs == 0 ]
then
   startingAddr=0 numQW=4
elif [ $numArgs == 1 ]
then
   startingAddr=$1
   numQW=4
elif [ $numArgs > 1 ]
then
   startingAddr=$1
   numQW=$2
fi

#make sure alignment is correct
startingAddr=$(((startingAddr / 4) * 4))

printf "Printing %d Quadwords of Register Contents.\n" $numQW
printf "Starting at Address 0x%08X\n\n" $startingAddr

for ((line=0;line<numQW;line++))
do
   printf "0x%08X" $((startingAddr + 16 * line))
   valArr=(0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF 0xFFFFFFFF)
   for ((wordNum=0;wordNum<4;wordNum++))
   do
      currentAddress=$((startingAddr + (16 * line) + (4 * wordNum)))
      regValStr=`devmem $currentAddress`
      regValStr="${regValStr:2}"
      printf "\t%s" $regValStr
      #valArr[$wordNum]=$((regValStr))
   done

   printf "\n"   
done

printf "\n"
