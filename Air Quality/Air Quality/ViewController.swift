//
//  ViewController.swift
//  Air Quality
//
//  Created by Максим Юрисов on 09.11.2022.
//

import UIKit
var characters:[(name: String, value: Int)] = [(name: "Moscow", value: 0),(name: "New-York", value: 0),(name: "London", value: 0),(name: "Tokio", value: 0),(name: "Paris", value: 0),(name: "Athens", value: 0),(name: "Beijing", value: 0),(name: "Berlin", value: 0),(name: "Istanbul", value: 0),(name: "Sydney", value: 0)]
//var characters = ["Moscow", "New-York", "London", "Tokio", "Paris", "Berlin", "Athens", "Beijing"]
//var indexes = [0, 0, 0, 0, 0, 0, 0, 0]
class ViewController: BaseController {

    let tableView = UITableView()
    
   
    let network:Network = Network()
    override func loadView() {
      super.loadView()
        view.backgroundColor = Colors.background
        setupTableView()
        title = "List"
        
        tableView.dataSource = self
        tableView.register(PpmTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = Colors.background
        loaddata()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func loaddata(){
        var ind:[(name: String, value: Int)] = []
         for (index,char) in characters.enumerated(){
         network.getPpm(completion: { city, ppm in
             print(ppm)
             
             ind.append((name: city, value: ppm))
             if ind.count == characters.count{
                 characters = ind
                 DispatchQueue.main.async {
                     self.tableView.reloadData()
                     //print(indexes[2])
                 }
                 
             }
        
         }, city: char.name)
       
         }
       

     }
    

}

extension ViewController{
    
    func setupTableView() {
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
   
}
extension ViewController: UITableViewDataSource {
   
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PpmTableViewCell
      
      cell.cityLabel.text = characters[indexPath.row].name
      cell.ppmLabel.text = String(characters[indexPath.row].value)
      cell.ppmLabel.textColor = returncolor(ppmLevel: characters[indexPath.row].value)
      cell.backgroundColor = Colors.background
      cell.mapImageView.image = UIImage(named: characters[indexPath.row].name)
    return cell
  }
}
