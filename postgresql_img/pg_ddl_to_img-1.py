import sqlparse
from graphviz import Digraph
import re
from collections import defaultdict


def read_ddl_from_file(file_path):
    """从文件读取 DDL"""
    try:
        with open(file_path, 'r') as file:
            return file.read()
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
        return None


def parse_ddl(ddl):
    """解析 DDL，提取表结构"""
    tables = {}
    parsed = sqlparse.parse(ddl)
    for statement in parsed:
        if statement.get_type() == 'CREATE':
            table_name = None
            for token in statement.tokens:
                if isinstance(token, sqlparse.sql.Identifier):
                    table_name = token.get_real_name()
                    tables[table_name] = {'columns': [], 'primary_keys': [], 'foreign_keys': []}
                elif isinstance(token, sqlparse.sql.Parenthesis):
                    columns = token.value.strip('()').split(',')
                    for col in columns:
                        col = col.strip()
                        if col.upper().startswith('PRIMARY KEY'):
                            # 提取主键字段（支持多列主键）
                            pk_columns = col.split('(')[1].strip(')').split(',')
                            tables[table_name]['primary_keys'] = [col.strip() for col in pk_columns]
                        elif col.upper().startswith('FOREIGN KEY'):
                            # 提取外键字段（支持多列外键）
                            fk_match = re.match(
                                r'FOREIGN KEY\s*\((.*?)\)\s*REFERENCES\s*(.*?)\s*\((.*?)\)',
                                col,
                                re.IGNORECASE
                            )
                            if fk_match:
                                fk_columns = fk_match.group(1).strip().split(',')
                                ref_table = fk_match.group(2).strip()
                                ref_columns = fk_match.group(3).strip().split(',')
                                tables[table_name]['foreign_keys'].append((fk_columns, ref_table, ref_columns))
                        else:
                            # 提取普通字段
                            col_name = col.split()[0]
                            tables[table_name]['columns'].append(col_name)
    return tables


def infer_relationships(tables):
    """推断表之间的关系（通过主键和外键）"""
    relationships = []
    for table_name, details in tables.items():
        # 通过外键推断关系
        for fk in details['foreign_keys']:
            fk_columns, ref_table, ref_columns = fk
            relationships.append((table_name, ref_table, ', '.join(fk_columns)))

        # 通过主键推断关系
        for pk in details['primary_keys']:
            for other_table, other_details in tables.items():
                if other_table != table_name and pk in other_details['columns']:
                    relationships.append((table_name, other_table, pk))

        # 通过字段名匹配推断隐式关系
        for col in details['columns']:
            for other_table, other_details in tables.items():
                if other_table != table_name and col in other_details['primary_keys']:
                    relationships.append((table_name, other_table, col))

    return relationships


def group_tables_by_prefix(tables):
    """按表名前缀分组"""
    groups = defaultdict(list)
    for table_name in tables.keys():
        prefix = table_name.split('_')[0]  # 按第一个下划线前的部分分组
        groups[prefix].append(table_name)
    return groups


def draw_er_diagram(tables, relationships, groups):
    """绘制 ER 图，支持分组并用横线分割，只显示主键字段"""
    dot = Digraph(comment='ER Diagram', format='pdf', engine='dot')

    # 设置布局方向为从上到下
    dot.attr(rankdir='TB')

    # 让连线更平滑，避免节点重叠
    dot.attr(splines='ortho')  # 使用正交连线
    dot.attr(overlap='false')
    dot.attr(nodesep='0.5')  # 节点之间的间距
    dot.attr(ranksep='1.0')  # 层级之间的间距

    # 添加表节点（跳过没有字段的表）
    for group_name, table_names in groups.items():
        with dot.subgraph(name=f'cluster_{group_name}') as subgraph:
            subgraph.attr(label=group_name, style='dashed', color='blue')  # 分组框样式
            for table_name in table_names:
                details = tables[table_name]
                if not details['columns']:  # 如果表没有字段，跳过
                    continue
                label = f"{table_name}\n"
                # 只显示主键字段
                if details['primary_keys']:
                    for pk in details['primary_keys']:
                        label += f"<{pk}> {pk} (PK)\n"
                else:
                    label += "(No primary key)\n"
                # 其他字段用 ... 代替
                if details['columns']:
                    label += "..."
                subgraph.node(table_name, label=label, shape='box', fontsize='10', width='1.5', height='0.5')

    # 添加关系边
    for rel in relationships:
        table1, table2, field = rel
        if table1 in tables and table2 in tables:  # 只绘制当前分组内的关系
            dot.edge(table1, table2, label=field, fontsize='8')

    # 保存并显示图形
    output_file = 'er_diagram_combined'
    dot.render(output_file, view=True)
    print(f"ER diagram saved to {output_file}.pdf")


if __name__ == '__main__':
    # 从文件读取 DDL
    ddl_file_path = 'ddl_namespace_testserver_devcxyh_20250108112356.sql'  # 替换为你的 DDL 文件路径
    ddl = read_ddl_from_file(ddl_file_path)

    if ddl:
        # 解析 DDL
        tables = parse_ddl(ddl)
        print(f"Parsed {len(tables)} tables.")

        # 推断表之间的关系
        relationships = infer_relationships(tables)
        print(f"Inferred {len(relationships)} relationships.")

        # 按表名前缀分组
        table_groups = group_tables_by_prefix(tables)
        print(f"Grouped tables into {len(table_groups)} groups.")

        # 绘制合并的 ER 图
        draw_er_diagram(tables, relationships, table_groups)