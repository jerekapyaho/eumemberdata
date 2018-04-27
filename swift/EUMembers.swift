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

let officialLanguages = [
    "bg", "cs", "da", "de", "el", "en", "es", "et", "fi", "fr", "ga", "hr", "hu", 
    "it", "lt", "lv", "mt", "nl", "pl", "pt", "ro", "sk", "sl", "sv"
]

let cityNames: [String: [String: String]] = [
    "amsterdam": [
        "bg": "Амстердам",
        "cs": "Amsterdam",
        "da": "Amsterdam",
        "de": "Amsterdam",
        "el": "Άμστερνταμ",
        "en": "Amsterdam",
        "es": "Ámsterdam",
        "et": "Amsterdam",
        "fi": "Amsterdam",
        "fr": "Amsterdam",
        "ga": "Amstardam",
        "hr": "Amsterdam",
        "hu": "Amszterdam",
        "it": "Amsterdam",
        "lt": "Amsterdamas",
        "lv": "Amsterdama",
        "mt": "Amsterdam",
        "nl": "Amsterdam",
        "pl": "Amsterdam",
        "pt": "Amesterdão",
        "ro": "Amsterdam",
        "sk": "Amsterdam",
        "sl": "Amsterdam",
        "sv": "Amsterdam"
    ],
    
    "brussels": [
        "bg": "Брюксел",
        "cs": "Brusel",
        "da": "Bruxelles",
        "de": "Brüssel",
        "el": "Βρυξέλλες",
        "en": "Brussels",
        "es": "Bruselas",
        "et": "Brüssel",
        "fi": "Brysseli",
        "fr": "Bruxelles",
        "ga": "an Bhruiséil",
        "hr": "Bruxelles",
        "hu": "Brüsszel",
        "it": "Bruxelles",
        "lt": "Briuselis",
        "lv": "Brisele",
        "mt": "Brussell",
        "nl": "Brussel",
        "pl": "Bruksela",
        "pt": "Bruxelas",
        "ro": "Bruxelles",
        "sk": "Brusel",
        "sl": "Bruselj",
        "sv": "Bryssel"
    ],
    
    "vienna": [
        "bg": "Виена",
        "cs": "Vídeň",
        "da": "Wien",
        "de": "Wien",
        "el": "Βιέννη",
        "en": "Vienna",
        "es": "Viena",
        "et": "Viin",
        "fi": "Wien",
        "fr": "Vienne",
        "ga": "Vín",
        "hr": "Beč",
        "hu": "Bécs",
        "it": "Vienna",
        "lt": "Viena",
        "lv": "Vīne",
        "mt": "Vjenna",
        "nl": "Wenen",
        "pl": "Wiedeń",
        "pt": "Viena",
        "ro": "Viena",
        "sk": "Viedeň",
        "sl": "Dunaj",
        "sv": "Wien"
    ],
    

    "zagreb": [
        "bg": "Загреб",
        "cs": "Záhřeb",
        "da": "Zagreb",
        "de": "Zagreb",
        "el": "Ζάγκρεμπ",
        "en": "Zagreb",
        "es": "Zagreb",
        "et": "Zagreb",
        "fi": "Zagreb",
        "fr": "Zagreb",
        "ga": "Ságrab",
        "hr": "Zagreb",
        "hu": "Zágráb",
        "it": "Zagabria",
        "lt": "Zagrebas",
        "lv": "Zagreba",
        "mt": "Żagreb",
        "nl": "Zagreb",
        "pl": "Zagrzeb",
        "pt": "Zagrebe",
        "ro": "Zagreb",
        "sk": "Záhreb",
        "sl": "Zagreb",
        "sv": "Zagreb"
    ],
    
    "nicosia": [
        "bg": "Никозия",
        "cs": "Nikósie",
        "da": "Nicosia",
        "de": "Nikosia",
        "el": "Λευκωσία",
        "en": "Nicosia",
        "es": "Nicosia",
        "et": "Nikosia",
        "fi": "Nikosia",
        "fr": "Nicosie",
        "ga": "an Niocóis",
        "hr": "Nikozija",
        "hu": "Nicosia",
        "it": "Nicosia",
        "lt": "Nikosija",
        "lv": "Nikozija",
        "mt": "Nikosija",
        "nl": "Nicosia",
        "pl": "Nikozja",
        "pt": "Nicósia",
        "ro": "Nicosia",
        "sk": "Nikózia",
        "sl": "Nikozija",
        "sv": "Nicosia"
    ],
    
    "prague": [
        "bg": "Прага",
        "cs": "Praha",
        "da": "Prag",
        "de": "Prag",
        "el": "Πράγα",
        "en": "Prague",
        "es": "Praga",
        "et": "Praha",
        "fi": "Praha",
        "fr": "Prague",
        "ga": "Prág",
        "hr": "Prag",
        "hu": "Prága",
        "it": "Praga",
        "lt": "Praha",
        "lv": "Prāga",
        "mt": "Praga",
        "nl": "Praag",
        "pl": "Praga",
        "pt": "Praga",
        "ro": "Praga",
        "sk": "Praha",
        "sl": "Praga",
        "sv": "Prag"
    ],
    
    "copenhagen": [
        "bg": "Копенхаген",
        "cs": "Kodaň",
        "da": "København",
        "de": "Kopenhagen",
        "el": "Κοπεγχάγη",
        "en": "Copenhagen",
        "es": "Copenhague",
        "et": "Kopenhaagen",
        "fi": "Kööpenhamina",
        "fr": "Copenhague",
        "ga": "Cóbanhávan",
        "hr": "Kopenhagen",
        "hu": "Koppenhága",
        "it": "Copenaghen",
        "lt": "Kopenhaga",
        "lv": "Kopenhāgena",
        "mt": "Kopenħagen",
        "nl": "Kopenhagen",
        "pl": "Kopenhaga",
        "pt": "Copenhaga",
        "ro": "Copenhaga",
        "sk": "Kodaň",
        "sl": "København",
        "sv": "Köpenhamn"
    ],
    
    "tallinn": [
        "bg": "Талин",
        "cs": "Tallinn",
        "da": "Tallinn",
        "de": "Tallinn",
        "el": "Ταλίν",
        "en": "Tallinn",
        "es": "Tallin",
        "et": "Tallinn",
        "fr": "Tallinn",
        "fi": "Tallinna",
        "ga": "Taillinn",
        "hr": "Tallinn",
        "hu": "Tallinn",
        "it": "Tallinn",
        "lt": "Talinas",
        "lv": "Tallina",
        "mt": "Talinn",
        "nl": "Tallinn",
        "pl": "Tallin",
        "pt": "Taline",
        "ro": "Tallinn",
        "sk": "Tallinn",
        "sl": "Talin",
        "sv": "Tallinn"
    ],
    
    "helsinki": [
        "bg": "Хелзинки",
        "cs": "Helsinky",
        "da": "Helsinki",
        "de": "Helsinki",
        "el": "Ελσίνκι",
        "en": "Helsinki",
        "es": "Helsinki",
        "et": "Helsingi",
        "fi": "Helsinki",
        "fr": "Helsinki",
        "ga": "Heilsincí",
        "hr": "Helsinki",
        "hu": "Helsinki",
        "it": "Helsinki",
        "lt": "Helsinkis",
        "lv": "Helsinki",
        "mt": "Ħelsinki",
        "nl": "Helsinki",
        "pl": "Helsinki",
        "pt": "Helsínquia",
        "ro": "Helsinki",
        "sk": "Helsinki",
        "sl": "Helsinki",
        "sv": "Helsingfors"
    ],
    
    "paris": [
        "bg": "Париж",
        "cs": "Paříž",
        "da": "Paris",
        "de": "Paris",
        "el": "Παρίσι",
        "en": "Paris",
        "es": "París",
        "et": "Pariis",
        "fi": "Pariisi",
        "fr": "Paris",
        "ga": "Páras",
        "hr": "Pariz",
        "hu": "Párizs",
        "it": "Parigi",
        "lt": "Paryžius",
        "lv": "Parīze",
        "mt": "Pariġi",
        "nl": "Parijs",
        "pl": "Paryż",
        "pt": "Paris",
        "ro": "Paris",
        "sk": "Paríž",
        "sl": "Pariz",
        "sv": "Paris"
    ],
    
    "berlin": [
        "bg": "Берлин",
        "cs": "Berlin",
        "da": "Berlin",
        "de": "Berlin",
        "el": "Βερολίνο",
        "en": "Berlin",
        "es": "Berlín",
        "et": "Berliin",
        "fi": "Berliini",
        "fr": "Berlin",
        "ga": "Beirlín",
        "hr": "Berlin",
        "hu": "Berlin",
        "it": "Berlino",
        "lt": "Berlynas",
        "lv": "Berlīne",
        "mt": "Berlin",
        "nl": "Berlijn",
        "pl": "Berlin",
        "pt": "Berlim",
        "ro": "Berlin",
        "sk": "Berlín",
        "sl": "Berlin",
        "sv": "Berlin"
    ],
    
    "athens": [
        "bg": "Атина",
        "cs": "Atény",
        "da": "Athen",
        "de": "Athen",
        "el": "Αθήνα",
        "en": "Athens",
        "es": "Atenas",
        "et": "Ateena",
        "fi": "Ateena",
        "fr": "Athènes",
        "ga": "An Aithin",
        "hr": "Atena",
        "hu": "Athén",
        "it": "Atene",
        "lt": "Atėnai",
        "lv": "Atēnas",
        "mt": "Ateni",
        "nl": "Athene",
        "pl": "Ateny",
        "pt": "Atenas",
        "ro": "Atena",
        "sk": "Atény",
        "sl": "Atene",
        "sv": "Aten"
    ],
    
    "budapest": [
        "bg": "Будапеща",
        "cs": "Budapešť",
        "da": "Budapest",
        "de": "Budapest",
        "el": "Βουδαπέστη",
        "en": "Budapest",
        "es": "Budapest",
        "et": "Budapest",
        "fi": "Budapest",
        "fr": "Budapest",
        "ga": "Búdaipeist",
        "hr": "Budimpešta",
        "hu": "Budapest",
        "it": "Budapest",
        "lt": "Budapeštas",
        "lv": "Budapešta",
        "mt": "Budapest",
        "nl": "Boedapest",
        "pl": "Budapeszt",
        "pt": "Budapeste",
        "ro": "Budapesta",
        "sk": "Budapešť",
        "sl": "Budimpešta",
        "sv": "Budapest"
    ],
    
    "dublin": [
        "bg": "Дъблин",
        "cs": "Dublin",
        "da": "Dublin",
        "de": "Dublin",
        "el": "Δουβλίνο",
        "en": "Dublin",
        "es": "Dublín",
        "et": "Dublin",
        "fi": "Dublin",
        "fr": "Dublin",
        "ga": "Baile Átha Cliath",
        "hr": "Dublin",
        "hu": "Dublin",
        "it": "Dublino",
        "lt": "Dublinas",
        "lv": "Dublina",
        "mt": "Dublin",
        "nl": "Dublin",
        "pl": "Dublin",
        "pt": "Dublin",
        "ro": "Dublin",
        "sk": "Dublin",
        "sl": "Dublin",
        "sv": "Dublin"
    ],
    
    "rome": [
        "bg": "Рим",
        "cs": "Řím",
        "da": "Rom",
        "de": "Rom",
        "el": "Ρώμη",
        "en": "Rome",
        "es": "Roma",
        "et": "Rooma",
        "fi": "Rooma",
        "fr": "Rome",
        "ga": "an Róimh",
        "hr": "Rim",
        "hu": "Róma",
        "it": "Roma",
        "lt": "Roma",
        "lv": "Roma",
        "mt": "Ruma",
        "nl": "Rome",
        "pl": "Rzym",
        "pt": "Roma",
        "ro": "Roma",
        "sk": "Rím",
        "sl": "Rim",
        "sv": "Rom"
    ],
    
    "riga": [
        "bg": "Рига",
        "cs": "Riga",
        "da": "Riga",
        "de": "Riga",
        "el": "Ρίγα",
        "en": "Riga",
        "es": "Riga",
        "et": "Riia",
        "fi": "Riika",
        "fr": "Riga",
        "ga": "Ríge",
        "hr": "Riga",
        "hu": "Riga",
        "it": "Riga",
        "lt": "Ryga",
        "lv": "Rīga",
        "mt": "Riga",
        "nl": "Riga",
        "pl": "Ryga",
        "pt": "Riga",
        "ro": "Riga",
        "sk": "Riga",
        "sl": "Riga",
        "sv": "Riga"
    ],
    
    "vilnius": [
        "bg": "Вилнюс",
        "cs": "Vilnius",
        "da": "Vilnius",
        "de": "Wilna (Vilnius)",
        "el": "Βίλνιους",
        "en": "Vilnius",
        "es": "Vilna",
        "et": "Vilnius",
        "fi": "Vilna",
        "fr": "Vilnius",
        "ga": "Vilnias",
        "hr": "Vilnius",
        "hu": "Vilnius",
        "it": "Vilnius",
        "lt": "Vilnius",
        "lv": "Viļņa",
        "mt": "Vilnjus",
        "nl": "Vilnius",
        "pl": "Wilno",
        "pt": "Vilnius",
        "ro": "Vilnius",
        "sk": "Vilnius",
        "sl": "Vilna",
        "sv": "Vilnius"
    ],
    
    "valletta": [
        "bg": "Валета",
        "cs": "Valetta",
        "da": "Valletta",
        "de": "Valletta",
        "el": "Βαλέτα",
        "en": "Valletta",
        "es": "La Valeta",
        "et": "Valletta",
        "fi": "Valletta",
        "fr": "La Valette",
        "ga": "Vaileite",
        "hr": "Valletta",
        "hu": "Valletta",
        "it": "La Valletta",
        "lt": "Valeta",
        "lv": "Valeta",
        "mt": "Valletta",
        "nl": "Valletta",
        "pl": "Valletta",
        "pt": "Valeta",
        "ro": "Valletta",
        "sk": "Valletta",
        "sl": "Valletta",
        "sv": "Valletta"
    ],
    
    "warsaw": [
        "bg": "Варшава",
        "cs": "Varšava",
        "da": "Warszawa",
        "de": "Warschau",
        "el": "Βαρσοβία",
        "en": "Warsaw",
        "es": "Varsovia",
        "et": "Varssavi",
        "fi": "Varsova",
        "fr": "Varsovie",
        "ga": "Vársá",
        "hr": "Varšava",
        "hu": "Varsó",
        "it": "Varsavia",
        "lt": "Varšuva",
        "lv": "Varšava",
        "mt": "Varsavja",
        "nl": "Warschau",
        "pl": "Warszawa",
        "pt": "Varsóvia",
        "ro": "Varșovia",
        "sk": "Varšava",
        "sl": "Varšava",
        "sv": "Warszawa"
    ],
    
    "lisbon": [
        "bg": "Лисабон",
        "cs": "Lisabon",
        "da": "Lissabon",
        "de": "Lissabon",
        "el": "Λισαβόνα",
        "en": "Lisbon",
        "es": "Lisboa",
        "et": "Lissabon",
        "fi": "Lissabon",
        "fr": "Lisbonne",
        "ga": "Liospóin",
        "hr": "Lisabon",
        "hu": "Lisszabon",
        "it": "Lisbona",
        "lt": "Lisabona",
        "lv": "Lisabona",
        "mt": "Lisbona",
        "nl": "Lissabon",
        "pl": "Lizbona",
        "pt": "Lisboa",
        "ro": "Lisabona",
        "sk": "Lisabon",
        "sl": "Lizbona",
        "sv": "Lissabon"
    ],
    
    "ljubljana": [
        "bg": "Любляна",
        "cs": "Lublaň",
        "da": "Ljubljana",
        "de": "Ljubljana",
        "el": "Λιουμπλιάνα",
        "en": "Ljubljana",
        "es": "Liubliana",
        "et": "Ljubljana",
        "fi": "Ljubljana",
        "fr": "Ljubljana",
        "ga": "Liúibleána",
        "hr": "Ljubljana",
        "hu": "Ljubljana",
        "it": "Lubiana",
        "lt": "Liubliana",
        "lv": "Ļubļana",
        "mt": "Ljubljana",
        "nl": "Ljubljana",
        "pl": "Lublana",
        "pt": "Liubliana",
        "ro": "Ljubljana",
        "sk": "Ljubljana",
        "sl": "Ljubljana",
        "sv": "Ľubľana"
    ],

    "luxembourg": [
        "bg": "Люксембург",
        "cs": "Lucemburk",
        "da": "Luxembourg",
        "de": "Luxemburg",
        "el": "Λουξεμβούργο",
        "en": "Luxembourg",
        "es": "Luxemburgo",
        "et": "Luxembourg",
        "fi": "Luxemburg",
        "fr": "Luxembourg",
        "ga": "Lucsamburg",
        "hr": "Luxembourg",
        "hu": "Luxembourg",
        "it": "Lussemburgo",
        "lt": "Liuksemburgas",
        "lv": "Luksemburga",
        "mt": "Il-Lussemburgu",
        "nl": "Luxemburg",
        "pl": "Luksemburg",
        "pt": "Luxemburgo",
        "ro": "Luxemburg",
        "sk": "Luxemburg",
        "sl": "Luxembourg",
        "sv": "Luxemburg"
    ],
        
    "bucharest": [
        "bg": "Букурещ",
        "cs": "Bukurešť",
        "da": "Bukarest",
        "de": "Bukarest",
        "el": "Βουκουρέστι",
        "en": "Bucharest",
        "es": "Bucarest",
        "et": "Bukarest",
        "fi": "Bukarest",
        "fr": "Bucarest",
        "ga": "Búcairist",
        "hr": "Bukurešt",
        "hu": "Bukarest",
        "it": "Bucharest",
        "lt": "Bukareštas",
        "lv": "Bukareste",
        "mt": "Bukarest",
        "nl": "Boekarest",
        "pl": "Bukareszt",
        "pt": "Bucareste",
        "ro": "București",
        "sk": "Bukurešť",
        "sl": "Bukarešta",
        "sv": "Bukarest"
    ],
    
    "bratislava": [
        "bg": "Братислава",
        "cs": "Bratislava",
        "da": "Bratislava",
        "de": "Bratislava",
        "el": "Μπρατισλάβα",
        "en": "Bratislava",
        "es": "Bratislava",
        "et": "Bratislava",
        "fi": "Bratislava",
        "fr": "Bratislava",
        "ga": "an Bhratasláiv",
        "hr": "Bratislava",
        "hu": "Pozsony",
        "it": "Bratislava",
        "lt": "Bratislava",
        "lv": "Bratislava",
        "mt": "Bratislava",
        "nl": "Bratislava",
        "pl": "Bratysława",
        "pt": "Bratislava",
        "ro": "Bratislava",
        "sk": "Bratislava",
        "sl": "Bratislava",
        "sv": "Bratislava"
    ],
    
    "madrid": [
        "bg": "Мадрид",
        "cs": "Madrid",
        "da": "Madrid",
        "de": "Madrid",
        "el": "Μαδρίτη",
        "en": "Madrid",
        "es": "Madrid",
        "et": "Madrid",
        "fi": "Madrid",
        "fr": "Madrid",
        "ga": "Maidrid",
        "hr": "Madrid",
        "hu": "Madrid",
        "it": "Madrid",
        "lt": "Madridas",
        "lv": "Madride",
        "mt": "Madrid",
        "nl": "Madrid",
        "pl": "Madryt",
        "pt": "Madrid",
        "ro": "Madrid",
        "sk": "Madrid",
        "sl": "Madrid",
        "sv": "Madrid"
    ],
    
    "stockholm": [
        "bg": "Стокхолм",
        "cs": "Stockholm",
        "da": "Stockholm",
        "de": "Stockholm",
        "el": "Στοκχόλμη",
        "en": "Stockholm",
        "es": "Estocolmo",
        "et": "Stockholm",
        "fi": "Tukholma",
        "fr": "Stockholm",
        "ga": "Stócólm",
        "hr": "Stockholm",
        "hu": "Stockholm",
        "it": "Stoccolma",
        "lt": "Stokholmas",
        "lv": "Stokholma",
        "mt": "Stokkolma",
        "nl": "Stockholm",
        "pl": "Sztokholm",
        "pt": "Estocolmo",
        "ro": "Stockholm",
        "sk": "Štokholm",
        "sl": "Stockholm",
        "sv": "Stockholm"
    ],
    
    "london": [
        "bg": "Лондон",
        "cs": "Londýn",
        "da": "London",
        "de": "London",
        "el": "Λονδίνο",
        "en": "London",
        "es": "Londres",
        "et": "London",
        "fi": "Lontoo",
        "fr": "Londres",
        "ga": "Londain",
        "hr": "London",
        "hu": "London",
        "it": "Londra",
        "lt": "Londonas",
        "lv": "Londona",
        "mt": "Londra",
        "nl": "Londen",
        "pl": "Londyn",
        "pt": "Londres",
        "ro": "Londra",
        "sk": "Londýn",
        "sl": "London",
        "sv": "London"
    ],
    
    "sofia": [
        "bg": "София",
        "cs": "Sofie",
        "da": "Sofia",
        "de": "Sofia",
        "el": "Σόφια",
        "en": "Sofia",
        "es": "Sofía",
        "et": "Sofia",
        "fi": "Sofia",
        "fr": "Sofia",
        "ga": "Sóifia",
        "hr": "Sofija",
        "hu": "Szófia",
        "it": "Sofia",
        "lt": "Sofija",
        "lv": "Sofija",
        "mt": "Sofia",
        "nl": "Sofia",
        "pl": "Sofia",
        "pt": "Sófia",
        "ro": "Sofia",
        "sk": "Sofia",
        "sl": "Sofija",
        "sv": "Sofia"
    ]
]

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

func printCityNames() {
    var nameCount = 0
    let cities = [
        "amsterdam", "athens", "berlin", "bratislava", "brussels", "bucharest", 
        "budapest",  "copenhagen", "dublin", "helsinki", "lisbon", "ljubljana", 
        "london", "luxembourg", "madrid", "nicosia", "paris", "prague", "riga", 
        "rome", "sofia", "stockholm", "tallinn", "valletta", "vienna", "vilnius", 
        "warsaw", "zagreb"
    ]
    for city in cities {
        print("\(city): ")
        let names = cityNames[city]!
        //assert(names.count == officialLanguages.count)
        print("\(names.count) -- \(officialLanguages.count)")
        for lang in officialLanguages {
            let name = names[lang]!
            print(name)
            nameCount += 1
        }
    }

    print("Total name count = \(nameCount)")

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

    printCityNames()
}

main()
exit(EXIT_SUCCESS)
