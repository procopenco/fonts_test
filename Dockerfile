FROM node

RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Install puppeteer
RUN npm install puppeteer

RUN apt-get update && \
    apt-get install -y libxss1

ADD . /app
WORKDIR /app
RUN cp ppp/* /usr/share/fonts/truetype/
RUN fc-cache -fv

RUN fc-list | grep -i chap
# RUN ldd /node_modules/puppeteer/.local-chromium/linux-768783/chrome-linux/chrome | grep not
