//
//  ViewController.swift
//  Algorithms
//
//  Created by Ameya Jathar on 05/06/17.
//  Copyright © 2017 Ngyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var algoTable: UITableView!
    let algoCellIdentifier = "ALgoCell"
    var algoArray: Array<Dictionary<String, String>> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        algoTable.register(UITableViewCell.self, forCellReuseIdentifier: algoCellIdentifier)
        algoArray = getAlgoJSON()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Tableview dataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algoArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: algoCellIdentifier)!
        
        cell.textLabel?.text = algoArray[indexPath.row]["Algo"]
        return cell;
    }
    
    
    //Read Algorithms JSON
    private func getAlgoJSON() -> Array<Dictionary<String, String>> {
        do {
            if let file = Bundle.main.url(forResource: "AlgoList", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    return object["Algorithms"] as! Array<Dictionary<String, String>>
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}
