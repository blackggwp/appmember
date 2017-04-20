//
//  FirstViewController.swift
//  appmember
//
//  Created by sukishiMAC on 3/28/2560 BE.
//  Copyright © 2560 sukishiMAC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Variable
    var data: [AnyObject] = []
    
    @IBOutlet weak var tableview: UITableView!
    //@IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

       loadjson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click_hello(_ sender: Any) {
         showalert(msg: "click me")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.data.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let c = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //cell.txtPromotion.text = data[indexPath.row]
        //cell.imgPromotion.image = UIImage(named:"1.jpg")
        //return cell
        
        let row  = self.data[indexPath.row]
        
        var url = URL(string:  row["img"] as! String)
        if url == nil {
            //show img not found
            url = URL(string: "https://learn.getgrav.org/user/pages/11.troubleshooting/01.page-not-found/error-404.png")
        }
        var data = try? Data(contentsOf: url!)
        
        c.imgPromotion.image = UIImage(data: data!)
        c.txtPromotion.text = row["txt"] as! String
        
        // Configure the cell...
        
        return c

    }
    
    func showalert(msg:String){
    
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    }
    
    func  loadjson(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            //self.data = self.getjson("http://223.27.210.251/getpro2.php")
            self.data = self.getjson("http://client1.dev/getpromotion.php")
            
            self.tableview.reloadData()
            
            //self.showdilog(String(describing: self.data))
            
        })
        
        
    }
    func strurl(_ s:String)->URL {
        
        
        
        let surl : NSString = s.addingPercentEscapes(using: String.Encoding.utf8)! as NSString
        let url : URL = URL(string: surl as String)!
        return url
    }
    func getjson(_ urlcall:String)->[AnyObject] {
        
        
        var url:URL=strurl(urlcall)
        var data:[AnyObject] = []
        //let allContactsData=NSData(contentsOfURL:NSURL(string:g.share.urlq)!)
        let allContactsData=try? Data(contentsOf: url)
        do {
            if let json = try JSONSerialization.jsonObject(with: allContactsData!, options: []) as? AnyObject {
                
                
                // showdilog(String(describing: json))
                
                
                if let json = json["d"] as? Array<AnyObject> {
                    for index in 0...json.count-1 {
                        data.append(json[index])
                    }
                }
            }
            
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return data
        
    }


}

