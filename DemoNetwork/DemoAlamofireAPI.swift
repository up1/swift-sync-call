import Foundation
import Alamofire

class DemoAlamorfireAPI {
    
    func process1() -> String {
        let semaphore = dispatch_semaphore_create(0)
        var result = "ERROR"
        Alamofire.request(.GET, "http://localhost:8882/step1", parameters: nil).response(completionHandler: { request, response, data, error in
            if response!.statusCode == 200 {
                result = String(data: data!, encoding: NSUTF8StringEncoding)!
            }
            dispatch_semaphore_signal(semaphore)
            
        })
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        print(result)
        return result
    }
    
    func process2() -> String {
        let semaphore = dispatch_semaphore_create(0)
        var result = "ERROR"
        Alamofire.request(.GET, "http://localhost:8882/step2", parameters: nil).response(completionHandler: { request, response, data, error in
            if response!.statusCode == 200 {
                result = String(data: data!, encoding: NSUTF8StringEncoding)!
            }
            dispatch_semaphore_signal(semaphore)
            
        })
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        print(result)
        return result
    }
    
    func process3() -> String {
        let semaphore = dispatch_semaphore_create(0)
        var result = "ERROR"
        Alamofire.request(.GET, "http://localhost:8882/step3", parameters: nil).response(completionHandler: { request, response, data, error in
            if response!.statusCode == 200 {
                result = String(data: data!, encoding: NSUTF8StringEncoding)!
            }
            dispatch_semaphore_signal(semaphore)
            
        })
        while dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0 {
            NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 10))
        }
        print(result)
        return result
    }
    
    
}