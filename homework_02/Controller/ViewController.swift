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
    let movieURL = "http://trailers.apple.com/trailers/home/feeds/just_added.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //for navigationItems
        title = "Movie Trailers"
        configureItems()
        
        //for tableView
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        //for URLSession
        let url = URL(string: "https://trailers.apple.com/trailers/home/feeds/just_added.json")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error{
                print("Error: ", error)
                return
            }
            
            //let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, AnyObject>
            //print(json)
            
            
            
            
        }
        task.resume()
    }
    
    //Navigation stuffs
    private func configureItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
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
    
    /*func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        
        return "Movie Trailers"
    }
    */
    
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLable : UILabel = UILabel()
        if section == 0 {
            titleLable.text = " Movie Trailers"
            titleLable.font = UIFont.boldSystemFont(ofSize: 30)
            
            
        }
        return titleLable
    }
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //println
    }
    
    func performRequest(urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
        
    }
}



    
    
   
    




