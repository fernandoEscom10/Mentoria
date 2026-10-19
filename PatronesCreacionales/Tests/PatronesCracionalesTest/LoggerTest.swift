//
//  LoggerTest.swift
//  
//
//  Created by Fernando Negrete Pimentel on 19/10/26.
//

import XCTest

@testable import PatronesCreacionales

final class SingletonTests: XCTestCase {
  
  func testOrderServiceLogsMessage() {
    let fake = FakeLogger()
    let service = OrderService(logger: fake)

    service.placeOrder(id: 42)

    XCTAssertEqual(fake.messages, ["Pedido 42 creado"])
  }
}
