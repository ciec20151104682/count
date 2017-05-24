//
//  ViewController.swift
//  counter
//
//  Created by s20151104682 on 17/4/19.
//  Copyright © 2017年 s20151104682. All rights reserved.
//

import UIKit
class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

    @IBOutlet weak var bodyone: UIImageView!
    @IBOutlet weak var bodytwo: UIImageView!
   @IBOutlet weak var scoretwo: UILabel!
   @IBOutlet weak var scoreone: UILabel!
   @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    var sone:Int = 0
    var stwo:Int = 0
    var onescore:Int=0
    var twoscore:Int=0
    var score:Int=0
    var dlg:Int=0
    var flag1:Int=0
    var flag2:Int=0
    
 
    @IBAction func photo1(_ sender: Any) {
        if (dlg==0)
        {
            flag1=0
            flag2=1
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let picker = UIImagePickerController()
                picker.delegate=self
                picker.sourceType=UIImagePickerControllerSourceType.photoLibrary
                self.present(picker,animated: true,completion:
                    {
                        ()->Void in
                })
                
            }else{
                print("错误!")
            }
        }
    }

    
    
    @IBAction func photo(_ sender: Any)
    {
        if (dlg==0)
        {
            flag1=1
            flag2=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
            {
                let picker = UIImagePickerController()
                picker.delegate=self
                picker.sourceType=UIImagePickerControllerSourceType.photoLibrary
                self.present(picker,animated: true,completion:
                {
                    ()->Void in
                })
                
            }else{
                print("错误!")
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
        {
        print(info)
        let  image:UIImage!
        image=info[UIImagePickerControllerOriginalImage]as!UIImage
        if (flag1==1) {
            bodyone.image=image
        }else if (flag2==1) {
            bodytwo.image=image
        }
        picker.dismiss(animated: true, completion:
            {
                ()->Void in
            })
        }

    @IBAction func oneup(_ sender: Any)
    {
        sone=sone+1;
        one.text=("\(sone)");
        if(sone>=11&&sone>=2+stwo)
        {
            onescore=1+onescore;
            sone=0;
            stwo=0;
            scoreone.text=("\(onescore)");
            //scoretwo.text=("\(twoscore)");
            one.text=("\(sone)");
            two.text=("\(stwo)");
        
        }
        if(onescore == 3){
            let alertVC = UIAlertController(title: "提示", message: "A胜！！！", preferredStyle: UIAlertControllerStyle.alert)
            sone=0;
            stwo=0;
            onescore=0;
            twoscore=0;
            scoreone.text=("\(onescore)");
            scoretwo.text=("\(twoscore)");
            one.text=("\(sone)");
            two.text=("\(stwo)");
            let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.destructive) { (UIAlertAction) -> Void in
                print("click Sure")
            }
            let acCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) {
                (UIAlertAction) -> Void in
                print("click Cancel")
            }
            alertVC.addAction(acSure)
            alertVC.addAction(acCancel)
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func twoup(_ sender: Any)
    {
        stwo=stwo+1;
        two.text=("\(stwo)");
        if(stwo>=11&&stwo>=2+sone)
        {
            twoscore=1+twoscore;
            sone=0;
            stwo=0;
            //scoreone.text=("\(onescore)");
            scoretwo.text=("\(twoscore)");
            one.text=("\(sone)");
            two.text=("\(stwo)");
        }
        if(twoscore == 3){
            let alertVC = UIAlertController(title: "提示", message: "B胜！！！", preferredStyle: UIAlertControllerStyle.alert)
            sone=0;
            stwo=0;
            onescore=0;
            twoscore=0;
            scoreone.text=("\(onescore)");
            scoretwo.text=("\(twoscore)");
            one.text=("\(sone)");
            two.text=("\(stwo)");
            let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.destructive) { (UIAlertAction) -> Void in
                print("click Sure")
            }
            let acCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) {
                (UIAlertAction) -> Void in
                print("click Cancel")
            }
            alertVC.addAction(acSure)
            alertVC.addAction(acCancel)
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    @IBAction func changeplace(_ sender: UIButton)
    {
        onescore=Int(scoreone.text!)!;
        twoscore=Int(scoretwo.text!)!;
        score=onescore;
        onescore=twoscore;
        twoscore=score;
        scoreone.text=("\(onescore)");
        scoretwo.text=("\(twoscore)");
        let  image:UIImage!
        image=bodyone.image;
        bodyone.image=bodytwo.image;
        bodytwo.image=image;
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

