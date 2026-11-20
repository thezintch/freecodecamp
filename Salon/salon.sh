#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

SERVICES=$($PSQL "SELECT service_id, name from services")

 MAIN_MENU() {
   echo "$SERVICES" | while IFS='|' read SERVICE_ID NAME
    do
    echo -e "$SERVICE_ID) $NAME"
    done
    #Read input from user
    read SERVICE_ID_SELECTED 
}
echo -e "~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"


MAIN_MENU

#Check if service exists
    SERVICES_1=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
    
    while  [[ -z $SERVICES_1 ]]
      do
       echo -e "\nI could not find that service. What would you like today?"
         MAIN_MENU
         SERVICES_1=$($PSQL "SELECT service_id from services where service_id = $SERVICE_ID_SELECTED")
        
      done 
         # Read Phone

echo -e "\nPlease enter your phone number" 
      
read CUSTOMER_PHONE
#Check if phone exists
   CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone = '$CUSTOMER_PHONE'")
#IF not found, ask for name and insert
if [[ -z $CUSTOMER_ID ]]
      then
      echo -e "\n I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO CUSTOMERS(phone,name) values ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id from customers where phone = '$CUSTOMER_PHONE'")
fi
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID;")
SERVICE_NAME=$($PSQL "Select name from services where service_id =$SERVICE_ID_SELECTED")

echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"

   read SERVICE_TIME
#Insert appointment
INSERT_APPOINTMENT=$($PSQL "INSERT INTO APPOINTMENTS(customer_id, service_id, time) values ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
 

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 
