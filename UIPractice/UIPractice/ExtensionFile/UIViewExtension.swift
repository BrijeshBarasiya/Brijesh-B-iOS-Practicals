import UIKit

extension UIView {
    
    func integrateTapGesture() {
        let keyboardEvent = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.addGestureRecognizer(keyboardEvent)
    }
    
    // MARK: - Obejct Function
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
}
