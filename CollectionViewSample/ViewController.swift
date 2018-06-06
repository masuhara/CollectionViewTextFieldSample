//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by Masuhara on 2018/06/06.
//  Copyright © 2018年 Ylab, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {

    var numbers = [Int]()
    
    @IBOutlet weak var numberCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberCollectionView.dataSource = self
        numberCollectionView.delegate = self
        
        let nib = UINib(nibName: "NumberCollectionViewCell", bundle: Bundle.main)
        numberCollectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return numbers.count
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCollectionViewCell
        cell.numberTextField.delegate = self
        
        return cell
    }
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // MARK: - TextField Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as! NumberCollectionViewCell
        let indexPath = numberCollectionView.indexPath(for: cell)
        print(indexPath, textField.text)
    }

    
}




