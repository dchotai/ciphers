//
//  TableViewController.swift
//  ciphers
//
//  Created by Divyesh Chotai on 12/20/16.
//  Copyright © 2016 Divyesh Chotai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let methods = ["Morse Code", "Caesarian Shift"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cipherCell")! as UITableViewCell
        cell.textLabel?.text = methods[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: "showMorse", sender: self)
        } else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "showCaesarianShift", sender: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }


}
