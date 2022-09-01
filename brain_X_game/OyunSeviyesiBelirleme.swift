//
//  OyunSeviyesiBelirleme.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 29.08.2022.
//
import UIKit
class OyunSeviyesiBelirleme: UIViewController {
    let urlString = "http://75.119.129.105:8000/api/getUserInfo"
    override func viewDidLoad() {
        super.viewDidLoad()
        //let urlString = "http://75.119.129.105:8000/api/getUserInfo"
        fetchData()
    }
    @objc func refreshData() -> Void
        {
            fetchData()
        }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isToolbarHidden = false
    }
    func fetchData() {
            let url = URL(string: urlString)
            let defaultSession = URLSession(configuration: .default)
            let dataTask = defaultSession.dataTask(with: url!) {
                (data: Data?, response: URLResponse?,error: Error?) in
                if(error != nil)
                {  print(error!)
                    return
                }
                do
                {
                    let json = try JSONDecoder().decode(GetUserInfoModel.self, from: data!)
                    print("response" + json.code)
                }
                catch
                {
                    print(error)
                    return
                }
            }
            dataTask.resume()
        }

}
 



