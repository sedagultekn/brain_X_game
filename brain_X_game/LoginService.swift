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
    
    //let token = UserDefaults.standard.string(forKey: "token")
var isLoggin = false
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
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Set HTTP Request Header
        if (userNameTextField.text!.isEmpty  && passwordTextField.text!.isEmpty){
            print("false")
            
        }else{
            let newTodoItem = LoginRequestModel(userName: userNameTextField.text!, password: passwordTextField.text!)
            
            let jsonData = try? JSONEncoder().encode(newTodoItem)
            request.httpBody = jsonData
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
                    DispatchQueue.main.async {
                    if(!todoItemModel.data.token.isEmpty){
                        let usertoken = "Bearer " + todoItemModel.data.token
                        request.httpMethod = "POST"
                        request.setValue(usertoken, forHTTPHeaderField: "Authorization")
                        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                        print(usertoken)
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OyunSecimVC")
                        self.navigationController?.pushViewController(vc!, animated: true)
                        vc?.navigationController?.isToolbarHidden = true
                    }}
                }catch let jsonErr{
                    print(jsonErr)
                }
            }
            task.resume() }
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logginButton(_ sender: Any) {
    //var token = UserDefaults.standard.string(forKey: "token")
     
        if (userNameTextField.text != nil && passwordTextField.text != nil){
//            ApiLoginManager()
//            let request = NSMutableURLRequest(url: NSURL(string:BASE_URL + "api/login")! as URL)
//
//            let accessToken = UserDefaults.standard.string(forKey: "token")
//            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            ApiLoginManager()
            print("butona basıldı")
           
          
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    
}
