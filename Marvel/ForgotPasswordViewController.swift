//
//  ForgotPasswordViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {
    
    private let headerView = AuthHeaderView(title: "Forgot Password?",
                                secondaryTitle: "Enter email. We will send you reset link")
    
    private let emailTextField = CustomTextField(customTextFieldType: .emailAddress)
    
    private let sendButton = CustomButton(title: "Send", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        [headerView, emailTextField, sendButton].forEach {
            view.addSubview($0)
        }
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(24)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(200)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp_bottomMargin)
            make.height.equalTo(44)
            make.leading.trailing.equalTo(view).inset(GlobalConstants.fromEdge)
        }
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp_bottomMargin).offset(GlobalConstants.fromEdge+8)
            make.leading.trailing.equalTo(view).inset(GlobalConstants.fromEdge)
            make.height.height.equalTo(44)
        }
    }
    
    func setupButtons() {
        self.sendButton.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)
    }
    
    @objc private func didTapSend() {
        self.navigationController?.popViewController(animated: true)
    }

}
