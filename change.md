# 📝 脚本变更记录 / Script Changelog

[中文](#中文) | [English](#english)

## 目录 / Table of Contents

### 中文
- [版本 v1.2.0 优化内容](#版本-v120-2025-06-15-优化内容)
- [关联文件](#关联文件)
- [版本历史](#版本历史)
- [使用建议](#使用建议)

### English
- [Version v1.2.0 Improvements](#version-v120-2025-06-15-improvements)
- [Related Files](#related-files)
- [Version History](#version-history)
- [Usage Recommendations](#usage-recommendations)

---

## 中文

##  版本 v1.2.0 (2025-06-15) 优化内容

### 🔧 功能改进
1. **字体设置保护**
   - 新增对 `font.options.xml` 的检测机制
   - 遇到字体配置文件时自动跳过修改流程

2. **XML操作优化**
   - 使用 `xmlstarlet` 实现精准节点操作
   - 支持节点值更新和缺失节点自动创建
   - 保持原有 XML 文件结构完整性

3. **备份增强**
   - 自动创建带时间戳的备份文件
   - 备份文件名格式：`ide.general.xml.backup.YYYYMMDD_HHMMSS`
   - 支持手动恢复原始配置

4. **错误预防**
   - 增加配置文件读写权限检查
   - 验证 XML 文件有效性后再修改
   - 完善错误提示信息（含恢复指引）

##  关联文件
- `pycharm_augment_sessionid-free.sh` v1.2.0
- `~/Library/Application Support/JetBrains/<PyCharm版本>/options/ide.general.xml`
- `~/Library/Application Support/JetBrains/<PyCharm版本>/options/font.options.xml`

##  版本历史

### v1.2.0 (2025-06-15)
- 新增字体设置保护机制
- 优化 XML 操作精确性
- 增强备份功能
- 完善错误预防机制

### v1.1.0 (历史版本)
- 基础 SessionID 修改功能
- macOS 系统适配
- 自动检测 PyCharm 版本

##  使用建议
1. 修改前请确认：
   - 备份重要配置文件
   - 关闭所有 JetBrains 产品
2. 运行脚本后：
   - 检查备份文件完整性
   - 验证 SessionID 更新状态
   - 重启 PyCharm 生效配置

---

## English

##  Version v1.2.0 (2025-06-15) Improvements

### 🔧 Feature Enhancements
1. **Font Settings Protection**
   - Added detection mechanism for `font.options.xml`
   - Automatically skips modification process when font configuration files are encountered

2. **XML Operation Optimization**
   - Implemented precise node operations using `xmlstarlet`
   - Supports node value updates and automatic creation of missing nodes
   - Maintains integrity of original XML file structure

3. **Backup Enhancement**
   - Automatically creates timestamped backup files
   - Backup file format: `ide.general.xml.backup.YYYYMMDD_HHMMSS`
   - Supports manual restoration of original configurations

4. **Error Prevention**
   - Added configuration file read/write permission checks
   - Validates XML file validity before modification
   - Improved error messages (including recovery guidance)

##  Related Files
- `pycharm_augment_sessionid-free.sh` v1.2.0
- `~/Library/Application Support/JetBrains/<PyCharm Version>/options/ide.general.xml`
- `~/Library/Application Support/JetBrains/<PyCharm Version>/options/font.options.xml`

##  Version History

### v1.2.0 (2025-06-15)
- Added font settings protection mechanism
- Optimized XML operation precision
- Enhanced backup functionality
- Improved error prevention mechanisms

### v1.1.0 (Historical Version)
- Basic SessionID modification functionality
- macOS system adaptation
- Automatic PyCharm version detection

##  Usage Recommendations
1. Before modification, please confirm:
   - Backup important configuration files
   - Close all JetBrains products
2. After running the script:
   - Check backup file integrity
   - Verify SessionID update status
   - Restart PyCharm to apply configuration