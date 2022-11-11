//
//  Network.swift
//  Air Quality
//
//  Created by Максим Юрисов on 10.11.2022.
//

import Foundation



public class Network {
    func getPpm(completion:((String, Int)->Void)?, city: String?){
        var addres: String {
            let one = "https://api.waqi.info/feed/"
            
            let two = "/?token=a1e53b0037dc71826defeea4dabaf5e790d86ef5"
            guard let city = city else {
                return ""
            }
            let result = one+city+two
        return result
            
        }
        
        let url = URL(string:addres)
        let session = URLSession(configuration: .default)
        
        
        let datatask = session.dataTask(with: url!) { data, responce, error in
          
           if error != nil {
               print("error")
                print(error)
                return
                
            }

            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String,Any>
            if json == nil{
                print("json nil")
                return
            }
            let dataArray = json?["data"] as? Dictionary<String,Any>
            if dataArray == nil{
                print("data nil")
                return
            }
           
            let ppm = dataArray?["aqi"] as? Int
            if ppm == nil{
                print("ppm nil")
                    return
            }
            completion!(city!, ppm!)
            
            
            
        }
        
        datatask.resume()
       
        
    }
}
