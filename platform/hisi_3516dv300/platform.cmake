add_definitions(-DPLATFORM=hisi_3516dv300)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/common/)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/common_sys/)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/sample_nnie_software/)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/include/)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/rtsp-v2/)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/audio/)

AUX_SOURCE_DIRECTORY(${PROJECT_SOURCE_DIR}/alg/engine_manager/engine_interface/hisi_3516dv300/ ENGINE_3516DV300_SRC)
AUX_SOURCE_DIRECTORY(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/sample_nnie_software/ NNIE_SRC)
AUX_SOURCE_DIRECTORY(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/common/ COMMON_SRC)
AUX_SOURCE_DIRECTORY(${PROJECT_SOURCE_DIR}/platform/hisi3516dv300/common_sys/ COMMON_SYS_SRC)

#设置hisi3516dv300所需源文件
set(PLATFORM_SRC 
${ENGINE_3516DV300_SRC}
${NNIE_SRC} 
${COMMON_SRC}
${COMMON_SYS_SRC}) 

#设置hisi3516dv300所需库文件
set(PLATFORM_LIB
-ldnvqe
-lVoiceEngine
-live
-lmd
-lnnie
-lmpi
-lupvqe
-lsecurec
-ldl
-lpthread
-lm
)


link_directories(${PROJECT_SOURCE_DIR}/lib/)
link_directories("/home/cjyvm2/3516rootfs/rootfs/lib/")
link_directories("/home/cjyvm2/3516rootfs/rootfs/usr/lib")
