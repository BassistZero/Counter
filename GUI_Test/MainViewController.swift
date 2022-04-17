import UIKit

final class MainViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var valueSlider: UISlider!

    // MARK: - Public Properties

    private(set) var count = 0 {
        didSet {
            label.text = String(count)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = String(count)
    }

}

// MARK: - Private Actions

private extension MainViewController {

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

}