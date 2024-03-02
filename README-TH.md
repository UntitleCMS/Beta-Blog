# เบต้าบล็อก

## การติดตั้ง

การติดตั้งและให้บริการของระบบเบต้าบล็อกนั้นจำเป็นจะต้องทำการติดตั้ง `Docker เวอร์ชัน 25 หรือสูงกว่า`

1. ทำการดาวโหลดเบต้าบล็อก [ลิงก์](https://github.com/UntitleCMS/Beta-Blog/releases) หรือ ผ่านคำสั่ง

```bash
git clone https://github.com/UntitleCMS/Beta-Blog.git
```

2. เปิดเซิฟเวอร์เบต้าบล็อก

>สำหรับ windows

```bash
cd Beta-Blog
./beta-blog
```

>สำหรับ mac os หรือ linux

```bash
cd Beta-Blog
chmod +x ./beta-blog
./beta-blog
```

หรือสามารถใช้ npm เพื่อเปิดเซิฟเวอร์ได้ด้วยคำสั่ง `npm run start`

หลังจากที่ Docker ติดตั้งบริการต่าง ๆ ของระบบได้แล้วจะสามารถเข้าใช้หน้าเว็บไซต์ได้ที่ `http://localhost:80` และ `https://localhost:443`

## เปลี่ยนโฮสต์เนม

โดยค่าเริ่มต้นระบบจะกำหนด `localhost` เป็นโฮสต์เนม แต่หากต้องการเป็นเป็นโดเมนของท่าน สามารถแทนที `localhost` เป็น`[โฮสต์เนมของท่าน]`ภายในไฟล์เหล่านี้

`./Ocelot/ocelot.authv2.json`

```jsonc
"UpstreamHeaderTransform": {
        "X-Forwarded-For": "{RemoteIpAddress}",
        "X-Forwarded-Host": "[โฮสต์เนมของท่าน]",
        "X-Forwarded-Proto": "https"
      }
```

`./docker-compose.service.gateway.yml`

```yml
environment:
        AUTH_ISSUER: https://[โฮสต์เนมของท่าน]/api/auth/v2
```

จากนั้นให้เริ่มระบบใหม่อีกครั้ง

## ระบบที่เกี่ยวข้อง

เนื่องจาก repository นี้ได้รวบรวมบริการย่อยหลายบริการเข้าไว้ด้วยกันเป็นระบบเบต้าบล็อก โดยแต่ละบริการจะถูกแพ็คไว้ในรูปแบบของ Docker image ดังนี้

1. rabit-mq
2. mongo
3. mcr.microsoft.com/mssql/server
4. ghcr.io/untitlecms/article-service
5. ghcr.io/untitlecms/authentication-service
6. ghcr.io/untitlecms/comment-service
7. ghcr.io/untitlecms/web-ui-service
8. ghcr.io/untitlecms/gateway
9. ghcr.io/untitlecms/picture-storage-service
10. ghcr.io/untitlecms/code-runner-service
11. ghcr.io/untitlecms/user-information-service

ซึ่งหากต้องการแก้ไขการตั้งค่าของแต่ละบริการสามารถแก้ไขได้ที่ `docker-compose` ของแต่ละบริการดังนี้

```plantext
│   docker-compose.broker.rabbitMq.yml
│   docker-compose.database.mongo.yml
│   docker-compose.database.sql-server.yml
│   docker-compose.network.yml
│   docker-compose.service.article.yml
│   docker-compose.service.auth.yml
│   docker-compose.service.comment.yml
│   docker-compose.service.fontend.yml
│   docker-compose.service.gateway.yml
│   docker-compose.service.image.yml
│   docker-compose.service.runner.yml
│   docker-compose.service.userinfo.yml
│   docker-compose.slave.runner.yml
```
