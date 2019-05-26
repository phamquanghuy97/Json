//
//  ViewController.swift
//  Json
//
//  Created by Phạm Huy on 5/23/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var myTable: UITableView!
    var ArrUrlAvatar = [String]()
    var ArrID = [Int]()
    var ArrFullname = [String]()
    final let urlApi = "https://api.github.com/users/google/repos"
    override func viewDidLoad() {
        myTable.delegate = self
        myTable.dataSource = self
        self.getDataJson()
        super.viewDidLoad()
    }
    func getDataJson(){
        let url = NSURL(string: urlApi)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in

            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray {
                let item2 = jsonObj?.value(forKey: "full_name") as? NSArray
                for x in item2!{
                    self.ArrFullname.append(x as! String)
                }
                let item = jsonObj?.value(forKey: "owner") as? NSArray // get all objs have id
                for element in item!{ // load element of item
                    guard let i = element as? NSDictionary else { return } // load in 1 obj have id
                    let Object = google()
                    Object.parseData(json: i as! [String : Any])
                    self.ArrID.append(Object.id!)
                    self.ArrUrlAvatar.append(Object.avatar_url!)
                }
//                print(self.ArrID)
//                print("Name ",self.ArrFullname)
                OperationQueue.main.addOperation({
                    self.myTable.reloadData()
                })
            }
        }).resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ArrFullname.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.fullname_lbl.text = "Name: " + self.ArrFullname[indexPath.row]
        cell.ID_lbl.text = "ID: " + String(self.ArrID[indexPath.row])
        let Img = DispatchQueue(label: "load image tu API")
        Img.async {
            let u = URL(string: self.ArrUrlAvatar[indexPath.row])
            do {
                let data = try Data(contentsOf: u!)
                DispatchQueue.main.async {
                    cell.Img_avarta.image = UIImage(data: data)
                }

            } catch{}
        }
        return cell
    }

}

