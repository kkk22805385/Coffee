//
//  SelAreaViewController.swift
//  Coffee
//
//  Created by aa on 2021/1/11.
//

import UIKit

class SelAreaViewController: UIViewController {

    @IBOutlet var areaTable: UITableView!
    @IBOutlet var btnDetermine: UIButton!
    var areaStas = [areaSta]()
    override func viewDidLoad() {
        super.viewDidLoad()

        btnDetermine.layer.shadowOffset = CGSize.init(width: 0, height: 3)//默认为0,-3
        btnDetermine.layer.shadowColor = UIColor.black.cgColor
        btnDetermine.layer.shadowOpacity = 0.6//阴影透明度，默认0
        btnDetermine.layer.cornerRadius = 24
        
        areaTable.register(UINib.init(nibName: "AreaTableViewCell", bundle: nil),forCellReuseIdentifier:"AreaTableViewCell")
        
        areaStas.removeAll()
        for area in globalValue().arrayCountry {
            let areasta = areaSta()
            areasta.area = area
            areasta.sta = "0"
            areaStas.append(areasta)
        }
        
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDetermine(_ sender: Any) {
    }
}

extension SelAreaViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaStas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaTableViewCell", for: indexPath as IndexPath) as! AreaTableViewCell
        cell.labelArea.text = areaStas[indexPath.row].area
        if areaStas[indexPath.row].sta == "0" {
            cell.imageDet.isHidden = true
        }else{
            cell.imageDet.isHidden = false
        }
        
        return cell
    }
    
    
}

class areaSta :NSObject{
    var area = ""
    var sta = ""
}

