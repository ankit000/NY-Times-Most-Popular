//
//  ViewController.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblNewsFeed: UITableView!
    
    var arrNewsFeed = [Results]()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        self.getNewsFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

    // MARK: - Custom Methods

    func setData() {
        tblNewsFeed.rowHeight = UITableView.automaticDimension
        tblNewsFeed.estimatedRowHeight = 117
        self.title = "NY Times Most Popular"
    }

    func getNewsFeed()  {
        
        NewsFeedManager.sharedInstance.getNewsFeed() { (error, code, data) in
            print("")
            self.arrNewsFeed = data
            self.tblNewsFeed.reloadData()
        }
        
    }
    
    
    func navigateToDetailPage(row:Int)  {
        
        let model:Results = arrNewsFeed[row]

        let storyboard = UIStoryboard(name:"Main", bundle: Bundle.main)
        let detailView = (storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController)
        detailView.strTitle = model.title!
        detailView.strAbstract = model.abstract!

        self.navigationController?.pushViewController(detailView, animated: true)
        
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNewsFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newsCell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        let model:Results = arrNewsFeed[indexPath.row]

        newsCell.configureWithItem(item:model)
        newsCell.selectionStyle = .none
        return newsCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigateToDetailPage(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
