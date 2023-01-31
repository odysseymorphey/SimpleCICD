#!/bin/bash
FLAG="-b -v -e -n -t -s"
COUNTER_SUCCESS=0
COUNTER_FAIL=0
DIFF_RES=""
TEST_FILE="./tests/invisibles.txt"
TEST_FILE2="./tests/test_1.txt"
TEST_FILE3="./tests/test.txt"
TEST_FILE4="./tests/test_2.txt"
echo /dev/null > ./tests/log.txt
echo "--------------------------------------------"

for var in $FLAG 
do
          TEST1="$var $TEST_FILE"
          TEST2="$var $TEST_FILE2"
          TEST3="$var $TEST_FILE3"
          TEST4="$var $TEST_FILE4"

          ./s21_cat $TEST1 > ./tests/s21_cat.txt
          cat $TEST1 > ./tests/cat.txt
          DIFF_RES="$(diff -s ./tests/s21_cat.txt ./tests/cat.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat.txt and ./tests/cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          ./s21_cat $TEST2 > ./tests/s21_cat2.txt
          cat $TEST2 > ./tests/cat2.txt
          DIFF_RES="$(diff -s ./tests/s21_cat2.txt ./tests/cat2.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat2.txt and ./tests/cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi

          # === TEST 3 ===
          ./s21_cat $TEST3 > ./tests/s21_cat3.txt 
          cat $TEST3 > ./tests/cat3.txt
          DIFF_RES="$(diff -s ./tests/s21_cat3.txt ./tests/cat3.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat3.txt and ./tests/cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          # ./s21_cat $TEST4 > ./tests/s21_cat4.txt
          # cat $TEST4 > ./tests/cat4.txt
          # DIFF_RES="$(diff -s ./tests/s21_cat4.txt ./tests/cat4.txt)"
          # if [ "$DIFF_RES" == "Files ./tests/s21_cat4.txt and ./tests/cat4.txt are identical" ]
          #   then
          #     (( COUNTER_SUCCESS++ ))
          #   else
          #     echo "$TEST4" >> ./tests/log.txt
          #     (( COUNTER_FAIL++ ))
          # fi

          rm ./tests/s21_cat*.txt ./tests/cat*.txt

done

for var in $FLAG 
do
  for var2 in $FLAG 
  do
        if [ $var != $var2 ]
        then
          TEST1="$var $var2 $TEST_FILE"
          TEST2="$var $var2 $TEST_FILE2"
          TEST3="$var $var2 $TEST_FILE3"
          TEST4="$var $var2 $TEST_FILE4"
#          echo "$TEST1"
          ./s21_cat $TEST1 > ./tests/s21_cat.txt
          cat $TEST1 > ./tests/cat.txt
          DIFF_RES="$(diff -s ./tests/s21_cat.txt ./tests/cat.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat.txt and ./tests/cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          ./s21_cat $TEST2 > ./tests/s21_cat2.txt
          cat $TEST2 > ./tests/cat2.txt
          DIFF_RES="$(diff -s ./tests/s21_cat2.txt ./tests/cat2.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat2.txt and ./tests/cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi

          ./s21_cat $TEST3 > ./tests/s21_cat3.txt
          cat $TEST3 > ./tests/cat3.txt
          DIFF_RES="$(diff -s ./tests/s21_cat3.txt ./tests/cat3.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat3.txt and ./tests/cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          # ./s21_cat $TEST4 > ./tests/s21_cat4.txt
          # cat $TEST4 > ./tests/cat4.txt
          # DIFF_RES="$(diff -s ./tests/s21_cat4.txt ./tests/cat4.txt)"
          # if [ "$DIFF_RES" == "Files ./tests/s21_cat4.txt and ./tests/cat4.txt are identical" ]
          #   then
          #     (( COUNTER_SUCCESS++ ))
          #   else
          #     echo "$TEST4" >> ./tests/log.txt
          #     (( COUNTER_FAIL++ ))
          # fi

          rm ./tests/s21_cat*.txt ./tests/cat*.txt

        fi
  done
done

for var in $FLAG 
do
  for var2 in $FLAG 
  do
      for var3 in $FLAG 
      do
        if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ]
        then
          TEST1="$var $var2 $var3 $TEST_FILE"
          TEST2="$var $var2 $var3 $TEST_FILE2"
          TEST3="$var $var2 $var3 $TEST_FILE3"
          TEST4="$var $var2 $var3 $TEST_FILE4"

          ./s21_cat $TEST1 > ./tests/s21_cat.txt
          cat $TEST1 > ./tests/cat.txt
          DIFF_RES="$(diff -s ./tests/s21_cat.txt ./tests/cat.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat.txt and ./tests/cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          ./s21_cat $TEST2 > ./tests/s21_cat2.txt
          cat $TEST2 > ./tests/cat2.txt
          DIFF_RES="$(diff -s ./tests/s21_cat2.txt ./tests/cat2.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat2.txt and ./tests/cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi


          ./s21_cat $TEST3 > ./tests/s21_cat3.txt
          cat $TEST3 > ./tests/cat3.txt
          DIFF_RES="$(diff -s ./tests/s21_cat3.txt ./tests/cat3.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat3.txt and ./tests/cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi

          # ./s21_cat $TEST4 > ./tests/s21_cat4.txt
          # cat $TEST4 > ./tests/cat4.txt
          # DIFF_RES="$(diff -s ./tests/s21_cat4.txt ./tests/cat4.txt)"
          # if [ "$DIFF_RES" == "Files ./tests/s21_cat4.txt and ./tests/cat4.txt are identical" ]
          #   then
          #     (( COUNTER_SUCCESS++ ))
          #   else
          #     echo "$TEST4" >> ./tests/log.txt
          #     (( COUNTER_FAIL++ ))
          # fi
          rm ./tests/s21_cat*.txt ./tests/cat*.txt


        fi
      done
  done
done

for var in $FLAG 
do
  for var2 in $FLAG 
  do
      for var3 in $FLAG 
      do
          for var4 in $FLAG 
          do
            if [ $var != $var2 ] && [ $var2 != $var3 ] && [ $var != $var3 ] && [ $var != $var4 ] && [ $var2 != $var4 ] && [ $var3 != $var4 ]
            then
              TEST1="$var $var2 $var3 $var4 $TEST_FILE"
              TEST2="$var $var2 $var3 $var4 $TEST_FILE2"
              TEST3="$var $var2 $var3 $var4 $TEST_FILE3"
              TEST4="$var $var2 $var3 $var4 $TEST_FILE4"
          ./s21_cat $TEST1 > ./tests/s21_cat.txt
          cat $TEST1 > ./tests/cat.txt
          DIFF_RES="$(diff -s ./tests/s21_cat.txt ./tests/cat.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat.txt and ./tests/cat.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST1" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi

          ./s21_cat $TEST2 > ./tests/s21_cat2.txt
          cat $TEST2 > ./tests/cat2.txt
          DIFF_RES="$(diff -s ./tests/s21_cat2.txt ./tests/cat2.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat2.txt and ./tests/cat2.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST2" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi

          ./s21_cat $TEST3 > ./tests/s21_cat3.txt
          cat $TEST3 > ./tests/cat3.txt
          DIFF_RES="$(diff -s ./tests/s21_cat3.txt ./tests/cat3.txt)"
          if [ "$DIFF_RES" == "Files ./tests/s21_cat3.txt and ./tests/cat3.txt are identical" ]
            then
              (( COUNTER_SUCCESS++ ))
            else
              echo "$TEST3" >> ./tests/log.txt
              (( COUNTER_FAIL++ ))
          fi
          # ./s21_cat $TEST4 > ./tests/s21_cat4.txt
          # cat $TEST4 > ./tests/cat4.txt
          # DIFF_RES="$(diff -s ./tests/s21_cat4.txt ./tests/cat4.txt)"
          # if [ "$DIFF_RES" == "Files ./tests/s21_cat4.txt and ./tests/cat4.txt are identical" ]
          #   then
          #     (( COUNTER_SUCCESS++ ))
          #   else
          #     echo "$TEST4" >> ./tests/log.txt
          #     (( COUNTER_FAIL++ ))
          # fi

          rm ./tests/s21_cat*.txt ./tests/cat*.txt

        

            fi
          done
      done
  done
done

echo "SUCCESS: $COUNTER_SUCCESS"
echo "FAIL: $COUNTER_FAIL"

if [ "$COUNTER_FAIL" != 0 ]
then
exit 1
fi
