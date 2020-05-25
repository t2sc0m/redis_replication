# Redis Replication
---
![tescom](https://en.gravatar.com/userimage/96759029/aa4308f795041de37cc2fedf0d1071ca?size=128)


# Redis Replication vagrant script
---

## Directory & file
 - Vagrantfile : vagrant script 
 - WORK : redisソース, スタートscript, kernel設定
 - SHELL : install script, redis/sentinel start script
 - CONF : restredis本番から持ってきた設定file

---
## 環境設定
 - virtualboxインストール
 - vagrantインストール
 - データをコピー 

```script
git clone https://github.com/t2sc0m/redis_replication.git {GIT_CLONE_DIRECTORY}
```

---
## 実行
```script
cd {GIT_CLONE_DIRECTORY}
vagrant up
```
---

## process 確認
```script
vagrant ssh cent[1-3] 
sudo netstat -nltpu
sudo ps -ef|grep redis
```
---
