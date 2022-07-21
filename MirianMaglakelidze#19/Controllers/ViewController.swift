import UIKit

class ViewController: UIViewController {
    lazy var portraitView = PortraitViewDesign(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
    
    lazy var landscapeView = LandscapeViewDesign(frame: CGRect(x: 0, y: 0, width: self.view.frame.height, height: self.view.frame.width))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Default orientation is portrait
        self.view.addSubview(portraitView)
        
        // Set notification observer when device change orientation
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    // Func removing old view and add new depend on device orientation
    @objc func orientationChanged() {
        switch UIDevice.current.orientation.rawValue {
        case 1:
            landscapeView.removeFromSuperview()
            self.view.addSubview(portraitView)
        case 3, 4:
            portraitView.removeFromSuperview()
            self.view.addSubview(landscapeView)
        default:
            break
        }
    }
}
