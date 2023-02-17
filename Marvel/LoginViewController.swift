//
//  LoginViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    private let headerView = AuthHeaderView(title: "Sign In",
                                secondaryTitle: "Sign in to your account")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
        ])
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
        }
    }
}
