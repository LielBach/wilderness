sudo apt-get install -y openjdk-11-jdk
sudo apt-get install -y openssh-client openssh-server
curl https://apache.mivzakim.net/hadoop/common/stable/hadoop-3.3.0.tar.gz --output ~/hadoop.tar.gz
pushd ~
tar -xf hadoop.tar.gz
sudo mv hadoop-3.3.0 /usr/local/hadoop/
rm hadoop.tar.gz
echo 'export HADOOP_HOME=/usr/local/hadoop' | sudo tee -a /usr/local/hadoop/etc/hadoop/hadoop-env.sh
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' | sudo tee -a /usr/local/hadoop/etc/hadoop/hadoop-env.sh

sudo adduser hadoopuser
sudo usermod -aG hadoopuser hadoopuser
sudo chown hadoopuser:root -R /usr/local/hadoop/
sudo chmod g+rwx -R /usr/local/hadoop/
sudo adduser hadoopuser sudo

echo PATH="$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin" | sudo tee /etc/environment
echo JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64" | sudo tee -a /etc/environment

source /etc/environment

popd