//
//  movieDetailViewController.swift
//  homework_02
//
//  Created by Yu Sum Yung on 8/7/2021.
//

import UIKit

class movieDetailViewController: UIViewController {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var watchTrailer: UIButton!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var lowerHalfView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


/*extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
}*/
