import UIKit

final class SelectionViewController: UIViewController {
    
    var selectionView = SelectionView()
    var screenMain = HomeViewController()
    
    override func loadView() {
        super.loadView()
        selectionView = SelectionView()
        view = selectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionView.delegate = self
    }
}

extension SelectionViewController: SelectionViewControllerProtocol {
    func tappedMacButton() {
        NotificationCenter.default.post(name: Notification.Name("Mac"), object: UIColor.red)
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
        NotificationCenter.default.post(name: Notification.Name("Imac"), object: UIColor.green)
        dismiss(animated: true)
    }
}
