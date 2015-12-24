//
//  iOSDemo1ViewCell.swift
//  PureLayout Example-iOS
//
//  Copyright (c) 2015 Pedro Paulo de Amorim
//  https://github.com/PureLayout/PureLayout
//

import UIKit
import PureLayout

@objc(iOSDemo1ViewCell)
class iOSDemo1ViewCell: UITableViewCell {
  
    var didUpdateConstraints = false
  
    let title : UILabel = {
        let title = UILabel.newAutoLayoutView()
        title.textColor = UIColor.blackColor()
        title.textAlignment = .Center
        return title
    }()
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        self.updateConstraintsIfNeeded()
    }
  
    override func updateConstraints() {
        // Check a flag didSetupConstraints before creating constraints, because this method may be called multiple times, and we
        // only want to create these constraints once. Without this check, the same constraints could be added multiple times,
        // which can hurt performance and cause other issues. See Demo 7 (Animation) for an example of code that runs every time.
        if !didUpdateConstraints {
            //Center the title on the center of cell
            title.autoPinEdgesToSuperviewEdges()
      
            didUpdateConstraints = true
        }
        super.updateConstraints()
    }
  
    func load(title : String) {
        self.title.text = title
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
  
}