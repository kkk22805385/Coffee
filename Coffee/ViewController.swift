//
//  ViewController.swift
//  Coffee
//
//  Created by aa on 2021/1/5.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableType: UITableView!
    var types = [type]()
    
    override func viewDidLoad() {
        tableType.register(UINib.init(nibName: "TypeCell", bundle: nil),forCellReuseIdentifier:"TypeCell")
        types = getType()
        tableType.tableFooterView = UIView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableType.reloadData()
    }
    func getType() -> [type]{
        var types = [type]()
        types.append(type(name: "咖啡店", image: UIImage(named: "coffee")!))
        return types
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let coffeeVC = segue.destination as? CoffeeViewController {
            coffeeVC.type = "咖啡廳"
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath as IndexPath) as! TypeCell

        cell.labelName.text = types[indexPath.row].name
        cell.imgBg.image = types[indexPath.row].image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "searchCoffee", sender: self)
    }
}

