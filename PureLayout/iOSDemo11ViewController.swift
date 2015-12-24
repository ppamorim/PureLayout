//
//  iOSDemo1ViewController.swift
//  PureLayout Example-iOS
//
//  Copyright (c) 2015 Pedro Paulo de Amorim
//  https://github.com/PureLayout/PureLayout
//

import UIKit
import PureLayout

@objc(iOSDemo11ViewController)
class iOSDemo11ViewController: UIViewController {
  
    let tableView : UITableView = {
        let tableView = UITableView.newAutoLayoutView()
        tableView.registerClass(iOSDemo1ViewCell.self, forCellReuseIdentifier: "iOSDemo1ViewCell")
        return tableView
    }()
  
    let items = ["item 1", "item 2", "item 3", "item 4"]
  
    var didSetupConstraints = false
  
    override func loadView() {
        view = UIView()
    
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    
        view.setNeedsUpdateConstraints() // bootstrap Auto Layout
    }
  
    override func updateViewConstraints() {
        // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
        // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
        // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
        if (!didSetupConstraints) {
            // TableView will be pinned on the sides of the screen.
            tableView.autoPinEdgesToSuperviewEdges()
      
            didSetupConstraints = true
        }
    
        super.updateViewConstraints()
    }
  
}

extension iOSDemo11ViewController: UITableViewDelegate {
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
  
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
  
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
  
}

extension iOSDemo11ViewController: UITableViewDataSource {
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count ?? 0
    }
  
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! iOSDemo1ViewCell).load(items[indexPath.row])
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("iOSDemo1ViewCell", forIndexPath: indexPath)
    }
  
}