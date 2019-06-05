//
//  ViewController.swift
//  TableViewFunctions
//
//  Created by Himanshu Singh on 04/06/19.
//  Copyright © 2019 Himanshu Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var numbers = [0,1,2,3,4,5,6,7,8]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label?.text = "\(numbers[indexPath.row])"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete{
//            numbers.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
////            self.tabBarController? = UITabBar(frame: CGRect(x: 0, y: 10, width: self.view.frame.width, height: 90))
////            tableView.reloadData()
//        }
//    }

//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let add = UITableViewRowAction(style: .normal, title: "Add") { (action, index) in
//            print("Add")
//        }
//        add.backgroundColor = .blue
//
//        let update = UITableViewRowAction(style: .normal, title: "Update") { (action, index) in
//            print("Add")
//        }
//        update.backgroundColor = .green
//       let im =  UIImage(named: "sa")
////        update.provideImageData(<#T##data: UnsafeMutableRawPointer##UnsafeMutableRawPointer#>, bytesPerRow: <#T##Int#>, origin: <#T##Int#>, <#T##y: Int##Int#>, size: <#T##Int#>, <#T##height: Int##Int#>, userInfo: <#T##Any?#>)
//        let delete = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) in
//            print("Add")
//        }
//        delete.backgroundColor = .red
//
//
//        return [add,update,delete]
//
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = UIContextualAction(style: .normal, title: "Add") { action, view, complete in
            self.insertNewRow()
            complete(true)
        }
        add.image = UIImage(named: "sa")
        add.backgroundColor = .blue
        let update = UIContextualAction(style: .normal, title: "Update") { action, view, complete in
            
            
            complete(true)
        }

        let delete = UIContextualAction(style: .normal, title: "Delete") { action, view, complete in
            self.DeleteARow(indexPath: indexPath)
            complete(true)
        }
        add.image = UIImage(named: "add")
        add.title = "Add"
        update.image = UIImage(named: "update")
        update.title = "Update"
        delete.image = UIImage(named: "delete")
        delete.title = "Delete"
        add.backgroundColor = .blue
        update.backgroundColor = .green
        delete.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [delete,update,add])
    }
    
    func DeleteARow(indexPath: IndexPath)
    {
        numbers.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)

    }
    
    func insertNewRow()
    {
        numbers.append(tableView.numberOfRows(inSection: 0))
        let indexPath = IndexPath(row: numbers.count-1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath] ,with: .fade)
        tableView.endUpdates()
    }
//
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        super.setEditing(true, animated: true)
//        self.tableView.setEditing(true, animated: true)
//        tableView.reloadData()
//    }
    
//
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        tableView.delegate = self
    }


}

