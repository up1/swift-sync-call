import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onRload(sender: AnyObject) {
        beforeRegisterProcess()
    }
    
    private func beforeRegisterProcess() {
        let session = NSURLSession.sharedSession()
        let api = DemoAPI(session: session)
        let result = api.process1()
        print(result)
        let result2 = api.process2()
        print(result2)
        let result3 = api.process3()
        print(result3)
        self.countLabel.text = "\(result) - \(result2) - \(result3)"
    }
    
    @IBAction func onXX(sender: AnyObject) {
        beforeRegisterProcess2()
    }
    
    private func beforeRegisterProcess2() {
        let api = DemoAlamorfireAPI()
        let result1 = api.process1()
        let result2 = api.process2()
        let result3 = api.process3()
        self.countLabel.text = "\(result1) - \(result2) - \(result3)"
    }
    
    
    private func fetchPostCount() {
        let httpClient = HTTPClient()
        let url = NSURL(string: "http://masilotti.com/api/posts.json")!
        httpClient.get(url) { (data, error) -> Void in
            self.parse(data)
        }
    }
    
    private func parse(data: NSData?) {
        guard let
            data = data,
            json = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
            count = json["posts"] as? Int
            else { self.displayErrorAlert(); return }
        self.countLabel.text = "\(count)"
    }
    
    private func displayErrorAlert() {
        let alertController = UIAlertController(title: nil, message: "Something went wrong.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

