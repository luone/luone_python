import pandas as pd
df_columns = pd.read_csv("1.csv")

print(df_columns.index)
print(df_columns.columns)
print(df_columns.loc[0,"职务"])