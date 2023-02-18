//
//  AuthHeaderView.swift
//  Marvel
//
//  Created by Aidyn Assan on 17.02.2023.
//

import UIKit
import SnapKit

final class AuthHeaderView: UIView {
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "theAidynstudios")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    init(title: String, secondaryTitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.secondaryLabel.text = secondaryTitle
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [headerImageView, titleLabel, secondaryLabel].forEach {
            addSubview($0)
        }
        headerImageView.snp.makeConstraints { make in
            make.topMargin.equalTo(snp_topMargin).inset(16)
            make.width.height.equalTo(90)
            make.centerX.equalTo(snp_centerXWithinMargins)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerImageView.snp_bottomMargin).offset(8)
            make.centerX.equalTo(snp_centerXWithinMargins)
        }
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(12)
            make.centerX.equalTo(snp_centerXWithinMargins)
        }
    }
}
