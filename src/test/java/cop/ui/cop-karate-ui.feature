Feature: Sauce Web


  Scenario: Realizar compra exitosa
    * driver 'https://www.saucedemo.com/'
    * input('#user-name','standard_user')
    * input('#password','secret_sauce')
    * click('#login-button')
    * delay(1000).screenshot()
    * if(!exists("//div[@class='app_logo']")) karate.fail('El logo de la Home Page no existe')
    * if(!exists("//div[@class='app_logo']")) karate.fail('El logo de la Home Page no existe')