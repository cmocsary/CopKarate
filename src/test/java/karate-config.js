function fn() {
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);

    return {
        api: {
           baseUrl: 'https://www.saucedemo.com/'
        },
        user: {
            name: 'karate'
        }
    };
}