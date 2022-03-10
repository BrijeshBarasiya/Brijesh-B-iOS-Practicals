import UIKit

class AddCountryDetails: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var selectContinent: UIPickerView!
    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    // MARK: Variables
    weak var delegates: UpdateRawData?
    var continentIndex = 0
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        selectContinent.dataSource = self
        selectContinent.delegate = self
    }
    
    // MARK: Functions
    func showError(sender: AnyObject) {
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.red.cgColor
    }
    
    func closeScreen() {
        delegates?.updateData(updated: DataClass.countryData)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: IBAction
    @IBAction func onSubmitClicked(_ sender: UIButton) {
        if countryName.text == "" {
            showError(sender: countryName)
        }
        if imageName.text == "" {
            showError(sender: imageName)
        }
        if latitude.text == "" {
            showError(sender: latitude)
        }
        if longitude.text == "" {
            showError(sender: longitude)
        } else {
            let newData = CountryData(countryName: countryName.text ?? "India",
                                      countryFlag: imageName.text ?? "indiaFlag",
                                      latitude: Double(latitude.text ?? "22") ?? 22,
                                      longitude: Double(longitude.text ?? "78") ?? 78)
            for index in 0..<DataClass.countryData.count {
                if DataClass.countryData[index].continent == DataClass.continentsName[continentIndex] {
                    DataClass.countryData[index].countryNames.append(newData)
                    closeScreen()
                    return
                }
            }
            let newContinent = Continents(continent: DataClass.continentsName[continentIndex], countryNames: [newData])
            DataClass.countryData.append(newContinent)
            closeScreen()
        }
    }
    
    @IBAction func onCancelClicked(_ sender: UIButton) {
        closeScreen()
    }
    
}

// MARK: extension UIPickerViewDataSource
extension AddCountryDetails: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataClass.continentsName.count
    }
    
}

// MARK: extension UIPickerViewDelegate
extension AddCountryDetails: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        continentIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataClass.continentsName[row].uppercased()
    }
    
}
