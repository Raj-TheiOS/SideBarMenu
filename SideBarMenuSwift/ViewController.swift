//
//  ViewController.swift
//  SideBarMenuSwift
//
//  Created by Raj on 13/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource,UITableViewDelegate {
    var arrayData = ["Writing","Reading","Listening","Speaking"]
    var arrayImg = [#imageLiteral(resourceName: "writing"),#imageLiteral(resourceName: "reading"),#imageLiteral(resourceName: "listening"),#imageLiteral(resourceName: "speaking"),#imageLiteral(resourceName: "aboutus")]
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sidebar: UITableView!
    
    var isSideViewOpen:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideView.isHidden = true
        sidebar.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrayData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lbl.text = arrayData[indexPath.row]
        cell.img.image = arrayImg[indexPath.row]
        return cell
    }
    @IBAction func btnMenu(_ sender: UIButton) {
        sidebar.isHidden = false
        sideView.isHidden = false
        self.view.bringSubview(toFront: sideView)
        if !isSideViewOpen {
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 64, width: 0, height: 603)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 603)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 64, width: 218, height: 603)
            sidebar.frame = CGRect(x: 0, y: 0, width: 218, height: 603)
            UIView.commitAnimations()
        } else {
            sidebar.isHidden = true
            sideView.isHidden = true
            isSideViewOpen = false
            sideView.frame = CGRect(x: 0, y: 64, width: 218, height: 603)
            sidebar.frame = CGRect(x: 0, y: 0, width: 218, height: 603)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 64, width: 0, height: 603)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 603)
            UIView.commitAnimations()
        }
    }
}

