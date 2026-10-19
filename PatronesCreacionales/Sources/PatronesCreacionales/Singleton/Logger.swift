//
//  Logger.swift
//  
//
//  Created by Fernando Negrete Pimentel on 19/10/26.
//
import Foundation

protocol Logging {
  func log (_ message: String)
}

final class Logger: Logging, @unchecked Sendable {
  static let shared = Logger()
  private init() { }

  private let queue = DispatchQueue(label: "logger.queue")
  private var storage: [String] = []

  var messages: [String] {
    queue.sync { storage }
  }

  func log(_ message: String) {
    queue.sync { storage.append(message) }
    print("[LOG] \(message)")
  }
}

final class OrderService {
  private let logger: Logging

  init(logger: Logging = Logger.shared) {
    self.logger = logger
  }

  func placeOrder(id: Int){
    logger.log("Pedido \(id) creado")
  }
}

final class FakeLogger: Logging {
  private(set) var messages: [String] = []
  
  func log(_ message: String) {
    messages.append(message)
  }
}
