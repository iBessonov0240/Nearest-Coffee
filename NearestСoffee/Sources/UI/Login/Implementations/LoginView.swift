//
//  LoginView.swift
//  NearestСoffee
//
//  Created by i0240 on 24.12.2023.
//

import UIKit

class LoginView: UIViewController, LoginViewInput {

    // MARK: - Properties

    var presenter: LoginPresenter?

    // MARK: - Outlets

    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "e-mail"
        label.textColor = Theme.lightBrownColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.tintColor = .lightGray
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(
            string: "  example@example.ru",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.syperLightBrownColor]
        )
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 24
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = Theme.lightBrownColor.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = Theme.lightBrownColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .systemGray
        textField.tintColor = .lightGray
        textField.textAlignment = .left
        textField.attributedPlaceholder = NSAttributedString(
            string: "  ******",
            attributes: [NSAttributedString.Key.foregroundColor: Theme.syperLightBrownColor]
        )
        textField.font = .systemFont(ofSize: 18, weight: .regular)
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 24
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = Theme.lightBrownColor.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Theme.darkBrownColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 24
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(Theme.whiteBrownColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = "Вход"
        navigationController?.navigationBar.backgroundColor = Theme.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.lightBrownColor]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
    }

    private func setupHierarchy() {
        view.addSubviews([emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            emailTextField.heightAnchor.constraint(equalToConstant: 47),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            passwordTextField.heightAnchor.constraint(equalToConstant: 47),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            loginButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    // MARK: - Actions

    @objc func loginButtonPressed() {
        presenter?.loginButtonPressed()
    }
}
