#!/bin/sh

echo "create Websphere MQ QM_UNIX"

QM_NAME=QM_UNIX
CHL_SEND=CHL_UNIX_TO_NT
CHL_RECEVIE=CHL_NT_TO_UNIX
CHL_SERVICE=CHL_UNIX_SERVICE
QL_IN=QL_UNIX_IN
QL_TRAN=QT_UNIX_TRAN
QR_OUT=QR_UNIX_OUT
QL_DEADQ=UNIX.DEADQ
LS_NAME=LS_UNIX
LS_PORT=8090
CCSID=819
RQM_NAME=QM_NT
RQL_IN=QL_NT_IN
RQL_OUT=QL_NT_OUT
RIP=192.168.137.1
RPORT=9090
###############################################################################
echo " STOP CHANNEL(${CHL_SEND}) " | runmqsc ${QM_NAME}
echo " STOP LISTENER(${LS_NAME}) " | runmqsc ${QM_NAME}
endmqm -i ${QM_NAME}
###############################################################################
#dltmqm ${QM_NAME}
