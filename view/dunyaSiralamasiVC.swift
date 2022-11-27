//
//  dunyaSiralamasiVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 13.09.2022.
//

import UIKit

class dunyaSiralamasiVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    func roomsData( URL url:String,completion: @escaping ([GetRooms])->Void){
//        let url = URL(string: url)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            if data != nil && error == nil{
//                do {
//                    let parsingData = try JSONDecoder().decode([GetRooms].self, from: data!)
//                    completion(parsingData)
//                }
//
//            catch {
//                print("Parsing error") }
//            }
//
//        }
//        dataTask.resume()
//    }
    override func viewWillAppear(_ animated: Bool) {
   
        guard let urlString = URL(string: BASE_URL + "api/getRooms?page=1&count=20") else { return }
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
                    let json = try JSONDecoder().decode(GetRooms.self, from: data)
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
//extension ViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return     }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//}
