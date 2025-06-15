# Free Augment Code - SessionID 修改工具 v1.2.0

[![Version](https://img.shields.io/badge/version-v1.2.0-blue.svg)](https://github.com/your-repo/free-augmentcode)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-macOS-lightgrey.svg)](https://www.apple.com/macos/)

[English](#english) | [中文](#中文)

---

## 中文

### 📖 项目简介

这是一个用于快速修改 JetBrains 系列产品（特别是 PyCharm）SessionID 的 macOS Shell 脚本工具。该工具可以无限续杯 Augment Code。

### ✨ 主要功能

- 🔄 **自动生成 SessionID**：如果未提供自定义 SessionID，工具会自动生成一个随机 UUID
- 🎯 **智能检测**：自动检测并处理所有已安装的 PyCharm 版本
- 💾 **安全备份**：修改前自动备份原配置文件
- 🖥️ **macOS 优化**：专为 macOS 系统优化的配置路径处理

### 🚀 使用方法

#### 基本用法

```bash
# 自动生成随机 SessionID
./src/pycharm_augment_sessionid-free.sh

# 使用自定义 SessionID
./src/pycharm_augment_sessionid-free.sh "your-custom-session-id"
```

#### 安装步骤

1. 克隆或下载此项目
2. 给脚本添加执行权限：
   ```bash
   chmod +x src/pycharm_augment_sessionid-free.sh
   ```
3. 运行脚本

### 📋 系统要求

- macOS 系统
- 已安装 JetBrains PyCharm（任意版本）
- zsh shell（macOS 默认）

### ⚠️ 注意事项

1. **重启应用**：修改后需要重启 JetBrains 产品以使配置生效
2. **备份保护**：原配置文件会自动备份，文件名包含时间戳
3. **恢复方法**：如需恢复，可以删除相关配置或使用备份文件
4. **其他注意事项**：运行前必须退出augment code账号

### 📁 项目结构

```
free-augmentcode/
├── src/
│   └── pycharm_augment_sessionid-free.sh  # 主要脚本文件 v1.2.0
├── change.md                               # 版本变更记录
├── LICENSE                                 # MIT 许可证
└── README.md                              # 项目说明文档
```

### 📊 版本信息

- **当前版本**: v1.2.0
- **发布日期**: 2025-06-15
- **兼容性**: macOS 10.15+ / PyCharm 2020.1+

---

## English

### 📖 Project Description

This is a macOS Shell script tool for quickly modifying the SessionID of JetBrains products (especially PyCharm). This tool can refill Augment Code infinitely.

### ✨ Key Features

- 🔄 **Auto-generate SessionID**: Automatically generates a random UUID if no custom SessionID is provided
- 🎯 **Smart Detection**: Automatically detects and processes all installed PyCharm versions
- 💾 **Safe Backup**: Automatically backs up original configuration files before modification
- 🖥️ **macOS Optimized**: Optimized configuration path handling for macOS systems

### 🚀 Usage

#### Basic Usage

```bash
# Auto-generate random SessionID
./src/pycharm_augment_sessionid-free.sh

# Use custom SessionID
./src/pycharm_augment_sessionid-free.sh "your-custom-session-id"
```

#### Installation Steps

1. Clone or download this project
2. Add execute permission to the script:
   ```bash
   chmod +x src/pycharm_augment_sessionid-free.sh
   ```
3. Run the script

### 📋 System Requirements

- macOS system
- JetBrains PyCharm installed (any version)
- zsh shell (macOS default)

### ⚠️ Important Notes

1. **Restart Application**: Restart JetBrains products after modification for changes to take effect
2. **Backup Protection**: Original configuration files are automatically backed up with timestamps
3. **Recovery Method**: To restore, delete related configurations or use backup files
4. **Other Considerations**: Before running, make sure to log out of Augment Code

### 📁 Project Structure

```
free-augmentcode/
├── src/
│   └── pycharm_augment_sessionid-free.sh  # Main script file v1.2.0
├── change.md                               # Version changelog
├── LICENSE                                 # MIT License
└── README.md                              # Project documentation
```

### 📊 Version Information

- **Current Version**: v1.2.0
- **Release Date**: 2025-06-15
- **Compatibility**: macOS 10.15+ / PyCharm 2020.1+

### 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Made with ❤️ for the developer community**
