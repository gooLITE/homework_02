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
        
        //for navigationItems
        self.title = "Movie Trailers"
        configureItems()
        
        //for tableView
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //Navigation stuffs
    private func configureItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
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
                print("updated movieArray")
                
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        let sectionLabel = UILabel(frame: CGRect(x: 10, y: 20, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionLabel.font = UIFont(name: "Helvetica", size: 30)
        sectionLabel.textColor = UIColor.black
        sectionLabel.text = "Movie Trailers"
        sectionLabel.sizeToFit()
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headerView.addSubview(sectionLabel)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let nextVC = movieDetailViewController()
        //nextVC.movieName.text = "movieName"
        
        self.navigationController?.pushViewController(nextVC, animated: true)
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






