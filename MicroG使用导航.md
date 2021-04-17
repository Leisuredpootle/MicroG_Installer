## MicroG模块使用导航

### 1.确定ROM是否支持签名欺骗

**请注意,部分ROM的启用方式不一致,此文档假设你正在使用CrdroidAndroid 7** 

方法1:打开 [这个链接](https://github.com/microg/GmsCore/wiki/Signature-Spoofing),此页面为MicroG的官方wiki,记录了第三方ROM对签名欺骗的支持情况及其启用方式,你可以在这里直观的看到你的ROM是否支持

方法2:使用[Signature Spoofing Checker](https://f-droid.org/packages/lanchon.sigspoof.checker/)进行确认.若支持,则会显示为"ENABLE"

#### 若不支持签名欺骗,你可以使用xposed模块“FakeGapps"

~~个人并不推荐使用这个方式来使用MicroG~~

### 2.安装模块

前往[GitHub项目](https://github.com/Leisuredpootle/MicroG_Installer/releases)进行下载,并在Magisk内刷入

**请注意,本人仅提供Android R/11的支持**

### 3.对MicroG内置APP进行授权

在一般情况下,安装模块并重启完成后,GmsCore会一直报错闪退 **这是正常现象,本人并没有内置脚本对这个问题进行处理**

~~1.解压模块,前往模块内的/system/app和/system/priv-app,手动安装这两个文件夹内的所有apk,**Turbo除外**.~~

~~此时你会发现,GmsCore报错不再发生~~

2.打开设置-应用与通知-查看全部应用找到MicroG Services Core,打开"权限",手动允许所有权限,其他模块内APP以此类推 **必须全部授权**

 **此步骤的注意事项:**

 1.签名欺骗权限为"其他权限"-"模仿软件包签名",此权限为MicroG Services Core和play商店正常运行的基础,必须要进行授权

 2.MicroG Services Core可能无法正常授权"位置信息" 此问题无需解决,不影响使用

### 4.MicroG的设置推荐

**MicroG没有中文的翻译,以下步骤可能有部分错误**

1.点击Account,登录你的Google账号

详细步骤:略

2.打开Google device registration,你会看到"Android ID" ,记录下这串ID, 前往Google的[设备注册页](https://www.google.com/android/uncertified/) 在此页填入该ID

#### 以下为可选操作

3.打开Cloud Messaging,点击右上角的三个点进入Advanced,打开 Confirm new apps

Networks to use for push notification无需进行设置

 **注意:**

 1.在软件首次打开时,你可以控制该软件是否注册FCM/GCM,如果你不需要,选择Deny即可

 2.注册和反注册(卸载已注册软件)均需要打开魔法 **这是404的问题,不是MicroG的问题**

## 一些常见问题的解答

### Q:我没有接收到软件的注册请求

方法1: 在"拨号"内输入 `*#*#2432546#*#*` 或者 `*#*#CHECKIN#*#*`

方法2: 如果你是使用了Alpha backup等软件进行还原的话,你可能需要清除你需要注册的软件的数据 ~~目前来看都能正常注册~~

### Q:Play商店显示RH-01

使用Google随便搜索一个软件,前往Play商店页,点击下载后自动跳转Play商店,过后可正常使用

### Q: safetynet无法通过

(

### Q:我无法登录使用Google账号登录一些软件

已知问题,MicroG还未完整实现这个API

### Play商店一直在进行"安全信息更新"/"Google Play更新"

很不幸,本人并未找到一个很好的方法来解决你可以尝试使用ifw禁用: 

Service:

emergencyselfupdateservice

gmscoreupdateservice

safeselfupdateservice

Receiver:

recoverymodedownloadbrocastreceiver

**如果您有完善的解决方法,麻烦您联系我** 

### 待补充