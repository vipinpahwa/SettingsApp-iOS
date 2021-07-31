//
//  ViewController.swift
//  SettingsApp
//
//  Created by Vipin Pahwa on 25/07/21.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColour: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableViewCell")
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configure() {
        let generalOptions: [SettingsOption] = [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColour: .systemPink, handler: { print("Tapped") }),
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColour: .systemBlue, handler: {}),
            SettingsOption(title: "Airplane mode", icon: UIImage(systemName: "airplane"), iconBackgroundColour: .systemGreen, handler: {}),
            SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColour: .systemYellow, handler: {})
        ]
        models.append(
            Section(title: "General", options: generalOptions)
        )
        models.append(
            Section(title: "Information", options: generalOptions)
        )
        models.append(
            Section(title: "Apps", options: generalOptions)
        )
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = models[section]
        return model.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}
