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
        
        # 检查并保留字体配置文件
        FONT_CONFIG_FILE="$dir/options/font.options.xml"
        if [ -f "$FONT_CONFIG_FILE" ]; then
            echo "🔍 检测到字体配置文件，跳过修改以保留中文设置"
            continue
        fi
        
        # 使用更精确的XML操作方式修改SessionID
        if [ -f "$IDE_GENERAL_FILE" ]; then
            # 备份原文件
            cp "$IDE_GENERAL_FILE" "$IDE_GENERAL_FILE.backup.$(date +'%Y%m%d_%H%M%S')"
            
            # 使用xmlstarlet精确修改节点
            if xmlstarlet sel -t -v "//property[@name='augment.session.id']/@value" "$IDE_GENERAL_FILE" > /dev/null 2>&1; then
                xmlstarlet ed -L -u "//property[@name='augment.session.id']/@value" -v "$CUSTOM_SESSION_ID" "$IDE_GENERAL_FILE"
            else
                xmlstarlet ed -L -s "/application/component" -t elem -n property -v "" \
                    -i "/application/component/property[last()]" -t attr -n name -v "augment.session.id" \
                    -i "/application/component/property[last()]" -t attr -n value -v "$CUSTOM_SESSION_ID" \
                    "$IDE_GENERAL_FILE"
            fi
        else
            echo " ℹ️ 创建新配置文件: $IDE_GENERAL_FILE"
            xmlstarlet ed -L -s "/application/component" -t elem -n property -v "" \
                -i "/application/component/property[last()]" -t attr -n name -v "augment.session.id" \
                -i "/application/component/property[last()]" -t attr -n value -v "$CUSTOM_SESSION_ID" \
                "$IDE_GENERAL_FILE"
        fi
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