const axios = require("axios");
const fs = require("fs");
const prettier = require("prettier");
const path = require("path");

// 下载文件
const downloadFile = async (url, destPath) => {
  const response = await axios({
    method: "get",
    url: url,
    responseType: "stream",
  });

  return new Promise((resolve, reject) => {
    const writer = fs.createWriteStream(destPath);
    response.data.pipe(writer);
    writer.on("finish", resolve);
    writer.on("error", reject);
  });
};

// 设置文件 URL 和文件路径
const fileUrl = "https://example.com/path/to/your-file.js"; // 修改为实际文件 URL
const inputFilePath = path.join(__dirname, "your-file.js");
const outputFilePath = path.join(__dirname, "formatted-file.js");

// 下载文件
downloadFile(fileUrl, inputFilePath)
  .then(() => {
    // 读取文件内容
    const code = fs.readFileSync(inputFilePath, "utf-8");

    // 使用 Prettier 格式化代码
    const formattedCode = prettier.format(code, {
      semi: true, // 使用分号
      singleQuote: true, // 使用单引号
      tabWidth: 2, // 缩进为2个空格
    });

    // 将格式化后的代码写入新的文件
    fs.writeFileSync(outputFilePath, formattedCode);

    console.log(`代码已格式化并保存至 ${outputFilePath}`);
  })
  .catch((error) => {
    console.error("文件下载失败:", error);
  });
