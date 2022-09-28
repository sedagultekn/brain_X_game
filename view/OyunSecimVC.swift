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
    @IBOutlet weak var tekBasinaOynaButton: UIButton!
    @IBOutlet weak var View1: UIView!
    @IBOutlet weak var View2: UIView!
    @IBOutlet weak var birlikteOynaButton: UIButton!
    @IBOutlet weak var View3: UIView!
    @IBOutlet weak var View4: UIView!
    @IBOutlet weak var InfoPopup: UIView!
    @IBOutlet var InfoPopup2: UIView!
    @IBOutlet weak var sesButton: UIButton!
    @IBOutlet weak var denemebuttton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isToolbarHidden = true
        tekBasinaOynaButton.layer.cornerRadius = 4
        View1.layer.cornerRadius = 4
        View2.layer.cornerRadius = 4
        birlikteOynaButton.layer.cornerRadius = 4
        View3.layer.cornerRadius = 4
        View4.layer.cornerRadius = 4
        
    }
    override func viewWillAppear(_ animated: Bool) {
        sesButton.layer.cornerRadius = 20.0
     //   denemebuttton.layer.cornerRadius = 20.0
        birlikteOynaButton.titleLabel?.adjustsFontSizeToFitWidth = true
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        guard let urlString = URL(string: BASE_URL + "api/getUserInfo") else { return }
        var requestAPI = URLRequest(url: urlString)
        let token = UserDefaults.standard.string(forKey: "token")
        requestAPI.httpMethod = "GET"
        requestAPI.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestAPI.addValue("application/json", forHTTPHeaderField: "Accept")
        requestAPI.setValue("Bearer "+token!, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: requestAPI) { (data, response, error) in
            if let data = data {
                do {
                    let str = String(decoding: data, as: UTF8.self)
                    print(str) // this is giving message HTTP Token: Access denied.
                    let json = try JSONDecoder().decode(GetUserInfoModel.self, from: data)
                    print (json)
                    
                } catch let error {
                    print(error.localizedDescription)
                    print("Seems to have an error: \(error)")
                    
                }
            }
               }
               task.resume()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
 
        
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.isToolbarHidden = true
//    }
    @IBAction func popUpView(_ sender: Any) {
        
        let pop = PopUpView()
        view.addSubview(pop)
        self.view.addSubview(InfoPopup2)
        self.InfoPopup2.center.x = self.view.center.x
        self.InfoPopup2.center.y = self.view.center.y
        
        self.view.addSubview(InfoPopup)
        self.InfoPopup.center.x = self.view.center.x
        self.InfoPopup.center.y = self.view.center.y
//        self.InfoPopup.width = self.view.width
//        self.InfoPopup.height= self.view
        self.InfoPopup.layer.cornerRadius = 10
        
    }
    @IBAction func TekBasinaOynaButton(_ sender: Any) {
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "OyunSeviyesiBelirleme")
//        navigationController?.pushViewController(vc!, animated: true)
        
    }
}

