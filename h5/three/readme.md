# introduction
* 这个目录是学习threes.js的练习目录
* 课程是Bruno Simon的学习网站的第三方录制的视频
* 原视频需要付费，网站是https://threejs-journey.com/


## vscode插件
* 在vscode的 查看-> 终端中输入npm install --save @types/three

## webpack
### 初始化webpack项目
1. 在当前位置创建一个空目录  $ mkdir webpack-demo(目录名）
2. cd webpack-demo 目录，初始化一个package.json   $ npm init
3. 安装'webpack'与'webpack-cli' $ npm install webpack webpack-cli -D
4. 创建入口js文件与html文件，$ npm touch index.html src/index.js
5. 创建webpack.config.js文件 $ touch webpack.config.js