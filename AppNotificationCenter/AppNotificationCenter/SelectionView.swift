import UIKit

protocol SelectionViewControllerProtocol: AnyObject {
    func tappedMacButton()
    func tappedImacButton()
}

final class SelectionView: UIView {
    
    weak var delegate: SelectionViewControllerProtocol?
    
    var screenMain = HomeScreen()
    
    private lazy var mainHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var macButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.mac, for: .normal)
        button.tintColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleMacButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameImageMacLabel: UILabel = {
        let label = UILabel()
        label.text = "Mac"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imacButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.imac, for: .normal)
        button.tintColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleImacButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameImageImacLabel: UILabel = {
        let label = UILabel()
        label.text = "Imac"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleMacButton() {
        delegate?.tappedMacButton()
    }
    
    @objc func handleImacButton() {
        delegate?.tappedImacButton()
    }
    
    
   
    private func delegate(_ delegate: SelectionViewControllerProtocol) {
        self.delegate = delegate
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(mainHStack)
        mainHStack.addArrangedSubview(macButton)
        mainHStack.addArrangedSubview(nameImageMacLabel)
        mainHStack.addArrangedSubview(UIView())
        mainHStack.addArrangedSubview(imacButton)
        mainHStack.addArrangedSubview(nameImageImacLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainHStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainHStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            macButton.heightAnchor.constraint(equalToConstant: 150),
            macButton.widthAnchor.constraint(equalToConstant: 250),
            
            
            imacButton.heightAnchor.constraint(equalToConstant: 150),
            imacButton.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func configureStyle() {
        backgroundColor = .white
    }
}
