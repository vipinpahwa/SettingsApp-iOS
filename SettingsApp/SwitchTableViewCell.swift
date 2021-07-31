//
//  SwitchTableViewCell.swift
//  SettingsApp
//
//  Created by Vipin Pahwa on 01/08/21.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    static let identifier = "SwitchTableViewCell"
    
    private let iconCotnainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private let label: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        return l
    }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemBlue
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconCotnainer)
        iconCotnainer.addSubview(iconImageView)
        contentView.addSubview(mySwitch)
        
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconCotnainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize = size / 1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 25 + iconCotnainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 15 - iconCotnainer.frame.size.width - 10,
                             height: contentView.frame.size.height)
        
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(x: contentView.frame.size.width - mySwitch.frame.size.width - 20,
                                y: (contentView.frame.size.height - mySwitch.frame.size.height)/2,
                             width: mySwitch.frame.size.width,
                             height: mySwitch.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconCotnainer.backgroundColor = nil
        iconImageView.image = nil
        label.text = nil
        mySwitch.isOn = false
    }
    
    func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconCotnainer.backgroundColor = model.iconBackgroundColour
        mySwitch.isOn = model.isOn
    }
}
