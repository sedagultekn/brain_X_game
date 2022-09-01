//
//  OyunSecimVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 27.08.2022.
//

import UIKit

class OyunSecimVC: UIViewController {
    //let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    // let OyunSecimVc = mainStoryBoard.instantiateViewControllerWithIdentifier("OyunSecimVC") as! UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
 
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    @IBAction func TekBasinaOynaButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "OyunSeviyesiBelirleme")
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}

