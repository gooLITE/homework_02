//
//  ViewController.swift
//  homework_02
//
//  Created by Nicole on 6/7/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let myData = ["first", "second", "third"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // TableView Functons
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {             //set no. of rows of the table
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    // set content of the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
                                                                                            //allow cell to access MovieListTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        return "Movie Trailers"
    }
}



    
    
   
    




