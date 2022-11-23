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
//    
//    override func viewWillAppear(_ animated: Bool) {
//    navigationController?.isToolbarHidden = true
//        infoButton.layer.cornerRadius = 20.0
//        cikisButton.layer.cornerRadius = 20.0
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//
//        guard let urlString = URL(string: BASE_URL + "api/getRoomUsers") else { return }
//        var requestAPI = URLRequest(url: urlString)
//        let token = UserDefaults.standard.string(forKey: "token")
//        requestAPI.httpMethod = "POST"
//        requestAPI.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        requestAPI.addValue("application/json", forHTTPHeaderField: "Accept")
//        requestAPI.setValue("Bearer "+token!, forHTTPHeaderField: "Authorization")
//
//        let jsonData = try? JSONEncoder().encode(newTodoItem)
//        requestAPI.httpBody = jsonData
//        let task = URLSession.shared.dataTask(with: requestAPI) { (data, response, error) in
//            if let data = data {
//                do {
//                    let str = String(decoding: data, as: UTF8.self)
//                    print(str) // this is giving message HTTP Token: Access denied.
//                    let json = try JSONDecoder().decode(CreateRoomResponseModel.self, from: data)
//                    print (json)
//
//
//
//                    DispatchQueue.main.async {
//
//
//                    }
//
//                } catch let error {
//
//                    print(error.localizedDescription)
//                    print("Seems to have an error: \(error)")
//
//                }
//
//            }
//        }
//        task.resume()
//    }
//}
}
