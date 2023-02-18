//
//  LoginViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    private let headerView = AuthHeaderView(title: "Sign In",
                                secondaryTitle: "Sign in to your account")
    
    private let usernameTextField = CustomTextField(customTextFieldType: .username)
    
    private let passwordTextField = CustomTextField(customTextFieldType: .password)
    
    private let loginButton = CustomButton(title: "Login", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New user? Create account.", fontSize: .medium)
    private let forgotButton = CustomButton(title: "Forgot password?", fontSize: .small)
    
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
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        [usernameTextField, passwordTextField].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
            stackView.addArrangedSubview($0)
        }
        [headerView, stackView, loginButton, newUserButton, forgotButton].forEach {
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(200)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin)
            make.leading.trailing.equalTo(view).inset(16)
            make.height.equalTo(98)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp_bottomMargin).offset(16)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
        newUserButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp_bottomMargin).offset(16)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(newUserButton.snp_bottomMargin).offset(16)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(16)
        }
    }
    
    func setupButtons() {
        self.loginButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotButton.addTarget(self, action: #selector(didTapForgot), for: .touchUpInside)
    }
    
    @objc func didTapSignIn() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapNewUser() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgot() {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
