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
        let attributedString = NSMutableAttributedString(
            string: """
                    By creating an account, you agree to our Terms & Conditions
                    and you acknowledge that you have read our Privacy Policy.
                    """)
        attributedString.addAttribute(.link, value: "terms://termsAndConditions",
                                      range: (attributedString.string as NSString).range(of: "Terms & Conditions"))
        
        attributedString.addAttribute(.link, value: "privacy://privacyAndPolicy",
                                      range: (attributedString.string as NSString).range(of: "Privacy Policy"))
                
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.attributedText = attributedString
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.delaysContentTouches = false
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
        self.termsTextView.delegate = self
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
    
    @objc private func didTapSignup() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapLogin() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "terms" {
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en")
        }
        
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
