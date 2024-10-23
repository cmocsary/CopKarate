function fn() {

    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);

    var config = {
            baseUrl: 'https://www.saucedemo.com/',
            name: 'standard_user',
            pass: 'secret_sauce',
            driver: {
                type: 'chromedriver',
                headless: false,
                start: true,
                showDriverLog: true,
                webDriverUrl: null,
                executable: './drivers/chromedriver.exe',
                //port: 9223,
                capabilities: {
                            'alwaysMatch':{
                            'browserName':'chrome',
                            'goog:chromeOptions': {
                                args: ['--disable-infobars', '--window-size=1200,800']
                                //addOptions: ['--disable-save-password-bubble'] deshabilitar password chrome
                            }
                        }

                }
            }
        };
    return config;
}
