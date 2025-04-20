import re

def ddl_to_markdown(ddl):
    # 正则表达式匹配表名和列定义
    table_pattern = re.compile(r'CREATE TABLE (\w+)\s*\((.*?)\)\s*(?:WITH\s*\(.*?\))?;', re.DOTALL)
    column_pattern = re.compile(r'(\w+)\s+([\w\(\)]+)\s*([^,]*)')

    # 正则表达式匹配注释信息
    comment_table_pattern = re.compile(r"COMMENT ON TABLE (\w+) IS '([^']+)';")
    comment_column_pattern = re.compile(r"COMMENT ON COLUMN (\w+\.\w+) IS '([^']+)';")

    # 存储注释信息
    comments = {}

    # 提取表注释
    for table_match in comment_table_pattern.findall(ddl):
        table_name = table_match[0]
        table_comment = table_match[1]
        comments[table_name] = {"table_comment": table_comment, "columns": {}}

    # 提取列注释
    for column_match in comment_column_pattern.findall(ddl):
        table_column = column_match[0]
        column_comment = column_match[1]
        table_name, column_name = table_column.split('.')
        if table_name not in comments:
            comments[table_name] = {"table_comment": "", "columns": {}}
        comments[table_name]["columns"][column_name] = column_comment

    markdown = []

    for table_match in table_pattern.findall(ddl):
        table_name = table_match[0]
        columns = table_match[1].strip().split('\n')

        # 添加表注释
        table_comment = comments.get(table_name, {}).get("table_comment", "")
        markdown.append(f"## Table: `{table_name}`\n")
        if table_comment:
            markdown.append(f"**表注释**: {table_comment}\n\n")
        markdown.append("| 列名 | 数据类型 | 约束 | 注释 |")
        markdown.append("|-------------|-----------|-------------|-------------|")

        for column in columns:
            column = column.strip()
            if not column:
                continue
            column_match = column_pattern.match(column)
            if column_match:
                col_name = column_match.group(1)
                col_type = column_match.group(2)
                col_constraints = column_match.group(3).strip()
                # 获取列注释
                col_comment = comments.get(table_name, {}).get("columns", {}).get(col_name, "")
                markdown.append(f"| `{col_name}` | `{col_type}` | `{col_constraints}` | {col_comment} |")

        markdown.append("\n")

    return "\n".join(markdown)

def read_ddl_file(file_path):
    """读取 DDL 文件内容"""
    with open(file_path, 'r', encoding='utf-8') as file:
        return file.read()

def save_markdown_file(markdown, output_path):
    """将 Markdown 内容保存到文件"""
    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(markdown)

# 示例：读取 DDL 文件
ddl_file_path = 'ddl_namespace_testserver_devcxyh_20250108112356.sql'  # 替换为你的 DDL 文件路径
output_markdown_path = 'schema.md'  # 输出的 Markdown 文件路径

# 读取 DDL 文件内容
ddl_content = read_ddl_file(ddl_file_path)

# 转换为 Markdown
markdown_content = ddl_to_markdown(ddl_content)

# 保存 Markdown 文件
save_markdown_file(markdown_content, output_markdown_path)

print(f"Markdown 文件已生成: {output_markdown_path}")