//
//  odaOlusturVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 13.09.2022.
//

import UIKit

class odaOlusturVC: UIViewController {

    @IBOutlet weak var oyuncuSayisi2: UIButton!
    @IBOutlet weak var oyuncuSayisi3: UIButton!
    @IBOutlet weak var oyuncuSayisi4: UIButton!
    @IBOutlet weak var kolayLevel: UIButton!
    @IBOutlet weak var normalLevel: UIButton!
    @IBOutlet weak var zorLevel: UIButton!
    @IBOutlet weak var uzmanLevel: UIButton!
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var oyunaBasla: UIButton!
    var OyuncuSayisibuttonClicked = 0
    var SeviyeBelirlemebuttonClicked = 0
    var selectedButton = 0
    var userCount = 0
    var roomType = " "
    override func viewDidLoad() {
        super.viewDidLoad()
     
     
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // self.levelName.text =   json.data.id
         self.levelName.text = UserDefaults.standard.string(forKey: "levelName")
     
    }
    override func viewDidAppear(_ animated: Bool) {
        //
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        userCount = 2
        if  oyuncuSayisi2.backgroundColor == UIColor.white {
            oyuncuSayisi2.backgroundColor = UIColor.green
            OyuncuSayisibuttonClicked = 1
            oyuncuSayisi4.backgroundColor = UIColor.white
            oyuncuSayisi3.backgroundColor = UIColor.white
        }
        else if OyuncuSayisibuttonClicked == 1 && oyuncuSayisi2.backgroundColor == UIColor.green {
            oyuncuSayisi2.backgroundColor = UIColor.white
            OyuncuSayisibuttonClicked = 0
        }
        
        
    }
    
    @IBAction func buttonTapped3(_ sender: Any) {
        
        userCount = 3
        if  oyuncuSayisi3.backgroundColor == UIColor.white {
            oyuncuSayisi3.backgroundColor = UIColor.green
            OyuncuSayisibuttonClicked = 1
            oyuncuSayisi2.backgroundColor = UIColor.white
            oyuncuSayisi4.backgroundColor = UIColor.white
            
        }
        
        else if oyuncuSayisi3.backgroundColor == UIColor.green {
            oyuncuSayisi3.backgroundColor = UIColor.white
            OyuncuSayisibuttonClicked = 0
            
            
        }
    }
    
    @IBAction func buttonTapped4(_ sender: Any) {
        userCount = 4
        if  oyuncuSayisi4.backgroundColor == UIColor.white {
            oyuncuSayisi4.backgroundColor = UIColor.green
            OyuncuSayisibuttonClicked = 1
            oyuncuSayisi2.backgroundColor = UIColor.white
            oyuncuSayisi3.backgroundColor = UIColor.white
        }
        else if   oyuncuSayisi4.backgroundColor == UIColor.green {
            oyuncuSayisi4.backgroundColor = UIColor.white
            OyuncuSayisibuttonClicked = 0
        }
        
        
    }
    @IBAction func kolayButtonTapped(_ sender: Any) {
        roomType = "kolay"
        if  kolayLevel.backgroundColor == UIColor.white {
            kolayLevel.backgroundColor = UIColor.green
            zorLevel.backgroundColor = UIColor.white
            normalLevel.backgroundColor = UIColor.white
            uzmanLevel.backgroundColor = UIColor.white
            SeviyeBelirlemebuttonClicked = 1
            
        }
        //        else if SeviyeBelirlemebuttonClicked == 1 && kolayLevel.backgroundColor == UIColor.green {
        //            kolayLevel.backgroundColor = UIColor.white
        //            SeviyeBelirlemebuttonClicked=0
        //        }
    }
    @IBAction func normalButtonTapped(_ sender: Any) {
        roomType = "normal"
        if normalLevel.backgroundColor == UIColor.white {
            normalLevel.backgroundColor = UIColor.green
            //SeviyeBelirlemebuttonClicked = 1
            zorLevel.backgroundColor = UIColor.white
            kolayLevel.backgroundColor = UIColor.white
            uzmanLevel.backgroundColor = UIColor.white
            SeviyeBelirlemebuttonClicked = 1
        }
        else if normalLevel.backgroundColor == UIColor.green {
            normalLevel.backgroundColor = UIColor.white
            
        }
    }
    @IBAction func zorButtonTapped(_ sender: Any) {
        roomType = "zor"
        if zorLevel.backgroundColor == UIColor.white {
            zorLevel.backgroundColor = UIColor.green
            SeviyeBelirlemebuttonClicked = 1
            normalLevel.backgroundColor = UIColor.white
            kolayLevel.backgroundColor = UIColor.white
            uzmanLevel.backgroundColor = UIColor.white
        }
        else if  zorLevel.backgroundColor == UIColor.green {
            zorLevel.backgroundColor = UIColor.white
            SeviyeBelirlemebuttonClicked = 0
        }
    }
    @IBAction func uzmanButtonTapped(_ sender: Any) {
        roomType = "uzman"
        if uzmanLevel.backgroundColor == UIColor.white {
            uzmanLevel.backgroundColor = UIColor.green
            zorLevel.backgroundColor = UIColor.white
            kolayLevel.backgroundColor = UIColor.white
            normalLevel.backgroundColor = UIColor.white
            SeviyeBelirlemebuttonClicked = 1
        }
        else if uzmanLevel.backgroundColor == UIColor.green {
            uzmanLevel.backgroundColor = UIColor.white
            SeviyeBelirlemebuttonClicked = 0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    @IBAction func OyunaBaslaButton(_ sender: Any) {
        
        if  SeviyeBelirlemebuttonClicked == 1 && OyuncuSayisibuttonClicked == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OdaOyunu")
            self.navigationController?.pushViewController(vc!, animated: true)
            print(userCount)
            print(roomType)
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        guard let urlString = URL(string: BASE_URL + "api/createRoom") else { return }
        var requestAPI = URLRequest(url: urlString)
        let token = UserDefaults.standard.string(forKey: "token")
        requestAPI.httpMethod = "POST"
        requestAPI.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestAPI.addValue("application/json", forHTTPHeaderField: "Accept")
        requestAPI.setValue("Bearer "+token!, forHTTPHeaderField: "Authorization")
        let newTodoItem = CreateRoom(userCount: userCount, type: roomType)
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        requestAPI.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: requestAPI) { (data, response, error) in
            if let data = data {
                do {
                    let str = String(decoding: data, as: UTF8.self)
                    print(str) // this is giving message HTTP Token: Access denied.
                    let json = try JSONDecoder().decode(CreateRoomResponseModel.self, from: data)
                    print (json)
                    
                    
                    
                    DispatchQueue.main.async {
                    
                
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
