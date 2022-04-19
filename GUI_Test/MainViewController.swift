import UIKit

final class MainViewController: UIViewController {

    // MARK: - Private Outlets

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var valueSlider: UISlider!
    @IBOutlet private weak var valueTextField: UITextField!

    // MARK: - Public Properties

    private(set) var count = 0 {
        didSet {
            label.text = String(count)
            defaults.set(count, forKey: "count")
        }
    }

    // MARK: - Private Properties

    private var defaults = UserDefaults.standard

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCount()
        configureTextFieldDelegate()
        hideKeyboard()
    }

}

// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {

    private func configureTextFieldDelegate() {
        valueTextField.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let stringValue = (textField.text ?? "0") + string
        count = Int(stringValue) ?? 0
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
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

// MARK: - Private Methods

private extension MainViewController {

    func configureCount() {
        count = defaults.integer(forKey: "count")
        label.text = String(count)
    }

    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        let swipe = UISwipeGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        swipe.direction = .down

        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(swipe)
    }

}
