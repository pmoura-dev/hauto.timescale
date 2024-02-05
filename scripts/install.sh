#!/bin/bash

echo "INSTALLING DATABASE..."

( cd schemas || exit; ./install.sh )
( cd functions || exit; ./install.sh)

echo ""
echo ""
echo ""
echo ""
echo "##############################################################################"
echo "#                                                                            #"
echo "# NEXT STEPS (choose one of the following):                                  #"
echo "#                                                                            #"
echo "#    1. dummy population (testing purposes)                                  #"
echo "#       psql -U \$POSTGRES_USER -d \$POSTGRES_DB -a -f resources/dummy.sql     #"
echo "#                                                                            #"
echo "##############################################################################"
