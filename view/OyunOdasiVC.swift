//
//  OyunOdasıVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 15.09.2022.
//

import UIKit

class OyunOdasiVC: UIViewController {

    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var cikisButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    navigationController?.isToolbarHidden = true
        infoButton.layer.cornerRadius = 20.0
        cikisButton.layer.cornerRadius = 20.0
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    
    }
  
}
