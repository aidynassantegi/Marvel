//
//  HomeViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "You are in Home"
        label.font = .systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(didTapLogout))
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        view.addSubview(homeLabel)
        homeLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
    }
    
    @objc private func didTapLogout() {
        self.dismiss(animated: true)
    }
}
