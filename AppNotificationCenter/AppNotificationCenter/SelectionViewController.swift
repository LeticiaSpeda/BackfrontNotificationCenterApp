import UIKit

protocol SelectionViewControllerProtocol: AnyObject {
    func configureNotificationMac()
    func configureNotificationImac()
}

final class SelectionViewController: UIViewController {
    private weak var delegate: SelectionViewControllerProtocol?
    
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
    
     func delegate(_ delegate: SelectionViewControllerProtocol) {
        self.delegate = delegate
    }
}

extension SelectionViewController: SelectionViewProtocol {
    func tappedMacButton() {
        delegate?.configureNotificationMac()
        dismiss(animated: true)
    }
    
    func tappedImacButton() {
        delegate?.configureNotificationImac()
        dismiss(animated: true)
    }
}
