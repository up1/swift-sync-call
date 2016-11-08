import Foundation

typealias HTTPResult = (NSData?, ErrorType?) -> Void

class HTTPClient {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = Config.urlSession) {
        self.session = session
    }
    
    func get(url: NSURL, completion: HTTPResult) {
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let _ = error {
                completion(nil, Error.NetworkError)
            } else if let response = response as? NSHTTPURLResponse where 200...299 ~= response.statusCode {
                completion(data, nil)
            } else {
                completion(nil, Error.NetworkError)
            }
        }
        task.resume()
    }
}