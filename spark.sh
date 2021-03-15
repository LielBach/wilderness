pushd ~

curl https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-without-hadoop.tgz --output ~/spark-2.4.3.tgz
tar -xf spark-2.4.3.tgz
sudo mv spark-2.4.3-bin-without-hadoop /usr/local/spark
echo export SPARK_DIST_CLASSPATH=$(hadoop classpath) | tee -a /usr/local/spark/conf/spark_env.sh
echo export YARN_CONF_DIR=/usr/local/hadoop/etc/hadoop | tee -a /usr/local/spark/conf/spark_env.sh
echo export YARN_CONF_DIR=/usr/local/hadoop/etc/hadoop  | sudo tee -a /etc/profile.d/spark_env.sh
echo PATH="$PATH:/usr/local/spark/bin" | sudo tee /etc/environment

popd