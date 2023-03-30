//
//  SecondViewController.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var objectIdLabel: UILabel!
    @IBOutlet weak var sessionTokenLabel: UILabel!
    
    var userData: LoginService.LoginData?
    let viewModel = SecondViewModel()
    
    class func instantiate(userData: LoginService.LoginData) -> SecondViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.userData = userData
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    private func setupUI() {
        if let userData = userData {
            self.userNameLabel.text = "username : \(userData.username ?? "")"
            self.phoneLabel.text = "phone : \(userData.phone ?? "")"
            self.createdAtLabel.text = "createdAt : \(userData.createdAt ?? "")"
            self.updatedAtLabel.text = "updatedAt : \(userData.updatedAt ?? "")"
            self.objectIdLabel.text = "objectId : \(userData.objectId ?? "")"
            self.sessionTokenLabel.text = "sessionToken : \(userData.sessionToken ?? "")"
        }
    }
    
    @IBAction func updateTimeZoneButtonClicked(_ sender: UIButton) {
        if let userData = userData, let objectId = userData.objectId, let sessionToken = userData.sessionToken {
            self.viewModel.updateUserData(objectId: objectId, sessionToken:sessionToken, parameters: ["timeZone" : "8"]) { userData in
                DispatchQueue.main.async {
                    self.updatedAtLabel.text = "updatedAt : \(userData.updatedAt ?? "")"
                }
            }
        }
    }
    

}
