echo 'Initializer script'
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
'No existe. Moviendo'
mv /home/gitpod/utpl/spark-3.2.1-bin-hadoop3.2 /workspace/zeppelin-paavanzada
fi
sed -i -e 's/sdkman_auto_answer=false/sdkman_auto_answer=true/g' /home/gitpod/.sdkman/etc/config

export PATH=/workspace/zeppelin-paavanzada/zeppelin-0.10.1-bin-all/bin:$PATH
