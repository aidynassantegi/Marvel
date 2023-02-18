//
//  RegisterViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    private let headerView = AuthHeaderView(title: "Sign Up",
                                            secondaryTitle: "Create new account")
    
    private let usernameTextField = CustomTextField(customTextFieldType: .username)
    private let emailTextField = CustomTextField(customTextFieldType: .emailAddress)
    private let passwordTextField = CustomTextField(customTextFieldType: .password)
    
    private let signupButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    private let termsTextView: UITextView = {
        let tv = UITextView()
        tv.text = "By creating an account, I state that I have read and understood the terms and conditions"
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textAlignment = .center
        return tv
    }()
    private let loginButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .medium)
    
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
        [usernameTextField, emailTextField, passwordTextField].forEach {
            $0.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
            stackView.addArrangedSubview($0)
        }
        [headerView, stackView, signupButton, termsTextView, loginButton].forEach {
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
            make.height.equalTo(152)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp_bottomMargin).offset(16)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
        termsTextView.snp.makeConstraints { make in
            make.top.equalTo(signupButton.snp_bottomMargin).offset(16)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(termsTextView.snp_bottomMargin).offset(16)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(16)
        }
        
    }
    
    func setupButtons() {
        self.signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
    
    @objc func didTapSignup() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapLogin() {
        navigationController?.popViewController(animated: true)
    }
}
