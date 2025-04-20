import requests
import json
from concurrent.futures import ThreadPoolExecutor, as_completed
import time

# 读取 keys.txt
with open("flux-keys.txt", "r", encoding="utf-8") as f:
    content = f.read()
keys = [key.strip() for key in content.split(",") if key.strip()]

print("keys数量为：",len(keys))
# 请求参数
url = "https://queue.fal.run/fal-ai/flux-pro/v1.1"
headers_template = {
    "accept": "application/json",
    "accept-language": "zh-CN,zh;q=0.9",
    "content-type": "application/json",
    "origin": "https://falai.haleclipse.de",
    "priority": "u=1, i",
    "referer": "https://falai.haleclipse.de/",
    "sec-ch-ua": '"Chromium";v="134", "Not:A-Brand";v="24", "Google Chrome";v="134"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": '"macOS"',
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "cross-site",
    "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36",
    "x-fal-queue-priority": "normal"
}
payload = {
    "image_size": "landscape_16_9",
    "sync_mode": False,
    "num_images": 1,
    "enable_safety_checker": False,
    "safety_tolerance": "6",
    "output_format": "png",
    "prompt": "Beautiful natural landscape, high-quality photography, sunny day, 4K ultra-clear, fine details"
}

# 并发请求函数
def test_key(key):
    headers = headers_template.copy()
    headers["authorization"] = f"Key {key}"
    try:
        response = requests.post(url, headers=headers, json=payload, timeout=8)
        if response.status_code == 200:
            return key
    except:
        pass
    return None

# 最大线程数（可以调高，默认建议：CPU核心数 x 5，别太高防止 API 拒绝请求）
MAX_THREADS = min(100, len(keys))

start = time.time()

valid_keys = []
with ThreadPoolExecutor(max_workers=MAX_THREADS) as executor:
    futures = {executor.submit(test_key, key): key for key in keys}
    for future in as_completed(futures):
        result = future.result()
        if result:
            print(f"[✅] 有效 Key: {result}")
            valid_keys.append(result)
        else:
            print(f"[❌] 无效或失败 Key: {futures[future]}")

# 写入成功 key
with open("flux-valid_keys.txt", "w", encoding="utf-8") as f:
    f.write(",".join(valid_keys))

print(f"\n✨ 总共 {len(valid_keys)} 个 key 可用，用时 {round(time.time() - start, 2)} 秒")
