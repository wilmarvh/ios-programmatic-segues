import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Step 1"
        self.view.backgroundColor = .blue
    }
    
    deinit {
        debugPrint("ViewController deinit")
    }
    
    @IBAction func navigateWithPush(_ sender: Any) {
        guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "OtherViewController") else { return }
        
        let segue = UIStoryboardSegue(identifier: "customSegue", source: self, destination: destination, performHandler: {
            self.navigationController?.pushViewController(destination, animated: true)
        })
        segue.perform()
    }
    
    @IBAction func unwindFromModalViewControllerToMainViewController(segue: UIStoryboardSegue) {
        debugPrint("unwindFromModalViewControllerToMainViewController finished")
    }
    
    override func allowedChildViewControllersForUnwinding(from source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        return source.unwindAction == #selector(unwindFromModalViewControllerToMainViewController(segue:)) ? [self] : []
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        return action == #selector(unwindFromModalViewControllerToMainViewController(segue:))
    }
    
}

