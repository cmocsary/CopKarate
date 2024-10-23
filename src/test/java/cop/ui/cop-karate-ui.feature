Feature: cop-karate-ui

  Background:
    * configure driver = driver
    * driver baseUrl
    * call read 'locators.json'


  Scenario: Login exitoso
    Given input(login.userInput, name)
    And input(login.passInput, pass)
    And click('#login-button')
    * delay(1000).screenshot()
    Then if(!exists("//div[@class='app_logo']")) karate.fail('El logo de la Home Page no existe')

  Scenario: Realizar compra exitosa
    Given input(login.userInput, name)
    And input(login.passInput, pass)
    And click('#login-button')
    * delay(1000).screenshot()
    Then if(!exists("//div[@class='app_logo']")) karate.fail('El logo de la Home Page no existe')
    * def buttonProduct = "#add-to-cart-sauce-labs-backpack"
    * if(!exists(buttonProduct)) karate.fail('El producto Sauce Labs Backpack no existe')
    Then click(buttonProduct)
    And click("#shopping_cart_container")
    And if(!exists("//div[@class='cart_list']//div[text()='Sauce Labs Backpack']")) karate.fail('El producto no aparece en el carrito')
    And click('#checkout')
    And input('#first-name', 'Homer')
    And input('#last-name', 'Simpson')
    And input('#postal-code')
    And click('#continue')
    * click('#finish')
    Then if(!exists('//h2[text()="Thank you for your order!"')) karate.fail('No aparece el mensaje de compra exitoso')
    And click('#react-burger-menu-btn')
    And click('#logout_sidebar_link')
