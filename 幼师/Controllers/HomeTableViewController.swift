//
//  HomeTableViewController.swift
//  幼师
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
  let pushASegueId = "pushToAViewController"
  let pushBSegueId = "pushToBViewController"
    var dataArray = [HomeModel]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(HomeCell.initNib(), forCellReuseIdentifier: HomeCell.reuseId)
        self.loadData()
    }
    //加载首页数据
    func loadData(){
        NetWorkTool.getHomeData(withUrl: "http://static.youshikoudai.com/mockapi/data") { [weak self](data) in
            self?.dataArray = data
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseId, for: indexPath) as! HomeCell
        cell.delegate = self
        cell.loadModel(model: dataArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataArray[indexPath.row].contentHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:HomeCellDelegate
extension HomeTableViewController:HomeCellDelegate{
    
    func homeCellDidSelectAButton() {
       self.performSegue(withIdentifier: pushASegueId, sender: nil)
    }
    func homeCellDidSelectBButton() {
        self.performSegue(withIdentifier: pushBSegueId, sender: nil)
    }
}
