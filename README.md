# NceAlg
# 介绍:
这是一套跨平台的异构算法框架
- 跨平台：支持x64/hisi(nnie)/ipu/dsp等不同网络推理单元。
- 易扩展：添加平台和算法任务方便简洁
- 接口简洁统一：无论算法任务和平台差异，对外的提供统一的c/c++接口调用

# 目录结构说明:
、、、
.
├── alg   跨平台/多任务算法实现部分
│   ├── alg_manager  算法任务管理层
│   │   ├── hd_alg  人头检测
│   │   │   └── ttf
│   │   └── util  通用接口实现
│   └── engine_manager  引擎管理层
│       └── engine_interface
│           ├── hisi_3516dv300  海思3516dv300
│           └── openvino_backend  x64-openvino
├── data  模型/测试图片位置
│   ├── image
│   │   └── head_detect
│   └── model
│       ├── hisi3516_dv300
│       └── openvino
├── demo  使用demo源码
│   ├── hisi_3516dv300
│   └── openvino
├── opencv  opencv头文件处（ps:实现部分没有依赖opencv，只是给测试程序使用）
│   ├── opencv
│   └── opencv2
│       ├── calib3d
│       ├── core
│       │   ├── cuda
│       │   │   └── detail
│       │   ├── hal
│       │   ├── opencl
│       │   │   └── runtime
│       │   │       └── autogenerated
│       │   ├── openvx
│       │   ├── private
│       │   └── utils
│       ├── cudalegacy
│       ├── cudev
│       │   ├── block
│       │   │   └── detail
│       │   ├── expr
│       │   ├── functional
│       │   │   └── detail
│       │   ├── grid
│       │   │   └── detail
│       │   ├── ptr2d
│       │   │   └── detail
│       │   ├── util
│       │   │   └── detail
│       │   └── warp
│       │       └── detail
│       ├── dnn
│       ├── features2d
│       ├── flann
│       ├── highgui
│       ├── imgcodecs
│       ├── imgproc
│       │   ├── detail
│       │   └── hal
│       ├── ml
│       ├── objdetect
│       ├── photo
│       ├── shape
│       ├── stitching
│       │   └── detail
│       ├── superres
│       ├── ts
│       ├── video
│       ├── videoio
│       ├── videostab
│       └── viz
└── platform  平台依赖源码/库
├── hisi_3516dv300
│   ├── audio
│   ├── common
│   ├── common_sys
│   ├── include
│   ├── rtsp-v2
│   ├── sample_nnie_software
│   └── tools
└── openvino
├── builders
├── c_api
├── cldnn
├── cpp
├── details
│   └── os
├── gna
├── gpu
│   └── details
├── hetero
├── multi-device
├── os
│   └── windows
├── samples
└── vpu

# 编译运行步骤:

## 依赖下载：

### HISI_3516dv300

- 百度网盘地址：[https://pan.baidu.com/s/10BrgrOfU5dZNbzFQ7Ep7QA](https://pan.baidu.com/s/10BrgrOfU5dZNbzFQ7Ep7QA) 密码ojbk(解压后将lib放在**platform/HISI_3516dv300**目录下)
- 相关编译链
- cmake 3.11+

### openvino

- 百度网盘地址：https://pan.baidu.com/s/1Z1f6jfutojzNzoRCdxDOAQ 密码ojbk(解压后将lib放在**platform/openvino**目录下，当前版本为**2020.3**月版本)
- vs2015+
- cmake 3.11+

## 编译+运行步骤

### 编译HISI_3516dv300

```bash
cd NceAlg
mkdir build
cmake .. 
cmake -DCMAKE_TOOLCHAIN_FILE=./platform/hisi_3516dv300/hi3516d.cmake -DPLATFORM=hisi_3516dv300 -DOPENCVOPTION=ON -DEXE_TEST=OFF -DCMAKE_BUILD_TYPE=Debug
make install
```

### 运行

在板端为LD_LIBRARY_PATH增加对应opencv动态库路径，即可运行。

### 生成openvinoVS工程

```bash
cd NceAlg
mkdir build
cmake ..
cmake .. -G "Visual Studio 14 2015 Win64" -DPLATFORM=openvino -DOPENCVOPTION=ON -DEXE_TEST=ON -DCMAKE_BUILD_TYPE=Debug#或者release
```

### 运行

将以下openvino的动态库路径配置到windows环境变量中

```bash
${工程路径}/NceAlg_cjy/NceAlg/platform/openvino/lib/openvino_2020_3/lib/x64/Debug
${工程路径}/NceAlg_cjy/NceAlg/platform/openvino/lib/openvino_2020_3/lib/x64/Release
${工程路径}/NceAlg_cjy/NceAlg/platform/opencv_340/bin
```

本地有opencv的话可以使用本地opencv。配置环境在VS工程中完成编译，并传参运行。



### 支持平台

|                     | Windows CPU | Windows GPU | Linux CPU | Linux GPU | 加速单元(NNIE/IPUDSP) |
| :-----------------: | :---------: | :---------: | :-------: | :-------: | :-------------------: |
| **hisi_3516_dv300** |    **/**    |    **/**    |   **/**   |   **/**   |         **✔️**         |
| **hisi_3559av100**  |    **/**    |    **/**    |   **/**   |   **/**   |         **/**         |
|     **RK3399**      |    **/**    |    **/**    |   **/**   |   **/**   |         **/**         |
|    **openvino**     |    **✔️**    |    **?**    |   **/**   |   **/**   |         **/**         |
|       **MNN**       |    **/**    |    **/**    |   **/**   |   **/**   |         **/**         |



