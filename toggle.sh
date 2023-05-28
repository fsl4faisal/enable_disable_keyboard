
# grep -q, --quiet, --silent
#              Quiet;   do   not  write  anything  to  standard  output.   Exit
#              immediately with zero status if any match is found, even  if  an
#              error was detected.  Also see the -s or --no-messages option.


id=$(xinput list --id-only 'AT Translated Set 2 keyboard')
#echo $id

if  xinput --list --long | grep -A 1 "id=$id" | grep -q disabled;
  then
    echo "The keyboard was disabled.. now enabling "
    xinput enable "AT Translated Set 2 keyboard"
  else
    echo "The keyboard was enabled .. now disabling it"
    xinput disable "AT Translated Set 2 keyboard"
fi

#is_disabled