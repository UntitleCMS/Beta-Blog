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
