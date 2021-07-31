//
//  SettingTableViewCell.swift
//  SettingsApp
//
//  Created by Vipin Pahwa on 25/07/21.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconCotnainer)
        iconCotnainer.addSubview(iconImageView)
        
        contentView.clipsToBounds = true
        
        accessoryType = .disclosureIndicator
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconCotnainer.backgroundColor = nil
        iconImageView.image = nil
        label.text = nil
    }
    
    func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconCotnainer.backgroundColor = model.iconBackgroundColour
    }
}
