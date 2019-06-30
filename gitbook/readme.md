#### 注意事项
- github上创建书籍仓库
```
BOOK_URL: https://github.com/tfssweb/display
```

- 书籍结构
```
README.md:介绍文件
SUMMARY.md：目录文件
```

- 设置书籍仓库Webhooks钩子
```
在git仓库中设置webhook , 当commit事件发生时，触发url为gitbook服务器的4001端口
触发之后，gitbook将会自动git pull然后更新内容
，如果不设置的话，每次提交后，需要手动执行docker-compose restart 重启服务
```
