echo 'Initializer script'
base64 -d <<<"H4sIAAAAAAAAA61SQQrDMAy79xW+LYOCf7OTwX2IHz9bTp1k0EHZEqpYcaIIUSKNQTdHXBi3NjJQuSfS9EmsPKuY+p6FVpqKIqYuVXVQ9yWbpxeXfQSEKcfDd5NnRcfUcVTDQoKmpBd/xTAbTDW14mc186Y6DmO6ikIlUGDKcS++a1T9Sx6nkij3xoZ0eAk3pGxN0z431gEVxrO474vFI5le5Wg9/S8qHF4E6Y08xZRGnIWXKpwWhF5eTnly0RkvVPrPIyo92Z4nu3TFWfgll5/Hn1TeZ92C+I4DAAA=" | gunzip

if [ -d zeppelin-0.11.1-bin-all ];
then
echo 'Existe Zeppelin. No Mover'
else
echo 'No existe. Mover Zeppelin'
mv /home/gitpod/utpl/zeppelin-0.11.1-bin-all /workspace/zeppelin-paavanzada
fi

if [ -d spark-3.5.1-bin-hadoop3. ]
then
echo 'Existe Spark. No mover'
else
echo 'No existe. Mover Spark'
mv /home/gitpod/utpl/spark-3.5.1-bin-hadoop3 /workspace/zeppelin-paavanzada
fi
sed -i -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/g' /home/gitpod/.sdkman/etc/config

export PATH=/workspace/zeppelin-paavanzada/zeppelin-0.11.1-bin-all/bin:$PATH
