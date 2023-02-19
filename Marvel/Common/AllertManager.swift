//
//  AllertManager.swift
//  Marvel
//
//  Created by Aidyn Assan on 19.02.2023.
//

import UIKit

final class AlertManager {
    class private func showBasicAlert(vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            vc.present(alert, animated: true)
        }
    }
}
// MARK: - Validation
extension AlertManager {
    static func showInvalidEmailAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Invalid Email", message: "Please enter valid email")
    }
    static func showPasswordEmailAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Invalid Password", message: "Please enter valid password")
    }
    static func showUsernameEmailAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Invalid Username", message: "Please enter valid username")
    }
}
// MARK: - Registration
extension AlertManager {
    static func showUnknownRegistrationAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Unknown Registration Error", message: nil)
    }
    static func showRegistrationErrorAlert(on vc: UIViewController, error: Error) {
        showBasicAlert(vc: vc, title: "Registration Error", message: error.localizedDescription)
    }

}
// MARK: - Login
extension AlertManager {
    static func showUnknownLoginAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Unknown Sign In Error", message: nil)
    }
    static func showSigninErrorAlert(on vc: UIViewController, error: Error) {
        showBasicAlert(vc: vc, title: "Sign In Error", message: error.localizedDescription)
    }

}
// MARK: - Log Out
extension AlertManager {
    static func showLogoutErrorAlert(on vc: UIViewController, error: Error) {
        showBasicAlert(vc: vc, title: "Unknown Log Out Error", message: error.localizedDescription)
    }
}
// MARK: - Forgot Password
extension AlertManager {
    static func showErrorSendingPasswordAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Unknown Error in sending password", message: nil)
    }
    static func showSendingPasswordErrorAlert(on vc: UIViewController, error: Error) {
        showBasicAlert(vc: vc, title: "Error in sending password", message: error.localizedDescription)
    }
}
// MARK: - Fetching
extension AlertManager {
    static func showUnknownFetchingUserErrorAlert(on vc: UIViewController) {
        showBasicAlert(vc: vc, title: "Unknown Fetching Error", message: nil)
    }

}

