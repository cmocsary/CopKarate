Feature: cop-karate-ui

  Background: #antecedentes
    * configure driver = driver
    * driver baseUrl
    * call read 'locators.json'

  Scenario: Realizar compra exitosa
    Given input(loginPage.userInput, name)
    * delay(3000)
    When input(loginPage.passInput, pass)
    * delay(3000)
    And click(loginPage.loginButton)
    * delay(3000)
    Then waitFor("//div[@class='app_logo']")

    * def buttonProduct = productPage.addToCartButton
    Then waitFor(buttonProduct)
    And click(buttonProduct)
    * delay(3000)

    And click(cartPage.cartLink)
    * delay(3000)
    Then waitFor("//div[@class='cart_list']//div[text()='Sauce Labs Backpack']")
    * delay(3000)
    And click(cartPage.checkoutButton)

    Then waitFor(checkoutPage.firstName)
    And waitForEnabled(checkoutPage.firstName)
    * delay(3000)
    And input(checkoutPage.firstName, "Homer")

    Then waitFor(checkoutPage.lastName)
    And waitForEnabled(checkoutPage.lastName)
    * delay(3000)
    And input(checkoutPage.lastName, "Simpson")

    Then waitFor(checkoutPage.postalCode)
    And waitForEnabled(checkoutPage.postalCode)
    * delay(3000)
    And input(checkoutPage.postalCode, "4000")

    * delay(3000)
    And click(checkoutPage.continueButton)
    * delay(3000)
    And click(checkoutPage.finishButton)
    Then waitForText(checkoutPage.thankYouMessage, 'Thank you for your order!')

    * delay(3000)
    And click(menuPage.burgerMenuButton)
    * delay(3000)
    And click(menuPage.logoutLink)
    And quit()

  Scenario: Realizar login con credenciales inválidas
    Given input(loginPage.userInput, 'homero')
    * delay(3000)
    When input(loginPage.passInput, 'simpson')
    * delay(3000)
    And click(loginPage.loginButton)
    Then waitFor("//div[@class='app_logo']")