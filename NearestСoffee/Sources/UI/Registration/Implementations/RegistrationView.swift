//
//  RegistrationView.swift
//  NearestСoffee
//
//  Created by i0240 on 23.12.2023.
//

import UIKit

class RegistrationView: UIViewController, RegistrationViewInput {

    // MARK: - Properties

    var presenter: RegistrationPresenter?

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

    private var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Повторите пароль"
        label.textColor = Theme.lightBrownColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var confirmPasswordTextField: UITextField = {
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

    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Theme.darkBrownColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 24
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(Theme.whiteBrownColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
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
        title = "Регистрация"
        navigationController?.navigationBar.backgroundColor = Theme.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.lightBrownColor]
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupHierarchy() {
        view.addSubviews([emailLabel, emailTextField, passwordLabel, passwordTextField, confirmPasswordLabel, confirmPasswordTextField, registerButton])
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

            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),

            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 47),

            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            registerButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    // MARK: - Actions

    @objc func registerButtonPressed() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            return
        }

        presenter?.register(email: email, password: password, confirmPassword: confirmPassword)

        presenter?.navigateToLoginTapped()
    }
}
