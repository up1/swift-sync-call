import Foundation

struct Config {
    static let urlSession: URLSessionProtocol = UITesting() ? SeededURLSession() : NSURLSession.defaultSession()
}

private func UITesting() -> Bool {
    return NSProcessInfo.processInfo().arguments.contains("UI-TESTING")
}
