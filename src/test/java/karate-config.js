function fn() {
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);

    return {
        web: {
           baseUrl: 'https://www.saucedemo.com/'
        },
        user: {
            name: 'standard_user',
            pass: 'secret_sauce'
        }
    };
}