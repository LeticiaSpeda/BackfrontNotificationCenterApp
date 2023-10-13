import UIKit

protocol HomeScreenProtocol: AnyObject {
    func tappedButtonClique()
}

final class HomeScreen: UIView {

    weak var delegate: HomeScreenProtocol?
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var logoAppleImageView: UIImageView = {
        let view = UIImageView(image: UIImage.apple)
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var navigationScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clique", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(
            self,
            action: #selector(handleLogin),
            for: .touchUpInside
        )
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleLogin() {
        delegate?.tappedButtonClique()
    }
    
    func delegate(_ delegate: HomeScreenProtocol) {
        self.delegate = delegate
    }
    
    
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        addSubview(mainHStack)
        mainHStack.addArrangedSubview(UIView())
        mainHStack.addArrangedSubview(logoAppleImageView)
        mainHStack.addArrangedSubview(nameImageLabel)
        mainHStack.addArrangedSubview(UIView())
        mainHStack.addArrangedSubview(navigationScreenButton)
        mainHStack.addArrangedSubview(UIView())
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainHStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainHStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            logoAppleImageView.heightAnchor.constraint(equalToConstant: 200),
            logoAppleImageView.widthAnchor.constraint(equalToConstant: 100),

            
            navigationScreenButton.heightAnchor.constraint(equalToConstant: 40),
            navigationScreenButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

