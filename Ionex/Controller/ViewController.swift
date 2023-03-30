//
//  ViewController.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupButtonSatus(isEnable: false)
        self.userNameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if let userName = self.userNameTextField.text, let password = self.passwordTextField.text {
            self.viewModel.loginAction(parameters: ["username": userName, "password": password]) { data in
                print("登入成功 = \(data)")
                DispatchQueue.main.async {
                    let secondViewController = SecondViewController.instantiate()
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                }
            }
        }
    }
    
    
    private func setupButtonSatus(isEnable: Bool) {
        self.loginButton.isEnabled = isEnable
        if isEnable {
            self.loginButton.backgroundColor = .systemYellow
        } else {
            self.loginButton.backgroundColor = .lightGray
        }
    }
}

extension ViewController: UITextFieldDelegate {


    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let userName = self.userNameTextField.text, let password = self.passwordTextField.text {
            if !userName.isEmpty && !password.isEmpty {
                self.setupButtonSatus(isEnable: true)
            } else {
                self.setupButtonSatus(isEnable: false)
            }
        }
    }
}
