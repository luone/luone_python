const hamibot = {
    env: {
        task_type: ["random_task", "check_restart", "ks_js_open", "ks_js_sign", "ks_js_advertisement", "ks_js_open_box", "ks_js_live", "ks_js_shopping", "ks_js_luck_draw", "ks_js_novel", "ks_js_earn_coin", "ks_js_meal_allowance", "ks_js_video", "ks_js_force_kill", "ks_js_clear_apps", "ks_pt_open", "ks_pt_sign", "ks_pt_advertisement", "ks_pt_open_box", "ks_pt_live", "ks_pt_shopping", "ks_pt_luck_draw", "ks_pt_earn_coin", "ks_pt_meal_allowance", "ks_pt_follow_user", "ks_pt_comment_works", "ks_pt_like_works", "ks_pt_video", "ks_pt_force_kill", "ks_pt_clear_apps", "dy_js_open", "dy_js_task_no_check", "dy_js_sign", "dy_js_open_box", "dy_js_advertisement", "dy_js_live", "dy_js_shopping", "dy_js_video", "dy_js_force_kill", "dy_js_clear_apps", "bd_js_open", "bd_js_sign", "bd_js_open_box", "bd_js_advertisement", "bd_js_search", "bd_js_novel", "bd_js_video", "bd_js_article", "bd_js_clear_apps", "bd_dz_open", "bd_dz_sign", "bd_dz_open_box", "bd_dz_advertisement", "bd_dz_search", "bd_dz_video", "bd_dz_force_kill", "bd_dz_clear_apps", "hksp_js_open", "hksp_js_sign", "hksp_js_open_box", "hksp_js_advertisement", "hksp_js_video", "hksp_js_force_kill", "hksp_js_clear_apps", "xgsp_open", "xgsp_sign", "xgsp_open_box", "xgsp_advertisement", "xgsp_video", "xgsp_force_kill", "xgsp_clear_apps", "jrtt_js_open", "jrtt_js_sign", "jrtt_js_open_box", "jrtt_js_advertisement", "jrtt_js_live", "jrtt_js_shopping", "jrtt_js_video", "jrtt_js_force_kill", "jrtt_js_clear_apps", "bd_js_open_card", "bd_dz_open_card", "xgsp_meal_allowance", "recongnize_open", "bd_js_rec_coin", "keep_update", "ks_js_follow", "ks_js_search_keywords", "ks_js_send_friend_coin", "ks_js_novel_new", "dy_js_meal_allowance", "dy_js_novel", "dy_js_listen_book", "dy_js_subscribe_coin", "dy_js_watch_assigned_video", "ks_js_subscribe_coin", "ks_js_rise_or_sleep"],
        search_apps: "拼多多，冷运宝货主版，花娃，爱奇艺体育，京东极速版，小野猫直播，百变大侦探-剧本杀，4399游戏盒，贝乐虎儿歌，宝宝树孕育，阿拉德，汇丰汇选，美柚，搜狐视频，水母动漫，巴雄天下，域鉴，倩女幽魂，虫虫助手，B612咔叽，建行生活，快看，涨乐财富通，淘特，好游快爆，红豆免费小说，小游戏集合，哔哩哔哩，王者荣耀，百万红包，热血高爆版，传奇变态版，科企岛，知乎，虎牙直播，西瓜视频，问道，七读，准点天气，阅友免费小说，我叫MT：归来，京东，阿拉德手游，点淘，得物，京东特价版，妈妈网孕育，得间免费小说，得间免费小说极速版，逍遥情缘，叮咚租物，玩吧，彩视，汽车之家，美团，京喜，蛋啵，对庄翡翠，YY，微拍堂，花伍，运满满货主，婚礼纪，书旗小说，彩云日历，MOMO陌陌，花椒直播，仙境传奇，运满满货主，阿米游，偷吃点心，运满满司机，九灵神域，铜雀三国，梦仙灵，光明冒险，芒果斗地主，途游斗地主（比赛版），山海经异兽录，驯龙物语，超能世界，珍爱，一刻相册，西五街，我们的沙城，阿拉德之陆，TapTap",
        video_comments: "你好，不错，太好了，主播真棒，哈哈，我也来看看",
        task_num: "-1",
        novel_duration: "10",
        max_time: "15",
        n_time: "10",
        bd_js_n_time: "10",
        min_time: "10",
        open_min_time: "35",
        open_max_time: "60",
        image_threshold: "0.9",
        APP_ENV: "production",
        USER_ID: "6655d208c7ff5493883c4a42",
        ROBOT_ID: "670b956006081ca4a4674e3b",
        SCRIPT_ID: "670b94a2266948a4a59d4a51",
        TIMESTAMP: "2024-10-13 17:40:18"
    },
    plan: {name: "体验版", onFreeTrial: true, model: "flatRate"},
    robotName: "琼浆大蒜",
    scriptName: "【聚合大师】（八合一版）",
};
hamibot.postMessage = function () {
};
hamibot.exit = function () {
    exit();
};
Object.freeze(hamibot.env);
Object.freeze(hamibot.plan);
Object.freeze(hamibot);
/** * 快手极速、快手普通、抖音极速、百度极速、百度大字、好看视频极速、西瓜视频、今日头条极速版合集（养号版） */
const config_file = './config/hamibot/combine/config_hamibot_ks_dy_bd_xg_tt'
/** * 脚本资源节点 */
const resource_url_array = ["https://auto-hamibot-res-1309032940.cos-website.ap-chengdu.myqcloud.com/public/%s", "https://auto-hamibot-res.vercel.app/%s", "https://bzjl.gitee.io/auto_hamibot_res/%s", "http://82.156.132.121/public/%s",]
/** * 请求资源最大超时时间 */
let request_time_out = 3000
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
    }
    // 加载配置
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
            // 自定义实现
            // }\t\t// 把总链接也放到本地存储中
            env_config.script_url = script_url
            let storage = storages.create("app_config")
            storage.put("global_config", env_config)
            storage.put("config_path", './' + config_file + '.js')
        }
    }

    /** * 清理函数 * @param {*} import_moudles  * @returns  */
    function destory(import_moudles) {
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
