//
//  MovieManager.swift
//  homework_02
//
//  Created by Yu Sum Yung on 20/7/2021.
//

import Foundation

protocol MovieManagerDelegate{
    func didUpdateMovie()
    func didFailWithError(error: Error)
}

struct MovieManager{
    var delegate: MovieManagerDelegate?
    let movieURL = "http://trailers.apple.com/trailers/home/feeds/just_added.json"
    var movieArray = [MovieData]()

    
    
}
        
            
/*
        if let url = URL(string: movieURL){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    print("inside parseJSON")
                    do{
                        let decodedData = try decoder.decode([MovieData].self, from: data!)
                        print ("here \(decodedData)")
                    } catch{
                        delegate?.didFailWithError(error: error)
                        print("caught error: \(error)")
                        return nil
                    }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Int?{
        let decoder = JSONDecoder()
        print("inside parseJSON")
        do{
            let decodedData = try decoder.decode([MovieData].self, from: data)
            print ("here \(decodedData)")
            return decodedData.count
        } catch{
            delegate?.didFailWithError(error: error)
            print("caught error: \(error)")
            return nil
        }
    }
    
    mutating func getRowNumber(){
        //var movieArray: NSArray = []
        let url = NSURL(string: movieURL)
        let data = NSData(contentsOf: url! as URL)
        
        do{
            movieArray = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        }
        catch{
            print("error: \(error)")
        }
    }

}
*/
