//
//  FactoryNotifier.swift
//  PatronesCreacionales
//
//  Created by Fernando Negrete Pimentel on 21/10/26.
//

protocol Notifier {
  func send( to user: String)
}

public struct EmailNotifier: Notifier {
  func send(to user: String) {
    print("Email a \(user)")
  }
}

public struct PushNotifier: Notifier {
  func send(to user: String) {
    print("Push a \(user)")
  }
}

public struct SMSNotifier: Notifier {
  func send(to user: String) {
    print("SMS a \(user)")
  }
}

protocol NotiferCreator {
  func makeNotifier() -> Notifier
}

public struct EmailCreator: NotiferCreator {
  func makeNotifier() -> Notifier {
    EmailNotifier()
  }
}

public struct PushCreator: NotiferCreator {
  func makeNotifier() -> Notifier {
    PushNotifier()
  }
}

public struct SMSCreator: NotiferCreator {
  func makeNotifier() -> Notifier {
    SMSNotifier()
  }
}

final class FactoryNotifier {

  func notify(_ user: String, using creator: NotiferCreator) {
    creator.makeNotifier().send(to: user)
  }
}

