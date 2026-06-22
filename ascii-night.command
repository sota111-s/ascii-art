#!/bin/bash

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Homebrewをインストールしています..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install chafa if not present
if ! command -v chafa &>/dev/null; then
    echo "chafaをインストールしています..."
    brew install chafa
fi

CHAFA=$(command -v chafa)
COLS=$(tput cols)
ROWS=$(( $(tput lines) - 4 ))

while true; do
    echo "画像ファイルをここにドラッグ＆ドロップしてEnter (終了: Ctrl+C):"
    read -r FILE
    FILE="${FILE//\\ / }"
    [ -n "$FILE" ] && "$CHAFA" --fg-only --fg white --symbols ascii -s ${COLS}x${ROWS} "$FILE"
done
