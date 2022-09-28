//
//  LoginService.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 27.08.2022.
//

import UIKit

class LoginService: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var uyelikOlusturButton: UIButton!
    @IBOutlet weak var parolamiUnuttumButton: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    //let token = UserDefaults.standard.string(forKey: "token")

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    func ApiLoginManager(){
        // let token = "token"  //dönen token değeri yazılacak
        let  url_ =  URL(string:BASE_URL + "api/login")
        guard let requestUrl = url_ else{ fatalError()}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
       var token = UserDefaults.standard.string(forKey: "token")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        let newTodoItem = LoginRequestModel(userName: userNameTextField.text!, password: passwordTextField.text!)
        let jsonData = try? JSONEncoder().encode(newTodoItem)
        request.httpBody = jsonData
        // Set HTTP Request Header
        if (userNameTextField.text!.isEmpty  && passwordTextField.text!.isEmpty){
            print("false")
        }else{
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                guard let data = data else {return}
                do{
                    let todoItemModel = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                    print("Response data:\n \(todoItemModel)")
                    print("todoItemModel Title: \(todoItemModel.code)")
                    print("todoItemModel token: \(todoItemModel.data.token )")
                    UserDefaults.standard.set(todoItemModel.data.token,forKey: "token")
                    UserDefaults.standard.synchronize()
                   // var usertoken = UserDefaults.standard.string(forKey: "token")
                    
                    var request = URLRequest(url: URL(string:BASE_URL + "api/login")!)
                    request.httpMethod = "POST"
                   
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    request.setValue("application/json", forHTTPHeaderField: "Accept")
                    request.setValue("Bearer " + todoItemModel.data.token, forHTTPHeaderField: "Authorization")
                    request.httpBody = jsonData
                    
                
                    DispatchQueue.main.async {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OyunSecimVC")
                        self.navigationController?.pushViewController(vc!, animated: true)
                        vc?.navigationController?.isToolbarHidden = true
                    }
                    
                    print(request)
                }catch let jsonErr{
                    print(jsonErr)
                }
            }
            task.resume() }
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func toUyelikOlustur(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterService")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    @IBAction func toParolamıUnuttum(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "parolamiUnuttumVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func logginButton(_ sender: Any) {
    //var token = UserDefaults.standard.string(forKey: "token")
     
        if (userNameTextField.text != nil && passwordTextField.text != nil){
            ApiLoginManager()
        }
        
//        let usertoken2 = UserDefaults.standard.string(forKey: "usertoken")
//        if usertoken2?.isEmpty == nil{
//            let  url_ =  URL(string:BASE_URL + "api/login")
//            guard let requestUrl = url_ else{ fatalError()}
//            var request = URLRequest(url: requestUrl)
//            request.httpMethod = "POST"
//            request.allHTTPHeaderFields = [
//                "Authorization": "\(usertoken2))",
//               "Content-Type": "application/json"
//            ]
//            
//        }
        
    }


    override func viewWillAppear(_ animated: Bool) {
    navigationController?.isToolbarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
 
        
    }
    
}
