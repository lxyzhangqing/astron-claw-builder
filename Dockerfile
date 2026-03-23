FROM ubuntu:26.04

# 安装nodejs、常用工具、中文字体、以及依赖
RUN apt-get update &&  \
    apt-get install -y \
    nodejs \
    npm \
    git \
    vim \
    pip \
    net-tools \
    iputils-ping \
    wget \
    curl \
    jq \
    util-linux \
    gnupg2 \
    fonts-wqy-microhei \
    fonts-wqy-zenhei \
    xfonts-wqy \
    libnss3 \
    libxss1 \
    libatk-bridge2.0-0 \
    libgtk-3-0

# 安装yarn和pnpm
RUN npm install -g yarn && npm install -g pnpm

# 安装 Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update &&  \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

