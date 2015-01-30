#目的
整合反编译工具: apktool auto-sign dex2jar

#地址
https://github.com/lijunjieone/coalApktool.git

#步骤
- git clone https://github.com/lijunjieone/coalApktool.git
- export PATH=$YOUR_PATH/bin:$PATH >> ~/.bash_profile

#使用
反编译a.apk

apktool d -o /tmp/a a.apk

apktool b -o /tmp/a1.apk -f /tmp/a

sign.sh /tmp/a1.apk /tmp/a2.apk

adb install /tmp/a2.apk


