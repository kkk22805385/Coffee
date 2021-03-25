//
//  CoffeeViewController.swift
//  Coffee
//
//  Created by aa on 2021/1/5.
//

import UIKit

class CoffeeViewController: UIViewController {
    
    var type = ""
    var country = "全部"
    var coffeeDatas = [CoffeeData]()
    let imgbg = [UIImage(named: "coffee1.jpeg"),UIImage(named: "coffee2.jpeg"),UIImage(named: "coffee3.jpeg"),UIImage(named: "coffee4.jpeg"),UIImage(named: "coffee5.jpeg")]
    
    @IBOutlet var labelType: UILabel!
    @IBOutlet var tableCoffee: UITableView!
    let loadViewController = LoadViewController(nibName: "LoadViewController", bundle: nil)
    
    
    override func viewDidLoad() {
        labelType.text = type
        tableCoffee.register(UINib.init(nibName: "CoffeeCell", bundle: nil),forCellReuseIdentifier:"CoffeeCell")
        getCoffeeData(engCountry:changeName(str: country))
        tableCoffee.separatorStyle = .none
        
    }
 
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnArea(_ sender: Any) {
        let vc = SelAreaViewController(nibName: "SelAreaViewController", bundle: nil)
        vc.country = country
        vc.delegata = self
        present(vc, animated: true, completion: nil)
    }
    
    
    func getCoffeeData(engCountry:String){
        self.view.addSubview(loadViewController.view)
        let address = "https://cafenomad.tw/api/v1.2/cafes/" + engCountry
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    let decoder = JSONDecoder()
                   
                    if let coffeeData = try? decoder.decode([CoffeeData].self, from: data) {
                        DispatchQueue.main.sync{
                            self.coffeeDatas.removeAll()
                           for coffee in coffeeData{
                               let coffeeStruct = CoffeeData(name: coffee.name, city: coffee.city, wifi: coffee.wifi, seat: coffee.seat, quiet: coffee.quiet, tasty: coffee.tasty, cheap: coffee.cheap, music: coffee.music, url: coffee.url, address: coffee.address, latitude: coffee.name, longitude: coffee.longitude, limited_time: coffee.limited_time, socket: coffee.socket, standing_desk: coffee.standing_desk, mrt: coffee.mrt, open_time: coffee.open_time)
                                
                                self.coffeeDatas.append(coffeeStruct)
                            }
                            self.tableCoffee.reloadData()
                            self.closeLoad(viewController: self.loadViewController)
                        }
                    }
                }
            }.resume()
        } else {
            print("Invalid URL.")
        }
    }
    func closeLoad(viewController : UIViewController){
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
        viewController.view.removeFromSuperview()
    }
    
    func getScore( data : CoffeeData) -> Int {
        let score = data.wifi + data.seat + data.quiet + data.tasty + data.cheap + data.music
        let average = score / 6
        return Int(average)
    }
}

extension CoffeeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeCell", for: indexPath as IndexPath) as! CoffeeCell
        
        let data = coffeeDatas[indexPath.row]
        
        cell.labelName.text = data.name
        cell.labelAddress.text = data.address
        
        let score = getScore(data: data)
        if score == 1 {
            cell.imgFirst.image = UIImage(named: "star-fill.png")
            cell.imgSecond.image = UIImage(named: "star.png")
            cell.imgThrid.image = UIImage(named: "star.png")
            cell.imgFour.image = UIImage(named: "star.png")
            cell.imgFive.image = UIImage(named: "star.png")
        }
        if score == 2 {
            cell.imgFirst.image = UIImage(named: "star-fill.png")
            cell.imgSecond.image = UIImage(named: "star-fill.png")
            cell.imgThrid.image = UIImage(named: "star.png")
            cell.imgFour.image = UIImage(named: "star.png")
            cell.imgFive.image = UIImage(named: "star.png")
        }
        if score == 3 {
            cell.imgFirst.image = UIImage(named: "star-fill.png")
            cell.imgSecond.image = UIImage(named: "star-fill.png")
            cell.imgThrid.image = UIImage(named: "star-fill.png")
            cell.imgFour.image = UIImage(named: "star.png")
            cell.imgFive.image = UIImage(named: "star.png")
        }
        if score == 4 {
            cell.imgFirst.image = UIImage(named: "star-fill.png")
            cell.imgSecond.image = UIImage(named: "star-fill.png")
            cell.imgThrid.image = UIImage(named: "star-fill.png")
            cell.imgFour.image = UIImage(named: "star-fill.png")
            cell.imgFive.image = UIImage(named: "star.png")
        }
        if score == 5 {
            cell.imgFirst.image = UIImage(named: "star-fill.png")
            cell.imgSecond.image = UIImage(named: "star-fill.png")
            cell.imgThrid.image = UIImage(named: "star-fill.png")
            cell.imgFour.image = UIImage(named: "star-fill.png")
            cell.imgFive.image = UIImage(named: "star-fill.png")
        }
        
        cell.imgBackground.image = imgbg[indexPath.row % 5]
        return cell
    }
}

extension CoffeeViewController : SelAreaViewControllerDelegate{
    func retCountry(strCountry: String) {
        country = strCountry
        getCoffeeData(engCountry: changeName(str: country))
    }
}
