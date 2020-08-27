#!/bin/bash

cat 0310_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule | grep '[0-9]\|Hour AM/PM\|Roulette_Dealer_FNAME LAST' >> Dealers_working_during_losses

cat 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule | grep '[0-9]\|Hour AM/PM\|Roulette_Dealer_FNAME LAST' >> Dealers_working_during_losses

cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep '[0-9]\|Hour AM/PM\|Roulette_Dealer_FNAME LAST' >> Dealers_working_during_losses

cat Dealers_working_during_losses
