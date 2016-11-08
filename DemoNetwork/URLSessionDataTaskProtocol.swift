import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension NSURLSessionDataTask: URLSessionDataTaskProtocol { }