//
//  SecondViewController.swift
//  Ionex
//
//  Created by sandy.huang on 2023/3/30.
//

import UIKit

class SecondViewController: UIViewController {
    
    class func instantiate() -> SecondViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
