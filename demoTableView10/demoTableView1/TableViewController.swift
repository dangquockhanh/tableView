//
//  TableViewController.swift
//  demoTableView1
//
//  Created by Đặng Khánh  on 5/22/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController ,PassData, DeleteIndexPath {
    func delete(at indexPAth: IndexPath) {// delete6
        person.remove(at: indexPAth.row)
        tableView.reloadData()
    }
    
    
    //sua du lieu
    func hienthi(name: String, age: String, image: UIImage) {
        if let index = tableView.indexPathForSelectedRow {
        person[index.row].name = name
        person[index.row].age = age
        person[index.row].image = image
        }else{
            person.append(Person(name: name, age: age, image: image)) // thêm du lieu
           
        }
    tableView.reloadData()
    }
    
    var person = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()

        person = [
            //Person(name: "hoang", age: "17", image: (UIImage(named: "1")?.pngData())!),
            Person(name: "hoang", age: "18", image: UIImage(named: "1")!),
            Person(name: "linh", age: "19", image: UIImage(named: "2")!),
            Person(name: "Van", age: "20", image: UIImage(named: "3")!),
        ]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // hien thi du lieu sang man viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ViewController
        if let index = tableView.indexPathForSelectedRow { // lay vi tri dòng dc chọn
         vc?.perSon = person[index.row] // gán du lieu tu tableview sang viewcontroller qua perSon
        }
        vc?.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return person.count
    }

    // hien thi cell tren tableview
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.deleGate = self //delete5
        cell.indexPath = indexPath
        let list = person[indexPath.row]
        cell.labelname.text = list.name
        cell.labelage.text = list.age
        cell.images.image = list.image
        return cell
    }
}
    

