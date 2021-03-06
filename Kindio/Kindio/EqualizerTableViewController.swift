//
//  EqualizerTableViewController.swift
//  Kindio
//
//  Created by Alin Petrus on 5/17/16.
//  Copyright © 2016 Alin Petrus. All rights reserved.
//

import UIKit

class EqualizerTableViewController: UITableViewController {
    var playSession : PlaySession?
    
    var presetsArray : [String]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Equalizer Options"
        self.view.backgroundColor = UIColor.blueCharcoal()
        self.tableView.estimatedRowHeight = 45
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if let presets = presetsArray {
            return presets.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        
        
        cell.contentView.backgroundColor = UIColor.blueCharcoal()
        cell.backgroundColor = UIColor.blueCharcoal()
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Adjust equalizer"
        } else {
            cell.textLabel?.text = self.presetsArray![indexPath.row]
            
            if let session = self.playSession {
                if (indexPath.row == session.eqPreset) {
                    cell.accessoryView = UIImageView.init(image: UIImage.init(imageLiteral: "rockinIt"))
                } else {
                    cell.accessoryView = nil
                }
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if (indexPath.section == 0) {
            let eqVC = AdjustableEqualizerViewController() as AdjustableEqualizerViewController
            eqVC.playSession = self.playSession
            self.navigationController?.pushViewController(eqVC, animated: true)
        } else {
            if let session = self.playSession {
                session.selectEQPreset(indexPath.row)
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Custom"
        } else {
            return "Presets"
        }
    }
    
}
