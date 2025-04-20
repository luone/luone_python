from appium import webdriver
import pytesseract
from PIL import Image
import cv2
import numpy as np
import time
import json
from collections import defaultdict
import hashlib

# 配置Appium驱动（以Android为例，iOS类似）
desired_caps = {
    'platformName': 'Android',
    'platformVersion': '13',
    'deviceName': 'LMV5007810c564',
    'appPackage': 'com.example.app',
    'appActivity': '.MainActivity',
    'automationName': 'UiAutomator2',
    'noReset': True,
    'newCommandTimeout': 600
}

# 初始化WebDriver
driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)

# 记录已访问的状态
visited = set()
graph = defaultdict(list)
test_steps = {}


def get_page_state():
    """获取当前页面的状态（使用截图）"""
    try:
        screenshot = driver.get_screenshot_as_png()
        image = Image.open(io.BytesIO(screenshot))
        image_hash = hashlib.md5(np.array(image).tobytes()).hexdigest()
        return image_hash
    except Exception as e:
        print(f"Error getting page state: {e}")
        return None


def get_page_name():
    """获取当前页面的名称（基于OCR识别标题）"""
    try:
        screenshot = driver.get_screenshot_as_png()
        image = Image.open(io.BytesIO(screenshot))
        text = pytesseract.image_to_string(image)
        lines = text.split('\n')
        for line in lines:
            if line.strip():
                return line.strip()
        return get_page_state()[:8]
    except Exception as e:
        print(f"Error getting page name: {e}")
        return get_page_state()[:8]


def record_test_step(page_name, element_text, action, result):
    """记录测试步骤"""
    if page_name not in test_steps:
        test_steps[page_name] = []
    step = {
        "element": element_text,
        "action": action,
        "result": result
    }
    test_steps[page_name].append(step)


def ocr_recognition():
    """使用OCR识别页面上的文本和控件"""
    screenshot = driver.get_screenshot_as_png()
    image = Image.open(io.BytesIO(screenshot))
    data = pytesseract.image_to_data(image, output_type=pytesseract.Output.DICT)

    elements = []
    for i in range(len(data['text'])):
        if data['text'][i].strip():
            x, y, w, h = data['left'][i], data['top'][i], data['width'][i], data['height'][i]
            element_text = data['text'][i]
            elements.append({"text": element_text, "x": x, "y": y, "w": w, "h": h})
    return elements


def explore_page(max_depth=10, current_depth=0):
    """探索当前页面，结合OCR识别自定义控件"""
    if current_depth >= max_depth:
        return
    current_state = get_page_state()
    if current_state in visited or current_state is None:
        return
    visited.add(current_state)
    page_name = get_page_name()
    print(f"Exploring page: {page_name} (Depth: {current_depth})")

    # 尝试使用UI树获取可交互元素
    ui_elements = driver.find_elements(MobileBy.XPATH, "//*[@clickable='true'] | //*[@scrollable='true']")

    if not ui_elements:  # 如果UI树不可用，使用OCR
        print("UI tree unavailable, using OCR...")
        ocr_elements = ocr_recognition()
        for element in ocr_elements:
            try:
                print(f"Found element via OCR: {element['text']} at ({element['x']}, {element['y']})")
                driver.tap([(element['x'] + element['w'] // 2, element['y'] + element['h'] // 2)])
                time.sleep(1)
                new_page_name = get_page_name()
                result = f"Navigated to {new_page_name}" if new_page_name != page_name else "No navigation"
                record_test_step(page_name, element['text'], "click", result)
                new_state = get_page_state()
                if new_state:
                    graph[current_state].append(new_state)
                    explore_page(max_depth, current_depth + 1)
                driver.back()
            except Exception as e:
                print(f"Error interacting with OCR element: {e}")
                driver.back()
    else:  # 使用UI树
        for element in ui_elements:
            try:
                element_id = element.get_attribute('resource-id') or element.get_attribute('name')
                print(f"Interacting with element: {element_id}")

                if element.get_attribute('clickable') == 'true':
                    element.click()
                    time.sleep(0.5)
                    new_page_name = get_page_name()
                    result = f"Navigated to {new_page_name}" if new_page_name != page_name else "No navigation"
                    record_test_step(page_name, element, "click", result)
                    new_state = get_page_state()
                    if new_state:
                        graph[current_state].append(new_state)
                        explore_page(max_depth, current_depth + 1)
                    driver.back()
            except Exception as e:
                print(f"Error interacting with element: {e}")
                driver.back()


# 开始探索
explore_page(max_depth=10)

# 保存测试步骤和路径图
with open('test_steps_ocr.json', 'w', encoding='utf-8') as f:
    json.dump(test_steps, f, ensure_ascii=False, indent=4)
with open('ui_graph_ocr.json', 'w', encoding='utf-8') as f:
    json.dump(graph, f, ensure_ascii=False, indent=4)

# 关闭驱动
driver.quit()
