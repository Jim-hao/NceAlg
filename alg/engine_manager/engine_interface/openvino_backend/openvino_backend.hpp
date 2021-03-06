#ifndef __OPENVINO_BACKEND_HPP__
#define __OPENVINO_BACKEND_HPP__

#include<alg_type.h>
#include<IEngine.hpp>
#include<map>
#include<memory>

#ifdef __cplusplus
#if __cplusplus


using namespace std;
extern "C"{
#endif
#endif /* __cplusplus */

namespace nce_alg
{
    class openvino_engine: public IEngine
    {
    public:
        NCE_S32 engine_init(const engine_param_info & st_engine_param_info);

        NCE_S32 engine_inference(img_info & pc_img);

        NCE_S32 engine_get_result(map<string, NCE_S32*> & engine_result);

        NCE_S32 engine_destroy();
    
    private:
        class engine_priv;

        shared_ptr<engine_priv> pPriv;
    };
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* __cplusplus */

#endif /* __ENGINE_HISI3516_DV300_HPP__ */



