# import sqlparse
# import xml.etree.ElementTree as ET
#
# # 从文件读取 DDL
# def read_ddl_from_file(file_path):
#     with open(file_path, 'r') as file:
#         return file.read()
#
# # 解析 DDL
# def parse_ddl(ddl):
#     tables = {}
#     parsed = sqlparse.parse(ddl)
#     for statement in parsed:
#         if statement.get_type() == 'CREATE':
#             for token in statement.tokens:
#                 if isinstance(token, sqlparse.sql.Identifier):
#                     table_name = token.get_real_name()
#                     tables[table_name] = {'columns': []}
#                 elif isinstance(token, sqlparse.sql.Parenthesis):
#                     columns = token.value.strip('()').split(',')
#                     for col in columns:
#                         col = col.strip()
#                         if col.upper().startswith('PRIMARY KEY'):
#                             # 提取主键字段
#                             pk = col.split('(')[1].strip(')')
#                             tables[table_name]['primary_key'] = pk
#                         elif col.upper().startswith('FOREIGN KEY'):
#                             # 提取外键字段
#                             fk = col.split('(')[1].split(')')[0].strip()
#                             ref_table = col.split('REFERENCES')[1].split('(')[0].strip()
#                             ref_col = col.split('REFERENCES')[1].split('(')[1].strip(')').strip()
#                             tables[table_name]['foreign_keys'] = (fk, ref_table, ref_col)
#                         else:
#                             # 提取普通字段
#                             col_name = col.split()[0]
#                             tables[table_name]['columns'].append(col_name)
#     return tables
#
# # 推断表之间的关系
# def infer_relationships(tables):
#     relationships = []
#     table_names = list(tables.keys())
#     for i in range(len(table_names)):
#         for j in range(i + 1, len(table_names)):
#             table1 = table_names[i]
#             table2 = table_names[j]
#             common_fields = set(tables[table1]['columns']).intersection(set(tables[table2]['columns']))
#             if common_fields:
#                 for field in common_fields:
#                     relationships.append((table1, table2, field))
#     return relationships
#
# # 生成 Draw.io 文件
# def generate_drawio_file(tables, relationships, output_file):
#     # 创建根元素
#     mxfile = ET.Element("mxfile")
#     diagram = ET.SubElement(mxfile, "diagram", name="Page-1")
#     mxGraphModel = ET.SubElement(diagram, "mxGraphModel")
#     root = ET.SubElement(mxGraphModel, "root")
#
#     # 添加默认单元格
#     ET.SubElement(root, "mxCell", id="0")
#     ET.SubElement(root, "mxCell", id="1", parent="0")
#
#     # 添加表节点
#     table_positions = {}
#     x, y = 120, 80
#     for table_name, details in tables.items():
#         table_positions[table_name] = (x, y)
#         # 创建表节点
#         table_node = ET.SubElement(
#             root,
#             "mxCell",
#             id=f"table_{table_name}",
#             value=table_name,
#             style="shape=rectangle;",
#             vertex="1",
#             parent="1"
#         )
#         # 设置表节点的位置和大小
#         table_geometry = ET.SubElement(table_node, "mxGeometry", x=str(x), y=str(y), width="120", height="60", as="geometry")
#         # 添加字段
#         for col in details['columns']:
#             field_node = ET.SubElement(
#                 root,
#                 "mxCell",
#                 id=f"field_{table_name}_{col}",
#                 value=col,
#                 style="text;",
#                 vertex="1",
#                 parent="1"
#             )
#             field_geometry = ET.SubElement(field_node, "mxGeometry", x=str(x + 10), y=str(y + 30), width="100", height="20",
#             as="geometry")
#         y += 100  # 调整下一个表的位置
#
#     # 添加关系边
#     for rel in relationships:
#         table1, table2, field = rel
#         x1, y1 = table_positions[table1]
#         x2, y2 = table_positions[table2]
#         edge = ET.SubElement(
#             root,
#             "mxCell",
#             id=f"edge_{table1}_{table2}",
#             value=field,
#             edge="1",
#             parent="1",
#             source=f"table_{table1}",
#             target=f"table_{table2}"
#         )
#         edge_geometry = ET.SubElement(edge, "mxGeometry", relative="1", as="geometry")
#
#     # 保存为 .drawio 文件
#     tree = ET.ElementTree(mxfile)
#     tree.write(output_file, encoding="utf-8", xml_declaration=True)
#
# # 主程序
# if __name__ == '__main__':
#     # 从文件读取 DDL
#     ddl_file_path = 'ddl_namespace_testserver_devcxyh_20250108112356.sql'  # 替换为你的 DDL 文件路径
#     ddl = read_ddl_from_file(ddl_file_path)
#
#     # 解析 DDL
#     tables = parse_ddl(ddl)
#
#     # 推断表之间的关系
#     relationships = infer_relationships(tables)
#
#     # 生成 Draw.io 文件
#     output_file = 'er_diagram.drawio'
#     generate_drawio_file(tables, relationships, output_file)
#     print(f"Draw.io 文件已生成: {output_file}")