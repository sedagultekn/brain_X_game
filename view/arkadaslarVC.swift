//
//  arkadaslarVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 13.09.2022.
//

import UIKit

class arkadaslarVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var userCount = 0
    var topUsers = [User]()
    @IBOutlet weak var arkadaslarTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arkadaslarTableView.delegate = self
        arkadaslarTableView.dataSource = self
       let url = URL(string:BASE_URL + "api/getUserInfo")!
        WebService().getUserDetails(url: url) { (arkadaslar) in
            if let arkadaslar = arkadaslar {
                print(arkadaslar)
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = arkadaslarTableView.dequeueReusableCell(withIdentifier: "ArkadaslarCell", for: indexPath) as! FriendsTableViewCell
        cell.textLabel?.text = " \(topUsers[indexPath.row].userName)"
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let urlString = URL(string: BASE_URL + "api/topUsers?TopCount=100") else { return }
        var requestAPI = URLRequest(url: urlString)
        let token = UserDefaults.standard.string(forKey: "token")
        requestAPI.httpMethod = "GET"
        requestAPI.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestAPI.addValue("application/json", forHTTPHeaderField: "Accept")
        requestAPI.setValue("Bearer "+token!, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: requestAPI) { (data, response, error) in
            if let data = data {
               // var topUsersList = [User]()
                do {
                    let str = String(decoding: data, as: UTF8.self)
                    print(str) // this is giving message HTTP Token: Access denied.
                    let json = try JSONDecoder().decode(DunyaSiralamasiData.self, from: data)
                    self.topUsers = json.data
                    print (json)
                    //var userCount = json.data.count
                        DispatchQueue.main.async {

                        }

                } catch let error {
                    print(error.localizedDescription)
                    print("Seems to have an error: \(error)")

               }
//                self.topUsers = topUsersList
                    
                DispatchQueue.main.async {
                    self.arkadaslarTableView.reloadData()
                }

            }
               }
               task.resume()
       
   
    


}
}
/*import UIKit
 class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
     // These strings will be the data for the table view cells
     let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
     
     let cellReuseIdentifier = "cell"
     let cellSpacingHeight: CGFloat = 5
     
     @IBOutlet var tableView: UITableView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         // These tasks can also be done in IB if you prefer.
         self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
         tableView.delegate = self
         tableView.dataSource = self
     }
     
     // MARK: - Table View delegate methods
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return self.animals.count
     }
     
     // There is just one row in every section
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     
     // Set the spacing between sections
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return cellSpacingHeight
     }
     
     // Make the background color show through
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = UIView()
         headerView.backgroundColor = UIColor.clear
         return headerView
     }
     
     // create a cell for each table view row
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
         
         // note that indexPath.section is used rather than indexPath.row
         cell.textLabel?.text = self.animals[indexPath.section]
         
         // add border and color
         cell.backgroundColor = UIColor.white
         cell.layer.borderColor = UIColor.black.cgColor
         cell.layer.borderWidth = 1
         cell.layer.cornerRadius = 8
         cell.clipsToBounds = true
         
         return cell
     }
     
     // method to run when table view cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // note that indexPath.section is used rather than indexPath.row
         print("You tapped cell number \(indexPath.section).")
     }
 }*/
