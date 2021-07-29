//
//  ViewController.swift
//  homework_02
//
//  Created by Nicole on 6/7/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let movieURL = "http://trailers.apple.com/trailers/home/feeds/just_added.json"
    var movieArray = [MovieData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieData()
        
        //for tableView
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

//MARK: - getData
extension ViewController{
    func getMovieData(){
        let url = URL(string: movieURL)
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([MovieData].self, from: data)
                self.movieArray = decodedData
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}


//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data =  movieArray[indexPath.row]
        let nextVC = storyboard?.instantiateViewController(identifier: "movieDetailViewController") as? movieDetailViewController

        nextVC!.movieDetailData.trailerURL = "http://trailers.apple.com" + data.trailers[0].url
        nextVC!.movieDetailData.moviePosterURL = data.poster_2x
        nextVC!.movieDetailData.movieNameText = data.title
        nextVC!.movieDetailData.typeArray = data.genre
        nextVC!.movieDetailData.yearText = data.releasedate
        nextVC!.movieDetailData.actorsArray = data.actors
        nextVC!.movieDetailData.directorsText = data.directors
        nextVC!.movieDetailData.ratingText = data.rating

        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
}


//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell

        cell.movieName.text = movieArray[indexPath.row].title
        cell.directorName.text = movieArray[indexPath.row].directors
        
        let imageURL = URL(string: movieArray[indexPath.row].poster)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL!)
            DispatchQueue.main.async {
                cell.posterImage.image = UIImage(data: data!)
            }
        }
        return cell
    }
}






