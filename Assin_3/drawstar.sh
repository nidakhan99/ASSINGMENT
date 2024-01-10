
#!/bin/bash
num=$1
type=$2

#printing type t2
case ${type} in

t2)

for (( i=1; i<=$num ;i++ ));
 do 
 for (( j=1;j<=i ; j++));
  do echo -n "*"
   done
echo " "
done
;;

#printing type1 pattern.
t1)
for (( i=1; i<=$num ;i++ ));do
    for (( j=$num ;j>i ; j--));do
    echo -n " "
    done

    for (( j=1;j<=i ; j++));do 
    echo  -n "*"
    done
    echo " "
done
;;

#printing type 3

t3)
for (( i=1; i<=$num ;i++ ));do
   
    for (( j=$num+1 ;j>i ; j--));do
    echo -n " "
    done


   for (( j=1;j<=i ; j++));do 
    echo  -n "*"
    done

    for (( j=2 ;j<=i ; j++));do 
    echo  -n "*"
    done


  
  echo " "
 
done
;;


#for printing type 4

t4)
for (( i=1; i<=$num ;i++ ));do
    for (( j=$num+1 ;j>i ; j--));do
    echo -n "*"
    done

    for (( j=1;j<=i ; j++));do 
    echo  -n " "
    done
    echo " "
done
;;

#printinh type 5

t5)

for (( i=1; i<=$num ;i++ ));do 
 for (( j=1;j<=i ; j++));do
  echo -n " "
  done
for ((j=$num+1 ; j>i ;j--));do
echo -n "*"
done 

echo " "
done
;;

#printing t6
t6)
for (( i=1; i<=$num ;i++ ));do 
  for (( j=1;j<=i ; j++));do
  echo -n " "
   done

  for (( j=$num+1 ;j>i ; j--));do
    echo -n "*"
    done
  for (( j=$num  ;j>i ; j--));do 
    echo  -n "*"
    done


echo " "
done 
;;

#printing type 7
t7)
for (( i=1; i<=$num ;i++ ));do
   
    for (( j=$num+1 ;j>i ; j--));do
    echo -n " "
    done


    for (( j=1;j<=i ; j++));do 
    echo  -n "*"
    done

    for (( j=2 ;j<=i ; j++));do 
    echo  -n "*"
    done
    
  echo " "
done


for (( i=1; i<=$num ;i++ ));do 
  for (( j=1;j<=i ; j++));do
  echo -n " "
   done

  for (( j=$num+1 ;j>i ; j--));do
    echo -n "*"
    done
  for (( j=$num  ;j>i ; j--));do 
    echo  -n "*"
    done


echo " "
done 



;;

*)
echo "command not found"
   ;;

esac




    
 








