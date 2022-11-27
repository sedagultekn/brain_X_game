//
//  OyunOdasıVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 15.09.2022.
//

import UIKit

class OyunOdasiVC: UIViewController {

    @IBOutlet weak var gamer1: UIImageView!
    @IBOutlet weak var gamer2: UIImageView!
    @IBOutlet weak var gamer3: UIImageView!
    @IBOutlet weak var gamer4: UIImageView!
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

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//
//        gamer1.image = nil
//            // let token = "token"  //dönen token değeri yazılacak
//            let  url_ =  URL(string:BASE_URL + "getRoomUsers?RoomId=1008")
//            guard let requestUrl = url_ else{ fatalError()}
//            var request = URLRequest(url: requestUrl)
//            request.httpMethod = "GET"
//           var token = UserDefaults.standard.string(forKey: "token")
//            request.addValue("application/json", forHTTPHeaderField: "accept")
//            request.addValue("application/json", forHTTPHeaderField: "content-type")
//            request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
////            let newTodoItem = LoginRequestModel(userName: userNameTextField.text!, password: passwordTextField.text!)
////            let jsonData = try? JSONEncoder().encode(newTodoItem)
////            request.httpBody = jsonData
////            // Set HTTP Request Header
////            if (userNameTextField.text!.isEmpty  && passwordTextField.text!.isEmpty){
////                print("false")
//
//                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//                    if let error = error {
//                        print("Error took place \(error)")
//                        return
//                    }
//                    guard let data = data else {return}
//                    do{
//                        let todoItemModel = try JSONDecoder().decode(GetRoomsUsers.self, from: data)
//                        if let image = UIImage(data: data){
//                            self.gamer1.image = image
//                        }
//
//                        //                        print("Response data:\n \(todoItemModel)")
////                        print("todoItemModel Title: \(todoItemModel.code)")
////                        print("todoItemModel token: \(todoItemModel.data.token )")
////                        UserDefaults.standard.set(todoItemModel.data.token,forKey: "token")
////                        UserDefaults.standard.synchronize()
//                       // var usertoken = UserDefaults.standard.string(forKey: "token")
//
//                        var request = URLRequest(url: URL(string:BASE_URL + "api/login")!)
//                        request.httpMethod = "POST"
////
////                        request.setValue("application/json", forHTTPHeaderField: "content-type")
////                        request.setValue("application/json", forHTTPHeaderField: "Accept")
////                        request.setValue("Bearer " + todoItemModel.data.token, forHTTPHeaderField: "Authorization")
//
//
//
//                        DispatchQueue.main.async {
//                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OyunSecimVC")
//                            self.navigationController?.pushViewController(vc!, animated: true)
//                            vc?.navigationController?.isToolbarHidden = true
//                        }
//
//                        print(request)
//                    }catch let jsonErr{
//                        print(jsonErr)
//                    }
//                }
//                task.resume() }    }
//
//
}
