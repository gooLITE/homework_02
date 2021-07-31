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
    var ratingText = ""
}

class movieDetailViewController: UIViewController{
    
    var movieDetailData = MovieDetail()

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var watchTrailer: UIButton!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieInfo: UILabel!
    @IBOutlet weak var lowerHalfView: UIView!
    @IBOutlet weak var lowerTableView: UITableView!
    @IBOutlet weak var background: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieData()
        
        
        // for tableView
        lowerTableView.delegate = self
        lowerTableView.dataSource = self
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
    }
    
    func getMovieData(){
        movieName.text = movieDetailData.movieNameText
        
        var typeString = ""
        for elements in movieDetailData.typeArray{
            typeString = typeString + " " + elements
        }
        let yearArray = movieDetailData.yearText.components(separatedBy: " ")
        movieInfo.text = typeString + " | " + yearArray[3]
        
        let imageURL = URL(string: movieDetailData.moviePosterURL)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL!)
            DispatchQueue.main.async {
                self.moviePoster.image = UIImage(data: data!)
                self.background.image = UIImage(data: data!)
            }
        }
    }

    @IBAction func clickWatchTrailer(_ sender: UIButton) {
        let url = URL(string: movieDetailData.trailerURL)
        UIApplication.shared.open(url!)
    }
    
}

//MARK -UITableViewDelegate
extension movieDetailViewController: UITableViewDelegate{
    
}

//MARK -UITableViewDataSource
extension movieDetailViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return movieDetailData.actorsArray.count
        }
        if section == 1{
            return 1
        }
        if section == 2{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        switch indexPath.section{
        case 0:
            cell.textLabel?.text = movieDetailData.actorsArray[indexPath.row]
        case 1:
            cell.textLabel?.text = movieDetailData.directorsText
        case 2:
            cell.textLabel?.text = movieDetailData.ratingText
        default:
            cell.textLabel?.text = "Invalid section"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        view.backgroundColor = .white
        
        let lable = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width, height: 50))
        
        if section == 0{
            lable.text = "Actors"
            lable.font = UIFont.boldSystemFont(ofSize: 25)
        }
        if section == 1{
            lable.text = "Directors"
            lable.font = UIFont.boldSystemFont(ofSize: 20)
        }
        if section == 2{
            lable.text = "Ratings"
            lable.font = UIFont.boldSystemFont(ofSize: 20)
        }
        
        view.addSubview(lable)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}





