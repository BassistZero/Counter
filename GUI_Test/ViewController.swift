import UIKit

class ViewController: UIViewController {

    var count = 0 {
        didSet {
            label.text = String(count)
        }
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var valueSlider: UISlider!

    @IBAction func add(_ sender: UIButton) {
        count += 1
    }

    @IBAction func decrease(_ sender: UIButton) {
        count -= 1
    }

    @IBAction func reset(_ sender: UIButton) {
        count = 0
    }
    
    @IBAction func getValue(_ sender: UISlider) {
        count = Int(valueSlider.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = String(count)
    }

}
