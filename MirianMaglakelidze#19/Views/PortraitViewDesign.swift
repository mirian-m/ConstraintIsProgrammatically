import UIKit

class PortraitViewDesign: UIView {
    
    // MARK:-Create outlets programmatically
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.backgroundColor = .none
        return view
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        let gradientColor = CAGradientLayer()
        gradientColor.frame = self.bounds
        gradientColor.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemBlue.cgColor
        ]
        imageView.layer.addSublayer(gradientColor)
        return imageView
    }()
    
    lazy var roketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.contentMode = .center
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.backgroundColor = backgroundImageView.backgroundColor
        imageView.image = UIImage(named: "Mission")?.withTintColor(.white)
        return imageView
    }()
    
    lazy var titleLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.text = "IOS App Templates"
        self.addSubview(label)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "   Email"
        textField.backgroundColor = .systemGray6
        textField.font = UIFont(name: "Helvetica Neue", size: 15)
        textField.textColor = UIColor.black
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "   Password"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica Neue", size: 15)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    lazy var signInBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 13)
        label.text = "Don't have an account?"
        return label
    }()
    
    lazy var signupBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 13)
        button.backgroundColor = .none
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // MARK:- INIT func
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustConstraints()
        roketImageView.layer.cornerRadius = roketImageView.frame.height / 2
    }
    
    // MARK:- ADD CONSTRAINTS
    
    func adjustConstraints() {
        let viewConstraints = [
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            view.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ]
        let backgroundImageViewConstraints = [
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        let titleLbConstraints = [
            titleLb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLb.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ]
        roketImageView.center = view.center
        let roketImageViewConstraints = [
            roketImageView.heightAnchor.constraint(equalToConstant: 200),
            roketImageView.widthAnchor.constraint(equalTo: roketImageView.heightAnchor, multiplier: 1)
        ]
        
        
        let emailTextFieldConstraints = [
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
        let passwordTextFieldConstraints = [
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor, multiplier: 1)
        ]
        let signInBtnConstraints = [
            signInBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            signInBtn.heightAnchor.constraint(equalTo: emailTextField.heightAnchor, multiplier: 1),
            signInBtn.leadingAnchor.constraint(equalTo: titleLb.leadingAnchor),
            signInBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50)
        ]
        
        let bottomLabelConstraints = [
            bottomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -30),
            bottomLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        
        let signupBtnConstraints = [
            signupBtn.centerYAnchor.constraint(equalTo: bottomLabel.centerYAnchor),
            signupBtn.leadingAnchor.constraint(equalTo: bottomLabel.trailingAnchor, constant: 5)
        ]
        
        // MARK:- Constraints activation
        
        NSLayoutConstraint.activate(viewConstraints)
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
        NSLayoutConstraint.activate(titleLbConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(signInBtnConstraints)
        NSLayoutConstraint.activate(bottomLabelConstraints)
        NSLayoutConstraint.activate(signupBtnConstraints)
        NSLayoutConstraint.activate(roketImageViewConstraints)
    }
}

