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
crtmqm ${QM_NAME}
strmqm ${QM_NAME}
###############################################################################
echo " DEFINE QLOCAL(${QL_DEADQ}) DEFPSIST(YES) REPLACE " | runmqsc ${QM_NAME}
echo " ALTER QMGR DEADQ(${QL_DEADQ}) " | runmqsc ${QM_NAME}
echo " DEFINE QLOCAL(${QL_TRAN}) USAGE(XMITQ) DEFPSIST(YES) INITQ(SYSTEM.CHANNEL.INITQ) REPLACE " | runmqsc ${QM_NAME}
echo " DEFINE QREMOTE(${QR_OUT}) DEFPSIST(YES) RNAME(${RQL_IN}) RQMNAME(${RQM_NAME}) XMITQ(${QL_TRAN}) REPLACE " | runmqsc ${QM_NAME}
###############################################################################
echo " DEFINE CHANNEL(${CHL_SEND}) CHLTYPE(SDR) CONNAME('${RIP}(${RPORT})') XMITQ(${QL_TRAN}) REPLACE " | runmqsc ${QM_NAME}
echo " START CHANNEL(${CHL_SEND})" | runmqsc ${QM_NAME}
echo " DEFINE CHANNEL(${CHL_RECEVIE}) CHLTYPE(RCVR) REPLACE " | runmqsc ${QM_NAME}
echo " DEFINE CHANNEL(${CHL_SERVICE}) CHLTYPE(SVRCONN) REPLACE " | runmqsc ${QM_NAME}
###############################################################################
echo " DEFINE LISTENER(${LS_NAME}) TRPTYPE(TCP) CONTROL(QMGR) PORT(${LS_PORT})  REPLACE " | runmqsc ${QM_NAME}
echo " START LISTENER(${LS_NAME}) " | runmqsc ${QM_NAME}
###############################################################################
echo " ALTER QLOCAL(${QL_TRAN}) TRIGGER TRIGDATA('${CHL_SEND}') TRIGTYPE(EVERY) " | runmqsc ${QM_NAME}
###############################################################################
endmqm -i ${QM_NAME}
