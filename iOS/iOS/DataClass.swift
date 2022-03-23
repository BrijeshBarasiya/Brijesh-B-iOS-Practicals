import CoreLocation

class DataClass {
    
    static var countryData = [
        Continents(
            continent: "Asia",
            countryNames: [
                CountryData(
                    countryName: "India",
                    countryFlag: "indiaFlag",
                    latitude: 28.6139,
                    longitude: 77.2090
                ),
                CountryData(
                    countryName: "Japan",
                    countryFlag: "indiaFlag",
                    latitude: 35.6762,
                    longitude: 139.6503
                ),
                CountryData(
                    countryName: "Singapore",
                    countryFlag: "indiaFlag",
                    latitude: 1.290270,
                    longitude: 103.851959
                ),
                CountryData(
                    countryName: "China",
                    countryFlag: "indiaFlag",
                    latitude: 39.9042,
                    longitude: 116.4074
                )
             ]
        ),
        Continents(
            continent: "Europe",
            countryNames: [
                CountryData(
                    countryName: "Russia",
                    countryFlag: "indiaFlag",
                    latitude: 55.7558,
                    longitude: 37.6173
                ),
                CountryData(
                    countryName: "Italy",
                    countryFlag: "indiaFlag",
                    latitude: 41.9028,
                    longitude: 12.4964
                ),
                CountryData(
                    countryName: "Poland",
                    countryFlag: "indiaFlag",
                    latitude: 52.2297,
                    longitude: 21.0122
                )
             ]
        )
    ]
    
    static var countryNames = ["India", "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Argentina", "Australia", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize"]
    
}

struct CountryData {

    var countryName: String
    var countryFlag: String
    var cordinate: CLLocationCoordinate2D

    init(countryName: String,
         countryFlag: String,
         latitude: Double,
         longitude: Double) {
        self.countryName = countryName
        self.countryFlag = countryFlag
        self.cordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

struct Continents {
    
    var continent: String
    var countryNames: [CountryData]
    
    init(continent: String, countryNames: [CountryData]) {
        self.continent = continent
        self.countryNames = countryNames
    }
    
}
