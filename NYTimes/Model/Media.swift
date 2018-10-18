//
//  Media.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//


import Foundation
 

public class Media {
	public var type : String?
	public var subtype : String?
	public var caption : String?
	public var copyright : String?
	public var approved_for_syndication : Int?
	public var mediametadata : Array<Mediametadata>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let media_list = Media.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Media Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Media]
    {
        var models:[Media] = []
        for item in array
        {
            models.append(Media(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let media = Media(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Media Instance.
*/
	required public init?(dictionary: NSDictionary) {

		type = dictionary["type"] as? String
		subtype = dictionary["subtype"] as? String
		caption = dictionary["caption"] as? String
		copyright = dictionary["copyright"] as? String
		approved_for_syndication = dictionary["approved_for_syndication"] as? Int
        if (dictionary["media-metadata"] != nil) { mediametadata = Mediametadata.modelsFromDictionaryArray(array: dictionary["media-metadata"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.subtype, forKey: "subtype")
		dictionary.setValue(self.caption, forKey: "caption")
		dictionary.setValue(self.copyright, forKey: "copyright")
		dictionary.setValue(self.approved_for_syndication, forKey: "approved_for_syndication")

		return dictionary
	}

}
