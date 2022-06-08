import UIKit

class Pickers: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var selectDate: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerViewValue: UILabel!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var activityIndicaor: UIActivityIndicatorView!
    
    // MARK: Variables
    let manualDatePicker = UIDatePicker()
    let dateFormetter = DateFormatter()
    
    // MARK: override Methods
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Pickers"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentView.isHidden = true
        activityIndicaor.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            self.activityIndicaor.stopAnimating()
            self.activityIndicaor.isHidden = true
            self.componentView.isHidden = false
        }
        pickerView.dataSource = self
        pickerView.delegate = self
        dateFormetter.dateStyle = DateFormatter.Style.long
        dateFormetter.timeStyle = DateFormatter.Style.short
    }

    // MARK: IBAction
    @IBAction func onSelectDateBeginEditing(_ sender: UITextField) {
        openManualDatePicker()
    }
    
    @IBAction func onDatePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate.text = dateFormetter.string(from: sender.date)
    }
    
    // MARK: Functions
    func openManualDatePicker() {
        let size = view.frame.size
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: size.width, height: 30))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.onClickCancelButton))
        let okButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.onClickOkButton))
        toolbar.setItems([cancelButton, okButton], animated: true)
        manualDatePicker.datePickerMode = .date
        manualDatePicker.minimumDate = Date()
        var dayComponent = DateComponents()
        dayComponent.day = 10
        manualDatePicker.maximumDate = Calendar.current.date(byAdding: dayComponent, to: Date())
        manualDatePicker.preferredDatePickerStyle = .wheels
        selectDate.inputView = manualDatePicker
        selectDate.inputAccessoryView = toolbar
    }
    
    // MARK: objec Functions
    @objc func onClickCancelButton() {
        selectDate.resignFirstResponder()
    }
    
    @objc func onClickOkButton() {
        selectDate.resignFirstResponder()
        guard let manualDatePicker = selectDate.inputView as? UIDatePicker else {
            return
        }
        selectDate.text = dateFormetter.string(from: manualDatePicker.date)
    }

}

// MARK: extension UIPickerViewDataSource
extension Pickers: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataClass.continentsName.count
    }
    
}

// MARK: extension UIPickerViewDelegate
extension Pickers: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewValue.text = DataClass.continentsName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataClass.continentsName[row]
    }
    
}
