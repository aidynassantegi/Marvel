//
//  WebViewController.swift
//  Marvel
//
//  Created by Aidyn Assan on 19.02.2023.
//

import UIKit
import WebKit
import SnapKit

class WebViewController: UIViewController {

    private let url: URL?
    private let webView = WKWebView()
    
    init(with urlString: String) {
        url = URL(string: urlString)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url else {
            self.dismiss(animated: true)
            return
        }
        self.webView.load(URLRequest(url: url))
        setupUI()
    }
    
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(didTapDone))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        view.addSubview(webView)
        
        webView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(view)
        }
    }
    
    @objc private func didTapDone() {
        self.dismiss(animated: true)
    }
}
