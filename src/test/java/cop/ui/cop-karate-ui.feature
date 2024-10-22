Feature: cop-karate-ui

  Background:
    * driver web.baseUrl
    * def username = user.name
    * def password = user.pass
    * call read 'locators.json'

  @runTest
  Scenario: Realizar compra exitosa
    Given input(loginPage.userInput, username)
    And input(loginPage.passInput, password)
    And click(loginPage.loginButton)
    Then waitFor("//div[@class='app_logo']")

    * def buttonProduct = productPage.addToCartButton
    Then waitFor(buttonProduct)
    And click(buttonProduct)

    And click(cartPage.cartLink)
    * delay(3000)
    * karate.call('pressEnter.js')
    Then waitFor("//div[@class='cart_list']//div[text()='Sauce Labs Backpack']")
    And click(cartPage.checkoutButton)

    Then waitFor(checkoutPage.firstName)
    And waitForEnabled(checkoutPage.firstName)
    And input(checkoutPage.firstName, "Homer")

    Then waitFor(checkoutPage.lastName)
    And waitForEnabled(checkoutPage.lastName)
    And input(checkoutPage.lastName, "Simpson")

    Then waitFor(checkoutPage.postalCode)
    And waitForEnabled(checkoutPage.postalCode)
    And input(checkoutPage.postalCode, "4000")
    And click(checkoutPage.continueButton)
    And click(checkoutPage.finishButton)
    Then waitForText(checkoutPage.thankYouMessage, 'Thank you for your order!')
    And click(menuPage.burgerMenuButton)
    And click(menuPage.logoutLink)
    And quit()

  @runTest
  Scenario: Realizar login fallido
    Given input(loginPage.userInput, 'homero')
    And input(loginPage.passInput, 'simpson')
    And click(loginPage.loginButton)
    Then waitFor("//div[@class='app_logo']")