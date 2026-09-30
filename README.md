تقدیم به کاربران عزیز گرین ماینینگ از طرف سعید اعظمی 

V2RayA Installer for HiveOS

اسکریپت نصب خودکار V2RayA روی HiveOS برای سیستم‌های "x86_64 / amd64".

این اسکریپت تمام مراحل موردنیاز برای نصب و راه‌اندازی V2RayA را به‌صورت خودکار انجام می‌دهد و برای استفاده روی ریگ‌های HiveOS طراحی شده است.

امکانات

- نصب پیش‌نیازهای موردنیاز
- دانلود خودکار V2RayA نسخه "2.5.8"
- نصب پکیج رسمی ".deb"
- بررسی و رفع وابستگی‌های نرم‌افزاری
- فعال‌سازی سرویس V2RayA
- اجرای خودکار V2RayA هنگام بوت
- بررسی وضعیت سرویس پس از نصب
- نمایش نسخه و وضعیت نصب
- نمایش آدرس پنل وب V2RayA
- بدون ایجاد تغییر در Routing یا تنظیمات Proxy سیستم

نصب سریع

روی HiveOS با SSH وارد شوید و دستور زیر را اجرا کنید:
```
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install-v2raya.sh)
```

یا ابتدا فایل را دانلود کنید:

```
wget https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install-v2raya.sh
```

سپس:
```
chmod +x install-v2raya.sh
./install-v2raya.sh
```

پس از نصب، پنل V2RayA روی پورت "2017" در دسترس خواهد بود:

http://HIVEOS_IP:2017

دستورات مدیریت

بررسی وضعیت سرویس:
```
systemctl status v2raya --no-pager
```

مشاهده لاگ:
```
journalctl -u v2raya -f ```

راه‌اندازی:

systemctl start v2raya

توقف:

systemctl stop v2raya

راه‌اندازی مجدد:
```
systemctl restart v2raya
```




سازگاری

- HiveOS
- Debian/Ubuntu based systems
- Architecture: "x86_64 / amd64"
- V2RayA: "2.5.8"

«این اسکریپت صرفاً V2RayA و پیش‌نیازهای آن را نصب و سرویس را راه‌اندازی می‌کند. هیچ تنظیمی برای Proxy، TProxy، Routing یا Firewall به‌صورت خودکار اعمال نمی‌شود.»

---

V2RayA Installer for HiveOS

An automated installer for V2RayA on HiveOS, designed for "x86_64 / amd64" systems.

This script automates the required steps to download, install, configure, and start V2RayA on HiveOS mining rigs.

Features

- Installs required dependencies
- Automatically downloads V2RayA "2.5.8"
- Installs the official ".deb" package
- Checks and fixes package dependencies
- Enables the V2RayA system service
- Starts V2RayA automatically at boot
- Verifies the service after installation
- Displays installation and version information
- Displays the V2RayA web panel address
- Does not modify system routing or proxy settings

Quick Installation

Connect to your HiveOS system via SSH and run:

bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install-v2raya.sh)

Or download the script first:

wget https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/install-v2raya.sh

Then run:

chmod +x install-v2raya.sh
./install-v2raya.sh

After installation, the V2RayA web panel will be available on port "2017":

http://HIVEOS_IP:2017

Service Management

Check service status:

systemctl status v2raya --no-pager

View live logs:

journalctl -u v2raya -f

Start:

systemctl start v2raya

Stop:

systemctl stop v2raya

Restart:

systemctl restart v2raya

Compatibility

- HiveOS
- Debian/Ubuntu-based systems
- Architecture: "x86_64 / amd64"
- V2RayA: "2.5.8"

«This installer only installs V2RayA, its required dependencies, and the system service. It does not automatically configure Proxy, TProxy, routing, or firewall rules.»

