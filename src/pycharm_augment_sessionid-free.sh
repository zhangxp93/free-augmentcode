#!/bin/zsh
# macOS Shell版本的SessionID快速修改工具

echo "🔧 macOS SessionID快速修改工具"
echo "==============================="
if [ -z "$1" ]; then
    echo " ℹ️ 未提供自定义SessionID，将自动生成一个随机UUID."
    CUSTOM_SESSION_ID=$(uuidgen)
    echo " 💎 生成的UUID: $CUSTOM_SESSION_ID"
else
    CUSTOM_SESSION_ID="$1"
fi

# 获取JetBrains配置基础目录
CONFIG_BASE="$HOME/Library/Application Support/JetBrains"

echo "检测到操作系统: macOS"
echo "配置目录: $CONFIG_BASE"

if [ ! -d "$CONFIG_BASE" ]; then
    echo "❌ 未找到JetBrains配置目录: $CONFIG_BASE"
    echo "请确保JetBrains系列产品已安装并至少运行过一次"
    exit 1
fi

echo
echo "🔍 查找JetBrains产品配置目录..."

# 查找所有可能的PyCharm版本目录
for dir in "$CONFIG_BASE"/PyCharm*; do
    if [ -d "$dir" ]; then
        VERSION_DIR=$(basename "$dir")
        
        echo
        echo "🔄 处理版本: $VERSION_DIR"
        
        OPTIONS_DIR="$dir/options"
        if [ ! -d "$OPTIONS_DIR" ]; then
            mkdir -p "$OPTIONS_DIR"
        fi
        
        IDE_GENERAL_FILE="$OPTIONS_DIR/ide.general.xml"
        
        if [ -f "$IDE_GENERAL_FILE" ]; then
            OLD_SESSION_ID=$(grep -o 'value="[^"]*"' "$IDE_GENERAL_FILE" | head -1 | sed 's/value="//;s/"//')
            if [ -n "$OLD_SESSION_ID" ]; then
                echo "🔍 旧 SessionID: $OLD_SESSION_ID"
            else
                echo " ℹ️ 未找到旧的 SessionID。"
            fi
            
            # 备份原文件
            cp "$IDE_GENERAL_FILE" "$IDE_GENERAL_FILE.backup.$(date +'%Y%m%d_%H%M%S')"
        else
            echo " ℹ️ 创建新配置文件: $IDE_GENERAL_FILE"
        fi
        
        # 写入新的SessionID
        cat > "$IDE_GENERAL_FILE" << EOL
<application>
  <component name="PropertiesComponent">
    <property name="augment.session.id" value="$CUSTOM_SESSION_ID" />
  </component>
</application>
EOL
        
        echo "✅ 已设置SessionID: $CUSTOM_SESSION_ID"
    fi
done

echo
echo "🎉 SessionID修改完成!"
echo
echo "📋 注意事项:"
echo "1. 请重启JetBrains系列产品以使配置生效"
echo "2. 原配置文件已备份（如果存在）"
echo "3. 如需恢复，可以删除相关配置或使用备份文件"
echo
echo "🔍 验证方法:"
echo "重启JetBrains产品后，新的SessionID将在下次API调用时生效"