//
//  ViewController.swift
//  CoreDataSaveImage
//
//  Created by NgocAnh on 5/16/18.
//  Copyright © 2018 NgocAnh. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        // Do any additional setup after loading the view, typically from a nib.
        //       imageVIew
    }
    func displayData() {
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
            imageVIew.image = entity.last?.image as? UIImage
        } catch  {
            print("Read Data Error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func show(_ sender: UIButton) {
       imageVIew.image = #imageLiteral(resourceName: "boy")
        let entity = Entity(context: AppDelegate.context)
        entity.image = imageVIew.image
        AppDelegate.saveContext()
    }
}

