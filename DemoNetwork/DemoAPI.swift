import Foundation

class DemoAPI {
    
    private let session: NSURLSession!
    
    init(session: NSURLSession) {
        self.session = session
    }
    
    func process1() -> String {
        var result: String = "ERROR"
        let url = NSURL(string: "http://localhost:8882/step1")!
        let request = NSMutableURLRequest(URL: url)
        self.session.sendSynchronousRequest(request) { data, response, error in
            if let data = data {
                result = String(data: data, encoding: NSUTF8StringEncoding)!
            } else {
                print(error)
            }
        }
        return result
    }
    
    func process2() -> String {
        var result: String = "ERROR"
        let url = NSURL(string: "http://localhost:8882/step2")!
        let request = NSMutableURLRequest(URL: url)
        self.session.sendSynchronousRequest(request) { data, response, error in
            if let data = data {
                result = String(data: data, encoding: NSUTF8StringEncoding)!
            } else {
                print(error)
            }
        }
        return result
    }
    
    func process3() -> String {
        var result: String = "ERROR"
        let url = NSURL(string: "http://localhost:8882/step3")!
        let request = NSMutableURLRequest(URL: url)
        self.session.sendSynchronousRequest(request) { data, response, error in
            if let data = data {
                result = String(data: data, encoding: NSUTF8StringEncoding)!
            } else {
                print(error)
            }
        }
        return result
    }
    
    
    
}


extension NSURLSession {
    func sendSynchronousRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) {
        let semaphore = dispatch_semaphore_create(0)
        let task = self.dataTaskWithRequest(request) { data, response, error in
            completionHandler(data, response, error)
            dispatch_semaphore_signal(semaphore)
        }
        
        task.resume()
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
    }
    
    func sendAsynchronousRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
        let task = self.dataTaskWithRequest(request) { data, response, error in
            completionHandler(data, response, error)
        }
        
        task.resume()
        return task
    }
}
