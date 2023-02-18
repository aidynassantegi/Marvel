//
//  CustomTextField.swift
//  Marvel
//
//  Created by Aidyn Assan on 18.02.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType: String {
        case username = "Username"
        case emailAddress = "Email address"
        case password = "Password"
    }

    private let customTextFieldType: CustomTextFieldType
    
    init(customTextFieldType: CustomTextFieldType) {
        self.customTextFieldType = customTextFieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = GlobalConstants.cornerRadius
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        setupPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlaceholder() {
        switch customTextFieldType {
        case .username:
            self.placeholder = customTextFieldType.rawValue
        case .emailAddress:
            self.placeholder = customTextFieldType.rawValue
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = customTextFieldType.rawValue
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
}
