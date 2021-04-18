//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by Rommy Fuentes Davila Otani on 16/04/21.
//

import XCTest

class DemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
 
        //Input of user in textfield
        let usuarioTextField = app.textFields["Usuario"]
        usuarioTextField.tap()
        usuarioTextField.typeText("Admin")
          
        //Input of password in textfield
        let passwordTextField = app.secureTextFields["Contraseña"]
        passwordTextField.tap()
        passwordTextField.tap()
        passwordTextField.typeText("Password*123")
            
        //Press enter button
        app.buttons["INGRESAR"].tap()
        
        XCTAssertTrue(app.staticTexts["Hello, World!"].exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
