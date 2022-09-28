//
//  UserProfilViewController.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 29.08.2022.
//

import UIKit

class UserProfilViewController: UIViewController {

    @IBOutlet weak var highScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        
        var view = UILabel()

        view.frame = CGRect(x: 0, y: 0, width: 360, height: 0)

        view.backgroundColor = .white


        var stroke = UIView()

        stroke.bounds = view.bounds.insetBy(dx: -0.15, dy: -0.15)

        stroke.center = view.center

        view.addSubview(stroke)

        view.bounds = view.bounds.insetBy(dx: -0.15, dy: -0.15)

        stroke.layer.borderWidth = 0.3

        stroke.layer.borderColor = UIColor(red: 0.969, green: 0.976, blue: 0.918, alpha: 1).cgColor


        var parent = self.view!

        parent.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
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
                            //self.levelName.text =  (json.data.levelName)
                            
                            self.highScore.text = String(json.data.score)
                        }
                    
                } catch let error {
                    print(error.localizedDescription)
                    print("Seems to have an error: \(error)")
                    
                }
                
            }
               }
               task.resume()
    }

}
