//
//  CoffeeShopsCell.swift
//  NearestСoffee
//
//  Created by i0240 on 26.12.2023.
//

import UIKit

class CoffeeShopsCell: UITableViewCell {

    var currentLocation: CurrentLocation = CurrentLocation(latitude: 37.7749, longitude: -122.4194)
    var coffeeShops: LocationResponse? {
        didSet {
            coffeeShopLabel.text = coffeeShops?.name
            if let distance = coffeeShops?.point.distance(to: currentLocation) {
                coffeeShopDistanceLabel.text = "\(distance) км от вас"
            } else {
                coffeeShopDistanceLabel.text = "0 км от вас"
            }
        }
    }

    // MARK: - Outlets

    var coffeeShopLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.lightBrownColor
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var coffeeShopDistanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.syperLightBrownColor
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Theme.whiteBrownColor
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.systemGray6.cgColor
        contentView.layer.shadowRadius = 2
        setupHierarchy()
        setupLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.coffeeShops = nil
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubviews([coffeeShopLabel, coffeeShopDistanceLabel])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            coffeeShopLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            coffeeShopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            coffeeShopLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            coffeeShopDistanceLabel.topAnchor.constraint(equalTo: coffeeShopLabel.bottomAnchor, constant: 6),
            coffeeShopDistanceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            coffeeShopDistanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            coffeeShopDistanceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9)
        ])
    }
}
