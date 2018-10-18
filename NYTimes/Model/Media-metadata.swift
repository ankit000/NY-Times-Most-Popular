//
//  Mediametadata.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//

import Foundation
 
public class Mediametadata {
	public var url : String?
	public var format : String?
	public var height : Int?
	public var width : Int?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let Mediametadata_list = Mediametadata.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Mediametadata Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Mediametadata]
    {
        var models:[Mediametadata] = []
        for item in array
        {
            models.append(Mediametadata(dictionary: item as! NSDictionary))
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let Mediametadata = Mediametadata(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Mediametadata Instance.
*/
	required public init(dictionary: NSDictionary) {

		url = dictionary["url"] as? String
		format = dictionary["format"] as? String
		height = dictionary["height"] as? Int
		width = dictionary["width"] as? Int
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.format, forKey: "format")
		dictionary.setValue(self.height, forKey: "height")
		dictionary.setValue(self.width, forKey: "width")

		return dictionary
	}

}
