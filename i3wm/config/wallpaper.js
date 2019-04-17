const http = require('http');
const fs = require('fs');
const path = require('path');
const applicationParams = process.argv.splice(2);
const getJson = url => new Promise((resolve, reject) => {
    http.get(url, res => {
        const {statusCode} = res;
        const contentType = res.headers['content-type'];

        let error;
        if (statusCode !== 200) {
            error = new Error('请求失败\n' +
                `状态码: ${statusCode}`);
        } else if (!/^application\/json/.test(contentType)) {
            error = new Error('无效的 content-type.\n' +
                `期望的是 application/json 但接收到的是 ${contentType}`);
        }
        if (error) {
            reject(error.message);
            // 消费响应数据来释放内存。
            res.resume();
            return;
        }

        res.setEncoding('utf8');
        let rawData = '';
        res.on('data', (chunk) => {
            rawData += chunk;
        });
        res.on('end', () => {
            try {
                const parsedData = JSON.parse(rawData);
                resolve(parsedData);
            } catch (e) {
                reject(e.message);
            }
        });
    }).on('error', (e) => {
        reject(`出现错误: ${e.message}`);
    });
});
const download = (url, filePath) => new Promise((resolve, reject) => {
    http.get(url, res => {
        const {statusCode} = res;
        let error;
        if (statusCode !== 200) {
            error = new Error('请求失败\n' +
                `状态码: ${statusCode}`);
        }
        if (error) {
            reject(error.message);
            // 消费响应数据来释放内存。
            res.resume();
            return;
        }
        const imageName = (Math.random() * 10000 % 49).toString(32).substr(3) + '.jpg';
        const imagePath = path.join(filePath, imageName);
        const imageStream = fs.createWriteStream(imagePath);
        res.pipe(imageStream);
        resolve();
    }).on('error', (e) => {
        reject(`出现错误: ${e.message}`);
    });
});
const error = err => {
    const errorPath = path.join(__dirname, 'error.info');
    fs.writeFileSync(errorPath, err);
};
const clear = dirPath => {
    const list = fs.readdirSync(dirPath);
    if (list.length > 0) {
        list.forEach(item => {
            const filePath = path.join(dirPath, item);
            if (fs.statSync(filePath).isFile()) {
                const extname = path.extname(filePath);
                if (['.jpg', '.png'].includes(extname)) {
                    fs.unlinkSync(filePath);
                }
            }
        });
    }
};
const random = max => Math.ceil(Math.random() * 10000) % max;

const main = async imagePath => {
    const start = 1;
    const count = 500;
    const url = `http://wallpaper.apc.360.cn/index.php?c=WallPaper&a=getAppsByOrder&order=create_time&start=${start}&count=${count}&from=360chrome`;
    const rs = await getJson(url);
    const data = rs.data;
    if (data && data.length > 0) {
        clear(imagePath);
        for (let i = 0; i < 10; i++) {
            const index = random(data.length - 1);
            const imageUrl = data[index]['img_1600_900'];
            try {
                await download(imageUrl, imagePath);
            } catch (err) {
                error(`download  ${imageUrl} error \n\t ` + (err.message || err));
            }
        }
    }
};

(function () {

    const imagePath = applicationParams[0];
    const time = applicationParams[1] || 10; //以秒为单位, 默认10秒
    let isExists = false;
    if (fs.existsSync(imagePath)) {
        isExists = fs.statSync(imagePath).isDirectory();
    }
    if (isExists === false) {
        try {
            fs.mkdirSync(imagePath);//同步创建目录
        } catch (err) {
            error(`create dir error : ` + (err.message || err));
            process.exit(1);
        }
    }
    main(imagePath).then();
    setInterval(() => main(imagePath).then(), time * 10 * 1000);
})();

// run demo : node ./wallpaper.js ~/Files/images/ 10
