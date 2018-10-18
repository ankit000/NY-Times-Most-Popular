//
//  APIManager.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//



import Alamofire
import SwiftyJSON
let apiKey  = "a2e2ec79bb2d4860b2c80d0352dedd96"

let BaseURL  = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key="

class APIManager {

    
    static let sharedInstance = APIManager()
    fileprivate init() {
        
    }
    
    //MARK:- News Api call

    func getNewsFeed(
        success:@escaping (_ jsonResult: JSON) -> Void,
        failure:@escaping (_ error: Error) -> Void) {
        let url = String(format:"%@%@",BaseURL,apiKey)
        
        self.callGETApi(url: url, success: { (json) in
            success(json)
        }) { (error) in
            failure(error)
        }
    }
    
    //MARK:- SERVER CALLS
    
    func callGETApi(
        url: String,
        success:@escaping (_ jsonResult: JSON) -> Void,
        failure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default)
            .validate()
            .responseData { response in }
            .responseString(completionHandler: { (res) in
                
                print(res)
            })
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        success(json)
                    }
                case .failure(let error):
                    failure(error)
                }
        
        }
    }

}

