//
//  ViewController.swift
//  RealmExample
//
//  Created by algo on 5/16/16.
//  Copyright © 2016 algostudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var selectedIndexPath = NSIndexPath()
    
    var models = [ClassModel]()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        models = DbHelper.getAll()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerNib(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let vc = tableView.dequeueReusableCellWithIdentifier("Cell") as! Cell
        
        vc.lblName.text = models[indexPath.row].name
        vc.lblAddress.text = models[indexPath.row].address
        
        return vc
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            DbHelper.deleteByName(models[indexPath.row].name)
            models = DbHelper.getAll()
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPath = indexPath
        self.performSegueWithIdentifier("Segue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Segue" {
            let vc = segue.destinationViewController as! EditViewController
            vc.address = models[selectedIndexPath.row].address
            vc.name = models[selectedIndexPath.row].name
        }
    }
    
    /**
     *  thank your for watching :)
     */

}

