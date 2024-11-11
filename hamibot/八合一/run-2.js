const config_file = './config/hamibot/combine/config_hamibot_ks_dy_bd_xg_tt'
/** * 脚本资源节点 */
const resource_url_array = ["https://auto-hamibot-res-1309032940.cos-website.ap-chengdu.myqcloud.com/public/%s", "https://auto-hamibot-res.vercel.app/%s", "https://bzjl.gitee.io/auto_hamibot_res/%s", "http://82.156.132.121/public/%s",]
/** * 请求资源最大超时时间 */let request_time_out = 3000
let script_url = ""
let init_file = 'executor_new'
let config_resolver_file = 'config_resolver'
let cst_config
// 本地调试环境下，不会从云端下载脚本
const is_debug = false
run()

function run() {
    createListener()
    toastLog('请稍等，正在加载资源.....')
    script_url = testConnect()
    if (!script_url) {
        localRun()
        return
    }      // 加载配置
    if (config_file) {
        toastLog('加载配置......')
        autoImportMoudles([config_file, config_resolver_file])
        resolveConfig()
        storageConfig(config_resolver_file)
        if (cst_config && cst_config.import_moudles) {
            autoImportMoudles(cst_config.import_moudles)
        }
    }    // 执行主函数
    if (init_file) {
        toastLog('执行主函数......')
        autoImportMoudles([init_file])
        if (cst_config.is_init_ui) {
            engines.execScriptFile(init_file + '.js')
        } else {
            let executor = require('./' + init_file + '.js')
            executor.execute()
        }
    }
}

// destory(import_moudles_arr)}
/** * 创建监听器 */
function createListener() {
    threads.start(function () {
        events.on("stop", function () {
            stopOtherEngines()
        })
        events.on("exit", function () {
            stopOtherEngines()
        })
    });
}

/** * 自动导入下载所需模块脚本 * @param {*} import_moudles  */function autoImportMoudles(import_moudles_arr) {
    if (is_debug) {
        return
    }
    if (!import_moudles_arr || import_moudles_arr.length == 0) {
        return
    }
    for (let i = 0; i < import_moudles_arr.length; i++) {
        let import_moudle_name = import_moudles_arr[i] + '.js'
        let script_path = downloadScript(import_moudle_name)
        if (!script_path) {
            // 如果下载失败，尝试重新下载
            let script_path = downloadScript(script_url, import_moudle_name)
            if (!script_path) {
                console.error('网络不稳定，脚本下载失败，请尝试调整网络后重新下载！')
                exit()
            }
        }
    }
}

function resolveConfig() {
    let config_resolver = require(config_resolver_file + '.js')
    let config_obj = require(config_file + '.js')
    cst_config = config_resolver.resolve(config_obj)
}

function storageConfig(config_file) {
    let env_config
    try {
        env_config = JSON.parse(JSON.stringify(hamibot.env))
    } catch (err) {
    }
    if (!env_config) {
        // 如果 hamibot中没有，则取autojs的配置
        // 自定义实现    }\t\t
        // 把总链接也放到本地存储中
        env_config.script_url = script_url
        let storage = storages.create("app_config")
        storage.put("global_config", env_config)
        storage.put("config_path", './' + config_file + '.js')
    }
}

/** * 清理函数 * @param {*} import_moudles  * @returns  */function destory(import_moudles) {
    if (!import_moudles || import_moudles.length == 0) {
        return
    }
    for (let i = 0; i < import_moudles.length; i++) {
        let import_moudle_name = import_moudles[i] + '.js'
        if (isScriptExist(import_moudle_name)) {
            // 文件删除
            files.remove(import_moudle_name)
        }
    }
}

/** * 判断该模块脚本在本地是否存在 * @param {*} script_moudle_name  * @returns  */
function isScriptExist(script_moudle_name) {
    if (files.exists('./' + script_moudle_name)) {
        return true
    } else {
        return false
    }
}

/** * 下载脚本 * @param {*} scriptName  * @returns  */
function downloadScript(scriptName) {    // 查找指定名字脚本的下载链接
    var scriptUrl = util.format(script_url, scriptName)
    var url = encodeURI(scriptUrl)
    var r = http.get(url, {
        headers: {
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
        }
    }).body.string()
    var scriptPath = files.cwd() + '/' + scriptName
    let createdDirs = files.createWithDirs(scriptPath)
    files.write(scriptPath, r)
    return scriptPath
}

function testConnect() {
    http.__okhttp__.setTimeout(request_time_out);   // 设置全局默认超时时间为n秒
    for (let i = 0; i < resource_url_array.length; i++) {
        let resource_url = resource_url_array[i]
        let scriptUrl = util.format(resource_url, "executor.js")
        let url = encodeURI(scriptUrl)
        log('正在尝试节点' + Number(i + 1))
        try {
            let response = http.get(url, {
                headers: {
                    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
                }
            })
            if (response.statusCode == 200) {
                console.info('当前资源节点通畅！')
                return resource_url;
            }
        } catch (error) {
            console.error('当前资源节点不通，尝试切换下一节点！')
            continue;
        }
    }
    console.error("当前暂无可用资源节点，请检查网络后重新运行脚本")
    return "";
}

function localRun() {
    log('尝试本地加载')
    try {
        let executor = require('./' + init_file + '.js')
        executor.execute()
    } catch (error) {
        console.error("本地暂无可加载资源，请加群联系管理")
    }
}

/** * 结束其他所有脚本 */
function stopOtherEngines() {
    console.hide()    /*let current_engine = engines.myEngine();    let all_engines = engines.all();    toastLog("正在运行的脚本有", all_engines.length, "个");    for (let i = 0; i < all_engines.length; i++) {        let engine_ele = all_engines[i]        if (engine_ele.toString() != current_engine.toString()) {            engine_ele.forceStop();        }    }    toastLog("脚本已停止运行");*/
}