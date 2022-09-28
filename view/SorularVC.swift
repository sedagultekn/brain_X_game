//
//  SorularVC.swift
//  brain_X_game
//
//  Created by Seda Gültekin on 2.09.2022.
//

import UIKit

class SorularVC: UIViewController {
    
    var timer = Timer()
    var counter = 10
    
    @IBOutlet weak var soruLabel1: UILabel!
    @IBOutlet weak var soruLabel2: UILabel!
    @IBOutlet weak var islemLabel: UILabel!
    @IBOutlet weak var cevap1: UIButton!
    @IBOutlet weak var cevap2: UIButton!
    @IBOutlet weak var cevap3: UIButton!
    @IBOutlet weak var cevap4: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView! // view1 shadow
    @IBOutlet weak var view6: UIView! // view2 shadow
    @IBOutlet weak var view7: UIView! // view3 shadow
    @IBOutlet weak var view8: UIView! // view4 shadow
    @IBOutlet weak var soruView: UIView!
    @IBOutlet weak var sureLabel: UILabel!
    @IBOutlet weak var userPhotoView: UIImageView!
    let kolay = UserDefaults.standard.string(forKey: "kolayButton")
    let normal = UserDefaults.standard.string(forKey: "normalButton")
    let zor = UserDefaults.standard.string(forKey: "zorButton")
    let uzman = UserDefaults.standard.string(forKey: "uzmanButton")
    var mathFunction:[Character] = ["x","+","-","/"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(button1), userInfo: nil, repeats: false)
        view1.layer.cornerRadius = 4
        view5.layer.cornerRadius = 4
        cevap1.layer.cornerRadius = 4
        soruView.layer.cornerRadius = 6
        view2.layer.cornerRadius = 4
        view6.layer.cornerRadius = 4
        cevap2.layer.cornerRadius = 4
        view3.layer.cornerRadius = 4
        view7.layer.cornerRadius = 4
        cevap3.layer.cornerRadius = 4
        view4.layer.cornerRadius = 4
        view8.layer.cornerRadius = 4
        cevap4.layer.cornerRadius = 4
        soruLabel1.font = UIFont(name: "PinkChicken-Regular", size: 24)
        
        sureLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriSayim), userInfo: nil, repeats: true)
        
    }
    
    
    
    @objc func geriSayim(){
        counter -= 1
        sureLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            
            
            let main = UIStoryboard(name : "Main", bundle: nil)
            
            let second = main.instantiateViewController(withIdentifier: "OyunSonucuVC")
            second.modalPresentationStyle = .fullScreen
            self .present(second, animated: true, completion: nil)
            
            
            
            
            
 
}
}
   
    
    @IBAction func button1(_ sender: UIButton) {
       
        progressBar.progress -= Float(counter)
        if (((kolay?.isEmpty) == nil)){
            let randomSayi1 = Int.random(in: 1 ... 30)
            let randomSayi2 = Int.random(in: 1 ... 30)
            let randomislem = Int(arc4random() % UInt32(mathFunction.count))
            soruLabel1.text = String(randomSayi1)
            soruLabel2.text = String(randomSayi2)
            islemLabel.text = "\(mathFunction[randomislem])"
           print(randomSayi2)
            }
        
           else if ((normal?.isEmpty) == nil){
                let randomSayi1 = Int.random(in: 1 ... 50)
                let randomSayi2 = Int.random(in: 1 ... 50)
            let randomislem = Int(arc4random() % UInt32(mathFunction.count))
            soruLabel1.text = String(randomSayi1)
            soruLabel2.text = String(randomSayi2)
            islemLabel.text = "\(mathFunction[randomislem])"
               
            }
                
          else  if ((zor?.isEmpty) == nil){
                let randomSayi1 = Int.random(in: 1 ... 100)
                let randomSayi2 = Int.random(in: 1 ... 100)
            let randomislem = Int(arc4random() % UInt32(mathFunction.count))
            soruLabel1.text = String(randomSayi1)
            soruLabel2.text = String(randomSayi2)
            islemLabel.text = "\(mathFunction[randomislem])"
                
                }
                    
            else if ((uzman?.isEmpty) == nil){
                let randomSayi1 = Int.random(in: 1 ... 150)
                let randomSayi2 = Int.random(in: 1 ... 150)
            let randomislem = Int(arc4random() % UInt32(mathFunction.count))
            soruLabel1.text = String(randomSayi1)
            soruLabel2.text = String(randomSayi2)
            islemLabel.text = "\(mathFunction[randomislem])"
                
            }
        let randomSayi1 = Int()
        let randomSayi2 = Int()
        print(randomSayi2)
     //let randomislem = 10
        if (randomSayi1 != 0) && (randomSayi2 != 0) {
     soruLabel1.text = String(randomSayi1)
     soruLabel2.text = String(randomSayi2)
    // islemLabel.text = "\(mathFunction[randomislem])"
        }
    
     let intRandomSayi1 = Int(randomSayi1)
        
     let  intRandomSayi2 = Int(randomSayi2)
   //  let islem = Int(randomislem)
     // let dogruCevap = "\(intRandomSayi1) \(Character(extendedGraphemeClusterLiteral: mathFunction[randomislem])) \(intRandomSayi2)"
     //        let dogruCevap = ["  ",\(intRandomSayi1 + intRandomSayi2)","\(intRandomSayi1 - intRandomSayi2)","\(intRandomSayi1 / intRandomSayi2)","\(intRandomSayi1 * intRandomSayi2)"
     //    ]
  
     let dogruCevap = [
         ["\(intRandomSayi1) + \(intRandomSayi2)","\(intRandomSayi1 + intRandomSayi2)"],
         ["\(intRandomSayi1) - \(intRandomSayi2)","\(intRandomSayi1 + intRandomSayi2)"],
         ["\(intRandomSayi1) / \(intRandomSayi2)","\(intRandomSayi1 + intRandomSayi2)"],
         
         ["\(intRandomSayi1) + \(intRandomSayi2)","\(intRandomSayi1 + intRandomSayi2)"]
     ]
     var lastRandomNumber = -1

     func randomFact() -> String {
         let randomNumber = arc4random_uniform(UInt32(dogruCevap.count))

         if randomNumber == lastRandomNumber {
             return randomFact()
         } else {
             lastRandomNumber = Int(randomNumber)
             return dogruCevap[Int(randomNumber)][1]
         }
     }
     
     print(dogruCevap[0][1])
     print(dogruCevap[1][1])
     print(dogruCevap[2][1])
     print(dogruCevap[3][1])
     
     cevap1.setTitle("\(dogruCevap[Int(arc4random_uniform(3))][1])", for: .normal)
   
     cevap2.setTitle("\(dogruCevap[Int(arc4random_uniform(3))][1])", for: .normal)
    
     cevap3.setTitle("\(dogruCevap[Int(arc4random_uniform(3))][1])", for: .normal)
   
     cevap4.setTitle("\(dogruCevap[Int(arc4random_uniform(3))][1])", for: .normal)
     //randomFact()
      }
    
    func islem(){
    
     
     
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
                            
                            //self.userPhotoView = UIImage(json.data.photo!)
                        }
                    
                } catch let error {
                    print(error.localizedDescription)
                    print("Seems to have an error: \(error)")
                    
                }
                
            }
               }
               task.resume()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
 }
