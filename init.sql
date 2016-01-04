update user set Host='%' where Host='localhost' and User='root';
flush privileges;
