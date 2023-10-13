import UIKit

final class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    
    override func loadView() {
        super.loadView()
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate = self
        view.backgroundColor = .white
        configureNotification()
    }
    
    @objc func handleNotificationMac(notification: NSNotification) {
        homeScreen?.logoAppleImageView.image = UIImage.mac
        homeScreen?.nameImageLabel.text = "Macbook"
        view.backgroundColor = notification.object as? UIColor
    }
    
    @objc func handleNotificationImac(notification: NSNotification) {
        homeScreen?.logoAppleImageView.image = UIImage.imac
        homeScreen?.nameImageLabel.text = "Imac"
        view.backgroundColor = notification.object as? UIColor
    }
    
    private func configureNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationMac), name: NSNotification.Name("Mac"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationImac), name: NSNotification.Name("Imac"), object: nil)
    }
}

extension HomeViewController: HomeScreenProtocol {
    func tappedButtonClique() {
        let controller = SelectionViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.delegate(self)
        present(controller, animated: true)
    }
}

extension HomeViewController: SelectionViewControllerProtocol {
    func configureNotificationMac() {
        homeScreen?.logoAppleImageView.image = UIImage.mac
        homeScreen?.nameImageLabel.text = "Macbook"
        view.backgroundColor = .red
    }
    
    func configureNotificationImac() {
        homeScreen?.logoAppleImageView.image = UIImage.imac
        homeScreen?.nameImageLabel.text = "Imac"
        view.backgroundColor = .green
    }
}
