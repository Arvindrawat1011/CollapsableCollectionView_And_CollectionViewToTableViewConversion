//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Appinventiv Technologies on 30/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit



class FirstPage: UIViewController {
    
    enum TapMode : String {
        case gesture,button
    }
    
    @IBOutlet weak var HHHHH: SectionHeader!
    
    
    
    struct Objects {
        var SectionName: String
        var SectionObjects: [String]
        var labelOne :[String]
        var Expand : Bool
        var Change : Bool
        var buttonSelected : Bool
    }
    var clickOnButton = false
    var objectArray = [Objects]()
    var tempBtn = 0
    var tapMode : TapMode = .gesture
    
    //    var objectArray = Objects( SectionObjects: ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16","p17","p18","p19","p20","p21","p22","p23","p24","p25","p26","p27","p28","p29","p30","p31"],
    //       labelOne:["Mac 13 inch","Acer 13.3 inch","MSI 15.6 inch","HP 15 inch","Samsung 15.6 inch ","Samsung 13.3 inch","HP 15 inch","ASUS 15.6 inch","Sony Vaio 13.3 inch","ASUS 15.6 inch","Lenovo 14.5 inch","ASUS 13.3 inch  ","Samsung 13.3 inch","aaa","bbb","ccc","777","adada","adada","adada","adada","adada","adada","adada","adada","adada","adada","adada","adada","adada","adada"])
    
    
    var tag = Bool()
    
    @IBOutlet weak var firstPageCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstPageCollection.delegate = self
        self.firstPageCollection.dataSource = self
        
        
        
        objectArray = [Objects(SectionName: "Laptops",
                               SectionObjects:["laptop1","laptop2","laptop3","laptop4","laptop5","laptop6","laptop7","laptop8","laptop9","laptop10","laptop11","laptop12","laptop13"],
                               labelOne:["Mac 13 inch","Acer 13.3 inch","MSI 15.6 inch","HP 15 inch","Samsung 15.6 inch ","Samsung 13.3 inch","HP 15 inch","ASUS 15.6 inch","Sony Vaio 13.3 inch","ASUS 15.6 inch","Lenovo 14.5 inch","ASUS 13.3 inch  ","Samsung 13.3 inch"],Expand:false, Change: false, buttonSelected: false),
                       
                       Objects(SectionName: "Phones",
                               SectionObjects:["phone1","phone2","phone3", "phone4","phone5","phone6","phone7","phone8"],
                               labelOne:["1","2","3","4","5","6","7","8"],Expand:false, Change: false, buttonSelected: false),
                       
                       
                       
                       Objects(SectionName: "Mix Pictures",
                               SectionObjects:["p1","p2","p3", "p4","p5","p6","p7","p8","p9","p10","p11", "p12","p13","p14","p15","p16","p17","p18","p19","p20","p21","p22","p23","p24", "p25","p26","p27","p28","p29"],
                               labelOne:["1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8","1","2","3","4","5","6","7","8","asd","asda","51","21","29"],Expand:false, Change: false, buttonSelected: false)]
        
        
        
        
    }
    
    
    
    
    
    
    @IBAction func headerBtn(_ sender: UIButton) {
        print("button pressed")
        
        self.tapMode = .button
        var index:Int = 0
        
    
        guard let header = getHeader(view: sender) as? SectionHeader else {
            return
        }
        let indexPaths = self.firstPageCollection.indexPathsForVisibleSupplementaryElements(ofKind: UICollectionElementKindSectionHeader)
        for indexPath in indexPaths {
            
            if header == firstPageCollection.supplementaryView(forElementKind: UICollectionElementKindSectionHeader, at: indexPath){
                index = indexPath.section
                objectArray[(indexPath.section)].buttonSelected = !objectArray[indexPath.section].buttonSelected
                
            }
        }
        firstPageCollection.reloadSections([index])

    
    }
    
}
    



extension FirstPage : UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return objectArray[section].SectionObjects.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let cell = firstPageCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!  CollectionCELL
        print(#function)
        
        cell.Img.image = UIImage(named: objectArray[indexPath.section].SectionObjects[indexPath.row])
        cell.lblName.text = objectArray[indexPath.section].labelOne[indexPath.row]
        
        
        
    
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 6
        return cell
    }
    
    
    func getCell(button: UIButton) -> UICollectionViewCell{
        var cell : UIView = button
        while !(cell is CollectionCELL) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? CollectionCELL else {fatalError()}
        return tableCell
    }
    func getHeader(view: UIView) -> UICollectionReusableView? {
        var cell : UIView = view
        while !(cell is UICollectionReusableView) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        return cell as? UICollectionReusableView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(objectArray.count)
        return objectArray.count
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
        
    {
        print(#function)
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
        print(#function)
        header.headerLabel.text = objectArray[indexPath.section].SectionName
        if objectArray[indexPath.section].Expand {
            header.headerImage.image = UIImage(named:"Down")
        }
        else
        {
            header.headerImage.image = UIImage(named:"rightArrow")
        }
        if objectArray[indexPath.section].buttonSelected{
            
             header.headerButton.setTitle("TableView", for: .normal)
            
        }
        else
        {
                 print(objectArray[indexPath.section].buttonSelected)
                  header.headerButton.setTitle("GridView", for: .normal)
        }
        
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectSection(gesture:)))
        header.addGestureRecognizer(gestureRecognizer)
        return header
        
        
    }
    
    
    @objc func didSelectSection(gesture: UITapGestureRecognizer)
    {
        
        self.tapMode = .gesture
        print("tapped Gestures")
        var index = 0
        let indexPaths = self.firstPageCollection.indexPathsForVisibleSupplementaryElements(ofKind: UICollectionElementKindSectionHeader)
        
        
        for indexPath in indexPaths {
            
            if (gesture.view as? SectionHeader) == firstPageCollection.supplementaryView(forElementKind: UICollectionElementKindSectionHeader, at: indexPath){
                index = indexPath.section
                print("found at : \(indexPath.section)")
                objectArray[(indexPath.section)].Expand = !objectArray[indexPath.section].Expand
                
            }
        }
        //    for i in 0..<objectArray[index].SectionObjects.count
        //      {
        //
        //        print(objectArray[index].SectionObjects)
        // firstPageCollection.reloadItems(at: [IndexPath(row: i, section: index)])
        //
        //    }
        tempBtn = 0
        self.firstPageCollection.reloadSections([index])
        
    }}

//
//  @objc  func tapGesture1(gestureRecognizer: UITapGestureRecognizer)
//    {
//

// print(" header TApped")

//        guard let cell = getCell(button: mySender) as? S else { return print("atalError()") }
//        guard let indexPath = firstPageCollection.indexPath(for: cell) else { fatalError() }
//        objectArray[indexPath.section].Expand = !objectArray[indexPath.section].Expand
//        firstPageCollection.reloadData()
//
//         let tapLocation = gestureRecognizer.view as! SectionHeader
//         let temp = getCell(lblname:UILabel) as! CollectionCELL
//        let index = firstPageCollection.indexPath(for: temp)
//        print(indexPath.row)

//        guard let tableCell = self.getCell(lblname: sender) as? SectionHeader else {fatalError()}
//
//        guard let index = self.customTableView.indexPath(for: tableCell) else {fatalError()}


//    objectArray[(index.section)!].Expand = !objectArray[(index?.section)!].Expand
//

//     firstPageCollection.reloadData()
//
//        objectArray[0].Expand = false
//
//        print(objectArray[0].Expand)




//    }



extension FirstPage: UICollectionViewDelegateFlowLayout{
    
    private func heightForRow(forIndex indexpath : IndexPath) -> CGSize {
        
     if objectArray[indexpath.section].Expand == false{
            
            return CGSize(width: 0, height:0)
        }else{
            
            if objectArray[indexpath.section].buttonSelected {
                print(objectArray[indexpath.section].buttonSelected)
                return CGSize(width: 300, height: 80)
                
            }else{
                print(objectArray[indexpath.section].buttonSelected)
                return CGSize(width: 120, height: 80)
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return self.heightForRow(forIndex: indexPath)
        
    }
    
    //                  }
    //        if tempBtn == 1{
    //            objectArray[indexPath.section].Change = clickOnButton
    //            if objectArray[indexPath.section].Change == false{
    //                return CGSize(width: 100, height:100)
    //            }else{
    //                return CGSize(width: 300, height: 80)
    //            }
    //        }
    //        else {
    //            if  objectArray[indexPath.section].Expand == false{
    //
    //
    //                return CGSize(width:0, height:0)
    //
    //            }else{
    //
    //
    //                return CGSize(width: 100, height: 100)
    //            }
    //
    //        }
    //
    //
    //    }
    //
    //}
}

class CollectionCELL: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var Img: UIImageView!
    
}

