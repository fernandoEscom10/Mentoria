//
//  FactoryNotifierTest.swift
//  PatronesCreacionales
//
//  Created by Fernando Negrete Pimentel on 21/10/26.
//
import XCTest

@testable import PatronesCreacionales

final class FactoryNotifierTest: XCTestCase {
  func testSMSCReatorMakesSMSNotifier() {
    let notifier = SMSCreator().makeNotifier()
    XCTAssertTrue(notifier is SMSNotifier)
  }

  func testFuncNotifier() {
    let factory: FactoryNotifier = FactoryNotifier()
    let smsNotifier: SMSCreator = SMSCreator()
    let emailNotifier: EmailCreator = EmailCreator()
    XCTAssertNoThrow(factory.notify("FER", using: smsNotifier), "Sending sms to Fer should not throw an error")
    XCTAssertNoThrow(factory.notify("FER", using: emailNotifier), "Sending email to Fer should not throw an error")
  }
}
