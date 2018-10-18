//
//  NewsFeedManager.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//


import Foundation

class NewsFeedManager {
    static let sharedInstance = NewsFeedManager()

    fileprivate init() { }
    
}

extension NewsFeedManager {

    func getNewsFeed(completion:@escaping (_ errorString: String?, _ errorCode: Int?, _ data:[Results]) -> Void) {
        APIManager.sharedInstance.getNewsFeed(success: { (jsonResult) in
            
            if jsonResult.dictionary != nil{
                
                let arrNewsFeed:[Results] = Results.modelsFromDictionaryArray(array: jsonResult["results"].arrayObject! as NSArray)
                completion(nil, nil,arrNewsFeed)
            }
            
        }, failure: { (error) in
            let code = 500
            let msg = error.localizedDescription
            completion(msg, code,[])
        })
    }
    
}
