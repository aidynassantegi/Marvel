//
//  CustomButton.swift
//  Marvel
//
//  Created by Aidyn Assan on 18.02.2023.
//

import UIKit

class CustomButton: UIButton {
    
    enum FontSize: CGFloat {
        case big = 22
        case medium = 18
        case small = 16
    }

    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = GlobalConstants.cornerRadius
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemBlue : .clear
        
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: fontSize.rawValue, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: fontSize.rawValue, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: fontSize.rawValue, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
