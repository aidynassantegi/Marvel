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
    
    private let usernameTextField = CustomTextField(customTextFieldType: .username)
    
    private let passwordTextField = CustomTextField(customTextFieldType: .password)
    
    private let stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = CGFloat(12)
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        [usernameTextField, passwordTextField].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
            stackView.addArrangedSubview($0)
        }
        [headerView, stackView].forEach {
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.height.equalTo(200)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin).offset(24)
            make.leading.trailing.equalTo(view).inset(16)
            make.height.equalTo(98)
        }
    }
}
