import pandas as pd
import openai

# 设置 OpenAI API Key（需替换为你的 API Key）
openai.api_key = "sk-*"
openai.api_base = "https://text.pollinations.ai/openai/"
# 读取 Excel 文件
df = pd.read_excel('./附件4：金科研发云测试平台二期项目-功能拆分表20250318.xlsx')

# 获取数据模式的参考行（假设前 5 行是完整的）
reference_rows = df.iloc[:5].values.tolist()

# AI 分析和数据补全函数
def ai_fill_missing_data(row):
    if pd.isnull(row).any():  # 检查是否有缺失值
        prompt = f"以下是一些示例数据：{reference_rows}\n\n请根据示例数据补充以下缺失数据：{row}"
        response = openai.ChatCompletion.create(
            model="gpt-4",  # 可选模型
            messages=[
                {"role": "system", "content": "你是一个专业的数据分析师，请根据提供的示例数据，补充缺失的数据。"},
                {"role": "user", "content": prompt}
            ]
        )
        filled_data = response['choices'][0]['message']['content'].strip().split(',')
        return filled_data
    return row

# 对每一行进行数据补充
df.iloc[5:] = df.iloc[5:].apply(ai_fill_missing_data, axis=1)

# 导出补全后的数据
df.to_excel('./补全后的数据.xlsx', index=False)

print("数据补全完成，已导出至 '补全后的数据.xlsx'")
