//
//  movieDetailViewController.swift
//  homework_02
//
//  Created by Yu Sum Yung on 8/7/2021.
//

import UIKit

struct MovieDetail {
    var trailerURL = ""
    var moviePosterURL = ""
    var movieNameText = ""
    var typeArray = [String]()
    var yearText = ""
    var actorsArray = [String]()
    var directorsText = ""
    
}

class movieDetailViewController: UIViewController{
    /*var movieDetail = [
        MovieDetail(actors: ["Rafe Spall", "Zahra Newman", "Ronny Chieng", "Dena Kaplan"], directors: ["Noni Hazlehurst"], ratings: "NR"),
        MovieDetail(actors: ["xxx", "xxx", "xxx", "xxx"], directors: ["yyy"], ratings: "zzz"),
        MovieDetail(actors: ["aaa", "aaa", "aaa", "aaa"], directors: ["bbb"], ratings: "ccc")
    ]*/
    
    var movieDetailData = MovieDetail()

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var watchTrailer: UIButton!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var lowerHalfView: UIView!
    @IBOutlet weak var lowerTableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieData()
        
        
        // for tableView
        lowerTableView.delegate = self
        lowerTableView.dataSource = self

        
    }
    
    func getMovieData(){
        movieName.text = movieDetailData.movieNameText
        
        var typeString = ""
        for elements in movieDetailData.typeArray{
            typeString = typeString + " " + elements
        }
        let yearArray = movieDetailData.yearText.components(separatedBy: " ")
        movieInfo.text = typeString + " | " + yearArray[3]
        
        
        
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
extension movieDetailViewController{
    
}


//MARK -UITableViewDelegate
extension movieDetailViewController: UITableViewDelegate{
    
}

//MARK -UITableViewDataSource
extension movieDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        //return movieDetail.count
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            //return movieDetail[section].actors.count
            return 3
        }
        if section == 1{
            //return movieDetail[section].directors.count
            return 3
        }
        if section == 2{
            //return movieDetail[section].ratings.count
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        //cell.textLabel!.text = movieDetail[indexPath.section].actors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var temp: String = ""
        if section == 0{
            temp = "Actors"
        }
        if section == 1{
            temp = "Directors"
        }
        if section == 2{
            temp = "Ratings"
        }
        return temp
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = .clear
        
        let lable = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width-15, height: 30))
        if section == 0{
            lable.text = "Actors"
        }
        if section == 1{
            lable.text = "Directors"
        }
        if section == 2{
            lable.text = "Ratings"
        }
        
        view.addSubview(lable)
        
        return view
    }
}



