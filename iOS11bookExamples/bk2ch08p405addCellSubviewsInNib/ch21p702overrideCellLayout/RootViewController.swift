
import UIKit

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
extension CGSize {
    init(_ width:CGFloat, _ height:CGFloat) {
        self.init(width:width, height:height)
    }
}
extension CGPoint {
    init(_ x:CGFloat, _ y:CGFloat) {
        self.init(x:x, y:y)
    }
}
extension CGVector {
    init (_ dx:CGFloat, _ dy:CGFloat) {
        self.init(dx:dx, dy:dy)
    }
}



class RootViewController : UITableViewController {
    
    let cellID = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName:"MyCell", bundle:nil), forCellReuseIdentifier: self.cellID) // *
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15)
        // self.tableView.rowHeight = 58 // *
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:self.cellID, for: indexPath) 

        // can refer to subviews by their tags
        // subview positioning configured by constraints in the nib!
        
        let lab = cell.viewWithTag(2) as! UILabel
        lab.text = "The author of this book, who would rather be out dirt biking"
        
        let iv = cell.viewWithTag(1) as! UIImageView
        // shrink apparent size of image
        let im = UIImage(named:"moi.png")!
        
        let r = UIGraphicsImageRenderer(size:CGSize(36,36))
        let im2 = r.image {
            _ in im.draw(in:CGRect(0,0,36,36))
        }
        
        iv.image = im2
        iv.contentMode = .center
        
        return cell
    }
    
    

}
