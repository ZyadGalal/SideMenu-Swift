//
//  ViewController.swift
//  SideMenu
//
//  Created by zyad on 9/13/18.
//  Copyright © 2018 zyad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var sideMenuBtn: UIButton!
    let LabelTextArray = ["hi","how are you","thank you","where are you"]
    var isOpened = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuTableView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openSideMenuBtnClicked(_ sender: Any) {
      
        if isOpened == 0
        {
            UIView.animate(withDuration: 0.75) {
                self.sideMenuTableView.frame = CGRect(x: 0, y: self.sideMenuTableView.frame.origin.y, width: self.sideMenuTableView.frame.width, height: self.sideMenuTableView.frame.height)
            }
            isOpened = 1
        }
        else
        {
            UIView.animate(withDuration: 0.75) {
                self.sideMenuTableView.frame = CGRect(x: -244, y: self.sideMenuTableView.frame.origin.y, width: self.sideMenuTableView.frame.width, height: self.sideMenuTableView.frame.height)
            }
            isOpened = 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LabelTextArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = LabelTextArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        textLbl.text = LabelTextArray[indexPath.row]
        openSideMenuBtnClicked(self)
    }
}

