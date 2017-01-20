import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Modal"
        self.view.backgroundColor = .green
    }
    
    deinit {
        debugPrint("ModalViewController deinit")
    }
    
    @IBAction func backToStep1(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindFromModalViewControllerToMainViewController", sender: nil)
    }
    

    @IBAction func backToStep2(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindFromModalViewControllerToOtherViewController", sender: nil)
    }
    
    override func allowedChildViewControllersForUnwinding(from source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        return []
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        return false
    }
    
}
