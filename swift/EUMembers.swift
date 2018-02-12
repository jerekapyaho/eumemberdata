import Foundation

struct Coordinate {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
}

class City {
    var name: String
    var location: Coordinate
    
    init(name: String, location: Coordinate) {
        self.name = name
        self.location = location
    }
}

protocol Member {
    var joinedUnionDate: String { get }
    func isFounder() -> Bool
}

class Country: Member, CustomStringConvertible {
    var name: String = "unknown"
    var capital: City?
    var area: Int = 0
    var population: Int = 0

    init(name: String, capital: City?, area: Int, population: Int, joined: String) {
        self.name = name
        self.capital = capital
        self.area = area
        self.population = population
        self.joinedUnionDate = joined
    }
    
    var populationDensity: Int {
        guard area != 0 && population != 0 else {
            return 0
        }
        return population / area
    }
    
    var description: String {
        return self.name
    }

    //
    // Member protocol implementation
    //
    var joinedUnionDate: String
    
    func isFounder() -> Bool {
        return self.joinedUnionDate == "1958-01-01"
    }
}

enum Malfunction: Error {
    case powerFailure
    case initialization
    case outOfOrder
}

func backwards(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

func sortCityNames() {
    let cityNames = ["Vienna", "Brussels", "Zagreb", "Nicosia", "Prague", 
                     "Copenhagen", "Tallinn", "Helsinki", "Paris", "Berlin", 
                     "Athens", "Budapest", "Dublin", "Rome", "Riga", 
                     "Vilnius", "Luxembourg", "Valletta", "Amsterdam", "Warsaw", 
                     "Lisbon", "Bucharest", "Bratislava", "Ljubljana", "Madrid", 
                     "Stockholm", "London"]
    let sortedNames = cityNames.sorted()
    print(sortedNames)

    var rev = cityNames.sorted(by: backwards) 
    print("Passing a function: \(rev)")

    //rev = cityNames.sorted(by: { s1, s2 in return s1 > s2 })
    //rev = cityNames.sorted(by: { s1, s2 in s1 > s2 })
    //rev = cityNames.sorted(by: { $0 > $1 } )
    rev = cityNames.sorted(by: >)
    print("With a closure: \(rev)")
}

func printTimeline() {
    let finland = Country(
        name: "Finland",
        capital: City(
            name: "Helsinki",
            location: Coordinate(latitude: 60.1708, longitude: 24.9375)),
        area: 338_435,
        population: 5_503_297,
        joined: "1995-01-01")

    let sweden = Country(
        name: "Sweden",
        capital: City(
            name: "Stockholm",
            location: Coordinate(latitude: 59.3294, longitude: 18.0686)),
        area: 438_574,
        population: 9_644_864,
        joined: "1995-01-01")

    let belgium = Country(
        name: "Belgium",
        capital: City(
            name: "Brussels",
            location: Coordinate(latitude: 50.85, longitude: 4.35)),
        area: 30528,
        population: 11_203_992,
        joined: "1958-01-01")

    let austria = Country(
        name: "Austria",
        capital: City(
            name: "Vienna",
            location: Coordinate(latitude: 48.2089, longitude: 16.3725)),
        area: 83879,
        population: 8507786,
        joined: "1995-01-01")

    let czechRepublic = Country(
        name: "Czech Republic",
        capital: City(
            name: "Prague",
            location: Coordinate(latitude: 50.0833, longitude: 14.4167)),
        area: 78867,
        population: 10512419,
        joined: "2004-05-01")

    let netherlands = Country(
        name: "Netherlands",
        capital: City(
            name: "Amsterdam",
            location: Coordinate(latitude: 52.3731, longitude: 4.8922)),
        area: 41540,
        population: 16829289,
        joined: "1958-01-01")

    let bulgaria = Country(
        name: "Bulgaria",
        capital: City(
            name: "Sofia",
            location: Coordinate(latitude: 42.7, longitude: 23.3333)),
        area: 111002,
        population: 7245677,
        joined: "2007-01-01")

    let greece = Country(
        name: "Greece",
        capital: City(
            name: "Athens",
            location: Coordinate(latitude: 37.9667, longitude: 23.7167)),
        area: 131957,
        population: 10992589,
        joined: "1981-01-01")

    let cyprus = Country(
        name: "Cyprus",
        capital: City(
            name: "Nicosia",
            location: Coordinate(latitude: 35.1667, longitude: 33.3667)),
        area: 9251,
        population: 858000,
        joined: "2004-05-01")

    let denmark = Country(
        name: "Denmark",
        capital: City(
            name: "Copenhagen",
            location: Coordinate(latitude: 55.6761, longitude: 12.5683)),
        area: 42921,
        population: 5627235,
        joined: "1973-01-01")

    let estonia = Country(
        name: "Estonia",
        capital: City(
            name: "Tallinn",
            location: Coordinate(latitude: 59.4372, longitude: 24.7453)),
        area: 45227,
        population: 1315819,
        joined: "2004-01-01")

    let france = Country(
        name: "France",
        capital: City(
            name: "Paris",
            location: Coordinate(latitude: 48.8567, longitude: 2.3508)),
        area: 632833,
        population: 65856609,
        joined: "1958-01-01")

    let germany = Country(
        name: "Germany",
        capital: City(
            name: "Berlin",
            location: Coordinate(latitude: 52.5167, longitude: 13.3833)),
        area: 357340,
        population: 80780000,
        joined: "1958-01-01")

    let hungary = Country(
        name: "Hungary",
        capital: City(
            name: "Budapest",
            location: Coordinate(latitude: 47.4719, longitude: 19.0503)),
        area: 93024,
        population: 9879000,
        joined: "2004-01-01")

    let ireland = Country(
        name: "Ireland",
        capital: City(
            name: "Dublin",
            location: Coordinate(latitude: 53.3478, longitude: -6.2597)),
        area: 69797,
        population: 4604029,
        joined: "1973-01-01")

    let latvia = Country(
        name: "Latvia",
        capital: City(
            name: "Riga",
            location: Coordinate(latitude: 56.9489, longitude: 24.1064)),
        area: 64573,
        population: 2001468,
        joined: "2004-05-01")

    let lithuania = Country(
        name: "Lithuania",
        capital: City(
            name: "Vilnius",
            location: Coordinate(latitude: 54.6833, longitude: 25.2833)),
        area: 65300,
        population: 2943472,
        joined: "2004-05-01")

    let luxembourg = Country(
        name: "Luxembourg",
        capital: City(
            name: "Luxembourg",
            location: Coordinate(latitude: 49.6117, longitude: 6.13)),
        area: 2586,
        population: 549680,
        joined: "2004-05-01")

    let malta = Country(
        name: "Malta",
        capital: City(
            name: "Valletta",
            location: Coordinate(latitude: 35.8978, longitude: 14.5125)),
        area: 316,
        population: 425384,
        joined: "2004-05-01")

    let poland = Country(
        name: "Poland",
        capital: City(
            name: "Warsaw",
            location: Coordinate(latitude: 52.2333, longitude: 21.0167)),
        area: 312679,
        population: 38495659,
        joined: "2004-05-01")

    let portugal = Country(
        name: "Portugal",
        capital: City(
            name: "Lisbon",
            location: Coordinate(latitude: 38.7136, longitude: -9.1392)),
        area: 92225,
        population: 10427301,
        joined: "1986-01-01")

    let romania = Country(
        name: "Romania",
        capital: City(
            name: "Bucharest",
            location: Coordinate(latitude: 44.4325, longitude: 26.1039)),
        area: 238391,
        population: 19942642,
        joined: "2007-01-01")

    let slovakia = Country(
        name: "Slovakia",
        capital: City(
            name: "Bratislava",
            location: Coordinate(latitude: 48.1439, longitude: 17.1097)),
        area: 49035,
        population: 5415949,
        joined: "2004-05-01")

    let slovenia = Country(
        name: "Slovenia",
        capital: City(
            name: "Ljubljana",
            location: Coordinate(latitude: 46.0556, longitude: 14.5083)),
        area: 20273,
        population: 2061085,
        joined: "2004-05-01")

    let unitedKingdom = Country(
        name: "United Kingdom",
        capital: City(
            name: "London",
            location: Coordinate(latitude: 51.5072, longitude: -0.1275)),
        area: 248528,
        population: 64308261,
        joined: "1973-01-01")

    let croatia = Country(
        name: "Croatia",
        capital: City(
            name: "Zagreb",
            location: Coordinate(latitude: 45.8167, longitude: 15.9833)),
        area: 56594,
        population: 4246700,
        joined: "2013-07-01")

    let italy = Country(
        name: "Italy",
        capital: City(
            name: "Rome",
            location: Coordinate(latitude: 41.9, longitude: 12.5)),
        area: 302073,
        population: 60782668,
        joined: "1958-01-01")

    let spain = Country(
        name: "Spain",
        capital: City(
            name: "Madrid",
            location: Coordinate(latitude: 40.3833, longitude: -3.7167)),
        area: 505970,
        population: 46507760,
        joined: "1986-01-01")

    let countries = [finland, sweden, czechRepublic, belgium, austria, 
                     netherlands, bulgaria, greece, cyprus, denmark,
                     estonia, france, germany, hungary, ireland,
                     latvia, lithuania, luxembourg, malta, poland,
                     portugal, romania, slovakia, slovenia, unitedKingdom,
                     croatia, italy, spain]

    var joinsByDate = Dictionary<String, [String]>()
    for country in countries {
        //print("\(country.joinedUnionDate) \(country.name!)")
        if joinsByDate[country.joinedUnionDate] != nil {
            joinsByDate[country.joinedUnionDate]!.append(country.name)
        }
        else {
            joinsByDate[country.joinedUnionDate] = [country.name]
        }
    }

    print("Timeline:")
    let joinDates = Array(joinsByDate.keys).sorted()
    for date in joinDates {
        let joinedCountries = joinsByDate[date]!.sorted()
        var countryPart = ""
        switch joinedCountries.count {
        case 0:
            countryPart = "***ERROR***"
        case 1:
            countryPart = joinedCountries[0]
        case 2:
            countryPart = joinedCountries.joined(separator: " and ")
        default:
            let lastIndex = joinedCountries.count - 1
            countryPart += joinedCountries[..<lastIndex].joined(separator: ", ")
            countryPart += " and " + joinedCountries.last!
        }

        print("\(date): \(countryPart) joined the EU")
    }

/*
    print("\nTotal number of countries: \(countries.count)")

    let totalPopulation = countries.map({$0.population}).reduce(0, +)
    print("Total population: \(totalPopulation)")

    print("Finland, pop = \(finland.population)")
*/
}

func greeting1(name: String? = nil) -> String {
    guard let whoToGreet = name else {
        return "Hello, stranger!"
    }
    return "Hello, \(whoToGreet)!"
}

func greeting2(name: String? = nil) -> String {
    var text = "Hello, stranger!"
    if let whoToGreet = name {
        text = "Hello, \(whoToGreet)!"
    }
    return text
}

func main() {
    printTimeline()

/*
    print(greeting1())
    print(greeting1(name: "world"))

    print(greeting2())
    print(greeting2(name: "world"))
*/

    //sortCityNames()
}

main()
exit(EXIT_SUCCESS)
