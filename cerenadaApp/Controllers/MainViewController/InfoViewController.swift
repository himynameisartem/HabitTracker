//
//  InfoViewController.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 31.10.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    let infoTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var openSections = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "infoCell")
        
        view.backgroundColor = .white
        
        createInfoTableView()
        
    }
    
    //MARK: - Create Info Table View
    
    func createInfoTableView() {
        
        view.addSubview(infoTableView)
        
        NSLayoutConstraint.activate([
        
            infoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 13
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
            
            cell.addSubview(cell.infoLabel)
            cell.addSubview(cell.arrow)
            cell.makeLabelConstraints()
            cell.makeArrowConstraints()

            cell.infoLabel.text = "Check"
            
            if openSections {
                cell.arrow.image = UIImage(systemName: "chevron.compact.up")
            } else {
                cell.arrow.image = UIImage(systemName: "chevron.compact.down")
            }
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
            
            cell.addSubview(cell.infoLabel)
            cell.makeLabelConstraints()
            
            cell.infoLabel.text = "More Check"
            
            return cell
            
        }
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            tableView.deselectRow(at: indexPath, animated: true)
            
            openSections = !openSections
            tableView.reloadSections([indexPath.section], with: .none)
            //        tableView.reloadData()
        }
    }
    
    
}
