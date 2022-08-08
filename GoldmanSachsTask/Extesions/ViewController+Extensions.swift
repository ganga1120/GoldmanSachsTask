//
//  ViewController+Extensions.swift
//  GoldmanSachsTask
//
//  Created by ggajulapati on 08/08/22.
//


import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.Alert.ok, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


extension DateFormatter {

    static var sharedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        // Add your formatter configuration here
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}


extension UIViewController {
    static var activityIndicatorTag = 12345

    func startLoading() {
        stopLoading()

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.tag = UIViewController.activityIndicatorTag
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        let color = isDarkMode ? UIColor.white : UIColor.black
        activityIndicator.color = color
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }

    func stopLoading() {
        let activityIndicator = view.viewWithTag(UIViewController.activityIndicatorTag) as? UIActivityIndicatorView
        DispatchQueue.main.async {
            activityIndicator?.stopAnimating()
            activityIndicator?.removeFromSuperview()
        }
    }
}


extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}
