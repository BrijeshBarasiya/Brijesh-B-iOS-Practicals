import UIKit
import MapKit

class MapClass: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var worldMap: MKMapView!
    @IBOutlet weak var isSeteliteView: UISwitch!
    
    // MARK: Variables
    var details: CountryData = DataClass.countryData[0].countryNames[0]
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        let region = MKCoordinateRegion(center: details.cordinate, span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
        worldMap.setRegion(region, animated: true)
        setPinToLocation()
    }

    // MARK: IBAction
    @IBAction func isSeteliteValueChange(_ sender: UISwitch) {
        if(sender.isOn) {
            worldMap.mapType = MKMapType.satellite
        } else {
            worldMap.mapType = MKMapType.standard
        }
    }
    
    // MARK: Other Functions
    func setPinToLocation() {
        let pin = MKPointAnnotation()
        pin.title = details.countryName
        pin.coordinate = details.cordinate
        worldMap.addAnnotation(pin)
    }
    
}
