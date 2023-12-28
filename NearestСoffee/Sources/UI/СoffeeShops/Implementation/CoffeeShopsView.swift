//
//  CoffeeShopsView.swift
//  NearestСoffee
//
//  Created by i0240 on 25.12.2023.
//

import UIKit

class CoffeeShopsView: UIViewController, CoffeeShopsViewInput {

    // MARK: - Properties

    var presenter: CoffeeShopsPresenter?
    var coffeeShops: [LocationResponse] = []

    // MARK: - Outlets

    private lazy var coffeeShopsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CoffeeShopsCell.self, forCellReuseIdentifier: "CoffeeShopCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var mapButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = Theme.darkBrownColor
        button.clipsToBounds = true
        button.layer.cornerRadius = 24
        button.setTitle("На карте", for: .normal)
        button.setTitleColor(Theme.whiteBrownColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
        presenter?.viewDidLoad()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = "Ближайшие кофейни"
        navigationController?.navigationBar.backgroundColor = Theme.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.lightBrownColor]
        navigationController?.navigationBar.tintColor = Theme.lightBrownColor
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    // Реализация методов CoffeeShopsViewInput
    func showCoffeeShops(coffeeShops: [LocationResponse]) {
        self.coffeeShops = coffeeShops
        coffeeShopsTableView.reloadData()
    }

    func showError(message: String) {
        // Обработка ошибки
        print("Error: \(message)")
    }

    private func setupHierarchy() {
        view.addSubviews([coffeeShopsTableView, mapButton])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            coffeeShopsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            coffeeShopsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            coffeeShopsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            coffeeShopsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            mapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            mapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),

            mapButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }

    // MARK: - Actions


    @objc func mapButtonPressed() {
        presenter?.mapButtonPressed()
    }
}

// MARK: - UITableViewDataSource

extension CoffeeShopsView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return coffeeShops.count
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopCell", for: indexPath) as? CoffeeShopsCell else {
            return UITableViewCell()
        }
//        let coffeeShop = coffeeShops[indexPath.row]
//        cell.coffeeShops = coffeeShop
        cell.coffeeShopLabel.text = "Сoffee Shop"
        cell.coffeeShopDistanceLabel.text = "1 км от вас"
        tableView.separatorStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        71
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
