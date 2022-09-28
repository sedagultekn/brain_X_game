//
//  parolamiUnuttumVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 9.09.2022.
//

import UIKit

class parolamiUnuttumVC: UIViewController {

    @IBOutlet weak var ePostaSifirla: UITextField!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var parolaSifirlaButton: UIButton!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func sendConfirmCodeButton(_ sender: Any) {
        let  url_ =  URL(string:BASE_URL + "api/sendConfirmationCode")
        guard let requestUrl = url_ else{ fatalError()}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
    //   var token = UserDefaults.standard.string(forKey: "token")
      //  request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "content-type")
     //   request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        let newTodoItem = SendCodeModel(email: ePostaSifirla.text!)
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        request.httpBody = jsonData
        // Set HTTP Request Header
        if (ePostaSifirla.text == nil){
            print("false")
        }else{
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let todoItemModel = try JSONDecoder().decode(SendConfirmationCodeResponse.self, from: data)
//                    print("Response data:\n \(todoItemModel)")
//                    print("todoItemModel Title: \(todoItemModel.code)")
//                    print("todoItemModel token: \(todoItemModel.data.token )")
//                    UserDefaults.standard.set(todoItemModel.data.token,forKey: "token")
//                    UserDefaults.standard.synchronize()
//                   // var usertoken = UserDefaults.standard.string(forKey: "token")
//
//                    var request = URLRequest(url: URL(string:BASE_URL + "api/login")!)
//                    request.httpMethod = "POST"
//
//                    request.setValue("application/json", forHTTPHeaderField: "content-type")
//                    request.setValue("application/json", forHTTPHeaderField: "Accept")
//                    request.setValue("Bearer " + todoItemModel.data.token, forHTTPHeaderField: "Authorization")
//                    request.httpBody = jsonData
//
//
//                    DispatchQueue.main.async {
//                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OyunSecimVC")
//                        self.navigationController?.pushViewController(vc!, animated: true)
//                        vc?.navigationController?.isToolbarHidden = true
//                    }
                    
                    print(request)
                }catch let jsonErr{
                    print(jsonErr)
                }
            }
            task.resume() }
        }
    }
    



