import UIKit

class OtherViewController: UIViewController {
    
    var destinationViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Step 2"
        self.view.backgroundColor = .yellow
    }
    
    deinit {
        debugPrint("OtherViewController deinit")
    }
    
    @IBAction func navigateWithModal(_ sender: Any) {
        guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController") else { return }
        
        let segue = UIStoryboardSegue(identifier: "anotherCustomSegue", source: self, destination: destination, performHandler: {
            self.present(destination, animated: true, completion: { 
                //
            })
        })
        segue.perform()
        self.destinationViewController = destination
    }
    
    @IBAction func unwindFromModalViewControllerToOtherViewController(segue: UIStoryboardSegue) {
        debugPrint("unwindFromModalViewControllerToOtherViewController finished")
    }
    
    override func allowedChildViewControllersForUnwinding(from source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        return source.unwindAction == #selector(unwindFromModalViewControllerToOtherViewController(segue:)) ? [self] : []
    }
    
    override func canPerformUnwindSegueAction(_ action: Selector, from fromViewController: UIViewController, withSender sender: Any) -> Bool {
        return action == #selector(unwindFromModalViewControllerToOtherViewController(segue:))
    }
}

