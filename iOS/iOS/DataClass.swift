class DataClass {
    
    static var countryData = [
        Continents(
            continent: "Asia",
            countryNames:
             [
                 CountryNameData(countryName: "India", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "Japan", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "Hong Kong", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "Singapore", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "China", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "Vietnam", countryFlag: "indiaFlag")
             ]
        ),
        Continents(
            continent: "Europe",
            countryNames:
             [
                 CountryNameData(countryName: "Russia", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "Germany", countryFlag: "indiaFlag"),
                 CountryNameData(countryName: "United kingdom", countryFlag: "indiaFlag")
             ]
        )
    ]
    
}

class CountryNameData {

    var countryName: String
    var countryFlag: String

    init(countryName: String, countryFlag: String) {
        self.countryName = countryName
        self.countryFlag = countryFlag
    }
    
}

class Continents {
    
    var continent: String
    var countryNames: [CountryNameData]
    
    init(continent: String, countryNames: [CountryNameData]) {
        self.continent = continent
        self.countryNames = countryNames
    }
    
}
