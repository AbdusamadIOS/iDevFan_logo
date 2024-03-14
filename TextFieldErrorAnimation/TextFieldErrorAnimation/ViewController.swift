//
//  ViewController.swift
//  TextFieldErrorAnimation
//
//  Created by Abdusamad Mamasoliyev on 14/03/24.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let shakeButton = UIButton(type: .custom)
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        animate()
    }
}

// MARK: - Setup

extension ViewController {
    
    func setup() {
        view.backgroundColor = .systemBackground
        textField.setIcon(UIImage(systemName: "lock")!)

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.layer.cornerRadius = 6
        textField.placeholder = "Password"
        
        shakeButton.translatesAutoresizingMaskIntoConstraints = false
        shakeButton.addTarget(self, action: #selector(shakeTapped), for: .primaryActionTriggered)
        shakeButton.configuration = .filled()
        shakeButton.setTitle("next", for: .normal)
        shakeButton.setTitleColor(.white, for: .highlighted)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "error password"
        errorLabel.textColor = .red
        errorLabel.font = UIFont.systemFont(ofSize: 14)
        errorLabel.textAlignment = .left
        errorLabel.isHidden = true
        
        view.addSubview(textField)
        view.addSubview(shakeButton)
        view.addSubview(errorLabel)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            errorLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 60),
            errorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            
            
            shakeButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 15),
            shakeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            shakeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            shakeButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    
    @objc func shakeTapped(_ sender: UIButton) {
        animate()
        errorLabel.isHidden = false
    }
}

// MARK: - Animations

extension ViewController {

    func animate() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4

        animation.isAdditive = true
        textField.layer.add(animation, forKey: "shake")
    }
}

extension UITextField {
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        leftView = iconContainerView
        leftViewMode = .always
    }
}

