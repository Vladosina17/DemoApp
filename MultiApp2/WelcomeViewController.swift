//
//  WelcomeViewController.swift
//  MultiApp2
//

import UIKit

final class WelcomeViewController: UIViewController {
    private let userEmail: String

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, \(userEmail)!"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "You are successfully authenticated."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.configuration = .filled()
        return button
    }()

    init(userEmail: String) {
        self.userEmail = userEmail
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Welcome"
        configureLayout()
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }

    private func configureLayout() {
        let stack = UIStackView(arrangedSubviews: [welcomeLabel, detailsLabel, logoutButton])
        stack.axis = .vertical
        stack.spacing = 18

        stack.placedOn(view)
        (stack.left => view.safeAreaLayoutGuide.leftAnchor) + 20
        (stack.right => view.safeAreaLayoutGuide.rightAnchor) - 20
        stack.centerY => view.centerY
        logoutButton.height => 44
    }

    @objc
    private func logoutTapped() {
        navigationController?.popViewController(animated: true)
    }
}
