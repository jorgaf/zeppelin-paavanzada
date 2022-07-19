echo 'Initializer script'
base64 -d <<"H4sIAAAAAAAAA51QWwqEMAz89xT52y4IuY1fgfEgOfzmUWMrKLgpTvNop+MQwYNexnxhIbUWSN6R
NHyvLArrqXOlKE98YcpqEnnfcnhoAdPHwUUZ7tbNOjPah4khNDaSGEpqsVc0VgtRDVr1kY11A87D
sYwFweIoIcpwrXqFZ/3L2k9lAe6DJdzhyVyn0tlNvTbmCBaOZ+O+beqPpHvlo3b3H1jYtUi4d/op
CjrtLLxl4ZQgtFk6+MlVjnjDwuYC+S9Jd7b7yUZddhY++PJfLD/Ba+BxPQMAAA==" | gunzip

if [ -d zeppelin-0.10.1-bin-all ];
then
echo 'Existe Zeppelin. No Mover'
else
echo 'No existe. Mover'
mv /home/gitpod/utpl/zeppelin-0.10.1-bin-all /workspace/zeppelin-paavanzada
fi

if [ -d spark-3.2.1-bin-hadoop3.2 ]
then
echo 'Existe Spark. No mover'
else
echo 'No existe. Moviendo'
mv /home/gitpod/utpl/spark-3.2.1-bin-hadoop3.2 /workspace/zeppelin-paavanzada
fi
sed -i -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/g' /home/gitpod/.sdkman/etc/config

export PATH=/workspace/zeppelin-paavanzada/zeppelin-0.10.1-bin-all/bin:$PATH
