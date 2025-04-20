import sqlparse
from graphviz import Digraph


# 从文件读取 DDL
def read_ddl_from_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()


# 解析 DDL
def parse_ddl(ddl):
    tables = {}
    parsed = sqlparse.parse(ddl)
    for statement in parsed:
        if statement.get_type() == 'CREATE':
            for token in statement.tokens:
                if isinstance(token, sqlparse.sql.Identifier):
                    table_name = token.get_real_name()
                    tables[table_name] = {'columns': []}
                elif isinstance(token, sqlparse.sql.Parenthesis):
                    columns = token.value.strip('()').split(',')
                    for col in columns:
                        col = col.strip()
                        if col.upper().startswith('PRIMARY KEY'):
                            # 如果有主键，可以提取主键字段
                            pk = col.split('(')[1].strip(')')
                            tables[table_name]['primary_key'] = pk
                        elif col.upper().startswith('FOREIGN KEY'):
                            # 如果有外键，可以提取外键字段
                            fk = col.split('(')[1].split(')')[0].strip()
                            ref_table = col.split('REFERENCES')[1].split('(')[0].strip()
                            ref_col = col.split('REFERENCES')[1].split('(')[1].strip(')').strip()
                            tables[table_name]['foreign_keys'] = (fk, ref_table, ref_col)
                        else:
                            # 提取普通字段
                            col_name = col.split()[0]
                            tables[table_name]['columns'].append(col_name)
    return tables


# 推断表之间的关系
def infer_relationships(tables):
    relationships = []
    table_names = list(tables.keys())
    for i in range(len(table_names)):
        for j in range(i + 1, len(table_names)):
            table1 = table_names[i]
            table2 = table_names[j]
            common_fields = set(tables[table1]['columns']).intersection(set(tables[table2]['columns']))
            if common_fields:
                for field in common_fields:
                    relationships.append((table1, table2, field))
    return relationships


# 绘制关系图
def draw_er_diagram(tables, relationships):
    dot = Digraph(comment='ER Diagram', format='png')

    # 添加表节点
    for table_name, details in tables.items():
        label = f"{table_name}\n"
        for col in details['columns']:
            label += f"{col}\n"
        dot.node(table_name, label=label, shape='box')

    # 添加关系边
    for rel in relationships:
        table1, table2, field = rel
        dot.edge(table1, table2, label=field)

    # 保存并显示图形
    dot.render('er_diagram', view=True)


# 主程序
if __name__ == '__main__':
    # 从文件读取 DDL
    ddl_file_path = 'ddl_namespace_testserver_devcxyh_20250108112356.sql'  # 替换为你的 DDL 文件路径
    ddl = read_ddl_from_file(ddl_file_path)

    # 解析 DDL
    tables = parse_ddl(ddl)

    # 推断表之间的关系
    relationships = infer_relationships(tables)

    # 绘制 ER 图
    draw_er_diagram(tables, relationships)