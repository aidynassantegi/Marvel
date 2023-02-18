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
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        setupPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlaceholder() {
        self.placeholder = self.customTextFieldType.rawValue
    }
}
