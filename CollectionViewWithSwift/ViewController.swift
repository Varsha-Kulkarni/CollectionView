//
//  ViewController.swift
//  CollectionViewWithSwift
//
//  Created by Varsha on 28/04/15.
//  Copyright (c) 2015 URC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cellNames = [String]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cellNames.append("0")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addItem(AnyObject)
    {
        var num = String(cellNames.count)
        cellNames.append(num)
        let insertIndexPath = NSIndexPath(forItem: cellNames.count - 1, inSection: 0)
        println("The shopping list contains \(cellNames.count) items.")

        collectionView.insertItemsAtIndexPaths([insertIndexPath])
    }
    
    
    //UIColloctionView Datasource Protocol methods
    
  
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return cellNames.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell 
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell

        cell.label.text = cellNames[indexPath.row]
    
        return cell;
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        cellNames.removeAtIndex(indexPath.row)
    
        collectionView.deleteItemsAtIndexPaths([indexPath]);
    }


}

