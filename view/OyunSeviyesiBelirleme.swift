//
//  OyunSeviyesiBelirleme.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 29.08.2022.
//
import UIKit
class OyunSeviyesiBelirleme: UIViewController {
    
    @IBOutlet weak var kolayButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var zorButton: UIButton!
    @IBOutlet weak var uzmanButton: UIButton!
    @IBOutlet weak var highScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let urlString =   "http://75.119.129.105:8000/api/getUserInfo"
//        getData(url:urlString)
//
        highScore.font = UIFont(name: "PinkChicken-Regular", size: 24)
        
        }
    func buttonClicked(){
        if  kolayButton.isEnabled == true {
         

            UserDefaults.standard.set(kolayButton.isEnabled == true, forKey: "kolayButton")
        }
        if  normalButton.isEnabled == true {
            UserDefaults.standard.set(normalButton.isEnabled == true ,forKey: "normalButton")

        }
        if  zorButton.isEnabled == true {

            UserDefaults.standard.set(zorButton.isEnabled == true,forKey: "zorButton")
        }
        if  uzmanButton.isEnabled == true {

            UserDefaults.standard.set(uzmanButton.isEnabled == true,forKey: "uzmanButton")
        }
    
    }
    

    @IBAction func but(_ sender: Any) {
        
     
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
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
