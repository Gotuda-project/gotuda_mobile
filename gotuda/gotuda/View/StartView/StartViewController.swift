import UIKit
import Foundation

class ViewController: UIViewController {
    
    // MARK: Private properties
    
    private let logo = {
        let logo = UIImageView()
        logo.image = UIImage(named: "MainLogo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let titleLabel = {
        var title = UILabel()
        title.text = "Найди встречи, найди друзей"
        title.lineBreakMode = .byClipping
        title.numberOfLines = 0
        title.font = .montserrat(name: .bold, size: 32)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let loginButton = {
        var button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .montserrat(name: .bold, size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let registerButton = {
        var button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .montserrat(name: .bold, size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [
            logo,
            titleLabel,
            loginButton,
            registerButton
        ].forEach { view.addSubview($0) }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 74),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logo.heightAnchor.constraint(equalToConstant: 177)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 36),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 103),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.widthAnchor.constraint(equalToConstant: 330)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }


}

