# fluttermono

一个全新的可用 flutter-app，UI 参考 Mono.

## Getting Started

- 链接设备

- 执行: `flutter run`

```dash
# 打包
1. cd <app dir> (<app dir> 为您的工程目录).
2. 运行flutter build apk (flutter build 默认会包含 --release选项).
3. 打包好的发布APK位于<app dir>/build/app/outputs/apk/app-release.apk。
```

## 微信apk安装

1. 通过微信发送的安装包,默认会被加上后缀XXX.1 ,例如：`app-realease.apk.1`

2. 文件保存的系统路径为: `tencent/MicroMsg/Downlond`

3. 通过 `文件管理-手机-找到该路径下面的文件`，然后修改文件名，将微信添加的后缀去掉，将文件名改为: `app-realease.apk`,即可安装

## 项目结构

- router 路由同意管理
