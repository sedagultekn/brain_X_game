//
//  OyunSonucuVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 7.09.2022.
//

import UIKit

class OyunSonucuVC: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var yenidenOynaView: UIView!
    @IBOutlet weak var yenidenOynaView2: UIView!
    @IBOutlet weak var yenidenOynaButton: UIButton!
    @IBOutlet weak var cikisView: UIView!
    @IBOutlet weak var cikisView2: UIView!
    @IBOutlet weak var cikisButton: UIButton!
    @IBOutlet weak var enYuksekLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.cornerRadius = 20
        yenidenOynaView.layer.cornerRadius = 10
        yenidenOynaView2.layer.cornerRadius = 10
        yenidenOynaButton.layer.cornerRadius = 10
        cikisView.layer.cornerRadius = 10
        cikisView2.layer.cornerRadius = 10
        cikisButton.layer.cornerRadius = 10
    }
    
    @IBAction func yenidenOyna(_ sender: Any) {
        let main = UIStoryboard(name : "Main", bundle: nil)
        let second = main.instantiateViewController(withIdentifier: "SorularVC")
        second.modalPresentationStyle = .fullScreen
        self .present(second, animated: true, completion: nil)
        
    }
    
    @IBAction func cikisButton(_ sender: Any) {
        let main = UIStoryboard(name : "Main", bundle: nil)
        let second = main.instantiateViewController(withIdentifier: "OyunSecimVC")
        second.modalPresentationStyle = .fullScreen
        self .present(second, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
      
        super.viewWillDisappear(animated)
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
                    
                        DispatchQueue.main.async {
                            self.enYuksekLabel.text = String(json.data.score)
                        }
                    
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
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
