data class Coordinate(val latitude: Double, val longitude: Double)

class City constructor(name: String, location: Coordinate) { }

interface Member {
    val joinedUnionDate: String   // abstract property
    fun isFounder(): Boolean
}

class Country(val name: String, val capital: City?, val area: Long = 0L, val population: Long = 0L, joined: String): Member {
    override val joinedUnionDate: String

    override fun isFounder(): Boolean {
        return joinedUnionDate == "1958-01-01"
    }

    init {
        joinedUnionDate = joined
    }

    val populationDensity get() = if (area != 0L && population != 0L) population / area else 0L

    override fun toString(): String {
        return this.name
    }

}

val cityNames = mapOf(
    "amsterdam" to mapOf(
        "bg" to "Амстердам",
        "cs" to "Amsterdam",
        "da" to "Amsterdam",
        "de" to "Amsterdam",
        "el" to "Άμστερνταμ",
        "en" to "Amsterdam",
        "es" to "Ámsterdam",
        "et" to "Amsterdam",
        "fi" to "Amsterdam",
        "fr" to "Amsterdam",
        "ga" to "Amstardam",
        "hr" to "Amsterdam",
        "hu" to "Amszterdam",
        "it" to "Amsterdam",
        "lt" to "Amsterdamas",
        "lv" to "Amsterdama",
        "mt" to "Amsterdam",
        "nl" to "Amsterdam",
        "pl" to "Amsterdam",
        "pt" to "Amesterdão",
        "ro" to "Amsterdam",
        "sk" to "Amsterdam",
        "sl" to "Amsterdam",
        "sv" to "Amsterdam"
    ),

    "athens" to mapOf(
        "bg" to "Атина",
        "cs" to "Atény",
        "da" to "Athen",
        "de" to "Athen",
        "el" to "Αθήνα",
        "en" to "Athens",
        "es" to "Atenas",
        "et" to "Ateena",
        "fi" to "Ateena",
        "fr" to "Athènes",
        "ga" to "An Aithin",
        "hr" to "Atena",
        "hu" to "Athén",
        "it" to "Atene",
        "lt" to "Atėnai",
        "lv" to "Atēnas",
        "mt" to "Ateni",
        "nl" to "Athene",
        "pl" to "Ateny",
        "pt" to "Atenas",
        "ro" to "Atena",
        "sk" to "Atény",
        "sl" to "Atene",
        "sv" to "Aten"
    ),

    "berlin" to mapOf(
        "bg" to "Берлин",
        "cs" to "Berlin",
        "da" to "Berlin",
        "de" to "Berlin",
        "el" to "Βερολίνο",
        "en" to "Berlin",
        "es" to "Berlín",
        "et" to "Berliin",
        "fi" to "Berliini",
        "fr" to "Berlin",
        "ga" to "Beirlín",
        "hr" to "Berlin",
        "hu" to "Berlin",
        "it" to "Berlino",
        "lt" to "Berlynas",
        "lv" to "Berlīne",
        "mt" to "Berlin",
        "nl" to "Berlijn",
        "pl" to "Berlin",
        "pt" to "Berlim",
        "ro" to "Berlin",
        "sk" to "Berlín",
        "sl" to "Berlin",
        "sv" to "Berlin"
    ),

    "bratislava" to mapOf(
        "bg" to "Братислава",
        "cs" to "Bratislava",
        "da" to "Bratislava",
        "de" to "Bratislava",
        "el" to "Μπρατισλάβα",
        "en" to "Bratislava",
        "es" to "Bratislava",
        "et" to "Bratislava",
        "fi" to "Bratislava",
        "fr" to "Bratislava",
        "ga" to "an Bhratasláiv",
        "hr" to "Bratislava",
        "hu" to "Pozsony",
        "it" to "Bratislava",
        "lt" to "Bratislava",
        "lv" to "Bratislava",
        "mt" to "Bratislava",
        "nl" to "Bratislava",
        "pl" to "Bratysława",
        "pt" to "Bratislava",
        "ro" to "Bratislava",
        "sk" to "Bratislava",
        "sl" to "Bratislava",
        "sv" to "Bratislava"
    ),

    "brussels" to mapOf(
        "bg" to "Брюксел",
        "cs" to "Brusel",
        "da" to "Bruxelles",
        "de" to "Brüssel",
        "el" to "Βρυξέλλες",
        "en" to "Brussels",
        "es" to "Bruselas",
        "et" to "Brüssel",
        "fi" to "Brysseli",
        "fr" to "Bruxelles",
        "ga" to "an Bhruiséil",
        "hr" to "Bruxelles",
        "hu" to "Brüsszel",
        "it" to "Bruxelles",
        "lt" to "Briuselis",
        "lv" to "Brisele",
        "mt" to "Brussell",
        "nl" to "Brussel",
        "pl" to "Bruksela",
        "pt" to "Bruxelas",
        "ro" to "Bruxelles",
        "sk" to "Brusel",
        "sl" to "Bruselj",
        "sv" to "Bryssel"
    ),

    "bucharest" to mapOf(
        "bg" to "Букурещ",
        "cs" to "Bukurešť",
        "da" to "Bukarest",
        "de" to "Bukarest",
        "el" to "Βουκουρέστι",
        "en" to "Bucharest",
        "es" to "Bucarest",
        "et" to "Bukarest",
        "fi" to "Bukarest",
        "fr" to "Bucarest",
        "ga" to "Búcairist",
        "hr" to "Bukurešt",
        "hu" to "Bukarest",
        "it" to "Bucharest",
        "lt" to "Bukareštas",
        "lv" to "Bukareste",
        "mt" to "Bukarest",
        "nl" to "Boekarest",
        "pl" to "Bukareszt",
        "pt" to "Bucareste",
        "ro" to "București",
        "sk" to "Bukurešť",
        "sl" to "Bukarešta",
        "sv" to "Bukarest"
    ),

    "budapest" to mapOf(
        "bg" to "Будапеща",
        "cs" to "Budapešť",
        "da" to "Budapest",
        "de" to "Budapest",
        "el" to "Βουδαπέστη",
        "en" to "Budapest",
        "es" to "Budapest",
        "et" to "Budapest",
        "fi" to "Budapest",
        "fr" to "Budapest",
        "ga" to "Búdaipeist",
        "hr" to "Budimpešta",
        "hu" to "Budapest",
        "it" to "Budapest",
        "lt" to "Budapeštas",
        "lv" to "Budapešta",
        "mt" to "Budapest",
        "nl" to "Boedapest",
        "pl" to "Budapeszt",
        "pt" to "Budapeste",
        "ro" to "Budapesta",
        "sk" to "Budapešť",
        "sl" to "Budimpešta",
        "sv" to "Budapest"
    ),
    
    "copenhagen" to mapOf(
        "bg" to "Копенхаген",
        "cs" to "Kodaň",
        "da" to "København",
        "de" to "Kopenhagen",
        "el" to "Κοπεγχάγη",
        "en" to "Copenhagen",
        "es" to "Copenhague",
        "et" to "Kopenhaagen",
        "fi" to "Kööpenhamina",
        "fr" to "Copenhague",
        "ga" to "Cóbanhávan",
        "hr" to "Kopenhagen",
        "hu" to "Koppenhága",
        "it" to "Copenaghen",
        "lt" to "Kopenhaga",
        "lv" to "Kopenhāgena",
        "mt" to "Kopenħagen",
        "nl" to "Kopenhagen",
        "pl" to "Kopenhaga",
        "pt" to "Copenhaga",
        "ro" to "Copenhaga",
        "sk" to "Kodaň",
        "sl" to "København",
        "sv" to "Köpenhamn"
    ),

    "dublin" to mapOf(
        "bg" to "Дъблин",
        "cs" to "Dublin",
        "da" to "Dublin",
        "de" to "Dublin",
        "el" to "Δουβλίνο",
        "en" to "Dublin",
        "es" to "Dublín",
        "et" to "Dublin",
        "fi" to "Dublin",
        "fr" to "Dublin",
        "ga" to "Baile Átha Cliath",
        "hr" to "Dublin",
        "hu" to "Dublin",
        "it" to "Dublino",
        "lt" to "Dublinas",
        "lv" to "Dublina",
        "mt" to "Dublin",
        "nl" to "Dublin",
        "pl" to "Dublin",
        "pt" to "Dublin",
        "ro" to "Dublin",
        "sk" to "Dublin",
        "sl" to "Dublin",
        "sv" to "Dublin"
    ),

    "helsinki" to mapOf(
        "bg" to "Хелзинки",
        "cs" to "Helsinky",
        "da" to "Helsinki",
        "de" to "Helsinki",
        "el" to "Ελσίνκι",
        "en" to "Helsinki",
        "es" to "Helsinki",
        "et" to "Helsingi",
        "fi" to "Helsinki",
        "fr" to "Helsinki",
        "ga" to "Heilsincí",
        "hr" to "Helsinki",
        "hu" to "Helsinki",
        "it" to "Helsinki",
        "lt" to "Helsinkis",
        "lv" to "Helsinki",
        "mt" to "Ħelsinki",
        "nl" to "Helsinki",
        "pl" to "Helsinki",
        "pt" to "Helsínquia",
        "ro" to "Helsinki",
        "sk" to "Helsinki",
        "sl" to "Helsinki",
        "sv" to "Helsingfors"
    ),

    "lisbon" to mapOf(
        "bg" to "Лисабон",
        "cs" to "Lisabon",
        "da" to "Lissabon",
        "de" to "Lissabon",
        "el" to "Λισαβόνα",
        "en" to "Lisbon",
        "es" to "Lisboa",
        "et" to "Lissabon",
        "fi" to "Lissabon",
        "fr" to "Lisbonne",
        "ga" to "Liospóin",
        "hr" to "Lisabon",
        "hu" to "Lisszabon",
        "it" to "Lisbona",
        "lt" to "Lisabona",
        "lv" to "Lisabona",
        "mt" to "Lisbona",
        "nl" to "Lissabon",
        "pl" to "Lizbona",
        "pt" to "Lisboa",
        "ro" to "Lisabona",
        "sk" to "Lisabon",
        "sl" to "Lizbona",
        "sv" to "Lissabon"
    ),

    "ljubljana" to mapOf(
        "bg" to "Любляна",
        "cs" to "Lublaň",
        "da" to "Ljubljana",
        "de" to "Ljubljana",
        "el" to "Λιουμπλιάνα",
        "en" to "Ljubljana",
        "es" to "Liubliana",
        "et" to "Ljubljana",
        "fi" to "Ljubljana",
        "fr" to "Ljubljana",
        "ga" to "Liúibleána",
        "hr" to "Ljubljana",
        "hu" to "Ljubljana",
        "it" to "Lubiana",
        "lt" to "Liubliana",
        "lv" to "Ļubļana",
        "mt" to "Ljubljana",
        "nl" to "Ljubljana",
        "pl" to "Lublana",
        "pt" to "Liubliana",
        "ro" to "Ljubljana",
        "sk" to "Ljubljana",
        "sl" to "Ljubljana",
        "sv" to "Ľubľana"
    ),

    "london" to mapOf(
        "bg" to "Лондон",
        "cs" to "Londýn",
        "da" to "London",
        "de" to "London",
        "el" to "Λονδίνο",
        "en" to "London",
        "es" to "Londres",
        "et" to "London",
        "fi" to "Lontoo",
        "fr" to "Londres",
        "ga" to "Londain",
        "hr" to "London",
        "hu" to "London",
        "it" to "Londra",
        "lt" to "Londonas",
        "lv" to "Londona",
        "mt" to "Londra",
        "nl" to "Londen",
        "pl" to "Londyn",
        "pt" to "Londres",
        "ro" to "Londra",
        "sk" to "Londýn",
        "sl" to "London",
        "sv" to "London"
    ),

    "luxembourg" to mapOf(
        "bg" to "Люксембург",
        "cs" to "Lucemburk",
        "da" to "Luxembourg",
        "de" to "Luxemburg",
        "el" to "Λουξεμβούργο",
        "en" to "Luxembourg",
        "es" to "Luxemburgo",
        "et" to "Luxembourg",
        "fi" to "Luxemburg",
        "fr" to "Luxembourg",
        "ga" to "Lucsamburg",
        "hr" to "Luxembourg",
        "hu" to "Luxembourg",
        "it" to "Lussemburgo",
        "lt" to "Liuksemburgas",
        "lv" to "Luksemburga",
        "mt" to "Il-Lussemburgu",
        "nl" to "Luxemburg",
        "pl" to "Luksemburg",
        "pt" to "Luxemburgo",
        "ro" to "Luxemburg",
        "sk" to "Luxemburg",
        "sl" to "Luxembourg",
        "sv" to "Luxemburg"
    ),

    "madrid" to mapOf(
        "bg" to "Мадрид",
        "cs" to "Madrid",
        "da" to "Madrid",
        "de" to "Madrid",
        "el" to "Μαδρίτη",
        "en" to "Madrid",
        "es" to "Madrid",
        "et" to "Madrid",
        "fi" to "Madrid",
        "fr" to "Madrid",
        "ga" to "Maidrid",
        "hr" to "Madrid",
        "hu" to "Madrid",
        "it" to "Madrid",
        "lt" to "Madridas",
        "lv" to "Madride",
        "mt" to "Madrid",
        "nl" to "Madrid",
        "pl" to "Madryt",
        "pt" to "Madrid",
        "ro" to "Madrid",
        "sk" to "Madrid",
        "sl" to "Madrid",
        "sv" to "Madrid"
    ),

    "nicosia" to mapOf(
        "bg" to "Никозия",
        "cs" to "Nikósie",
        "da" to "Nicosia",
        "de" to "Nikosia",
        "el" to "Λευκωσία",
        "en" to "Nicosia",
        "es" to "Nicosia",
        "et" to "Nikosia",
        "fi" to "Nikosia",
        "fr" to "Nicosie",
        "ga" to "an Niocóis",
        "hr" to "Nikozija",
        "hu" to "Nicosia",
        "it" to "Nicosia",
        "lt" to "Nikosija",
        "lv" to "Nikozija",
        "mt" to "Nikosija",
        "nl" to "Nicosia",
        "pl" to "Nikozja",
        "pt" to "Nicósia",
        "ro" to "Nicosia",
        "sk" to "Nikózia",
        "sl" to "Nikozija",
        "sv" to "Nicosia"
    ),

    "paris" to mapOf(
        "bg" to "Париж",
        "cs" to "Paříž",
        "da" to "Paris",
        "de" to "Paris",
        "el" to "Παρίσι",
        "en" to "Paris",
        "es" to "París",
        "et" to "Pariis",
        "fi" to "Pariisi",
        "fr" to "Paris",
        "ga" to "Páras",
        "hr" to "Pariz",
        "hu" to "Párizs",
        "it" to "Parigi",
        "lt" to "Paryžius",
        "lv" to "Parīze",
        "mt" to "Pariġi",
        "nl" to "Parijs",
        "pl" to "Paryż",
        "pt" to "Paris",
        "ro" to "Paris",
        "sk" to "Paríž",
        "sl" to "Pariz",
        "sv" to "Paris"
    ),
    
    "prague" to mapOf(
        "bg" to "Прага",
        "cs" to "Praha",
        "da" to "Prag",
        "de" to "Prag",
        "el" to "Πράγα",
        "en" to "Prague",
        "es" to "Praga",
        "et" to "Praha",
        "fi" to "Praha",
        "fr" to "Prague",
        "ga" to "Prág",
        "hr" to "Prag",
        "hu" to "Prága",
        "it" to "Praga",
        "lt" to "Praha",
        "lv" to "Prāga",
        "mt" to "Praga",
        "nl" to "Praag",
        "pl" to "Praga",
        "pt" to "Praga",
        "ro" to "Praga",
        "sk" to "Praha",
        "sl" to "Praga",
        "sv" to "Prag"
    ),

    "riga" to mapOf(
        "bg" to "Рига",
        "cs" to "Riga",
        "da" to "Riga",
        "de" to "Riga",
        "el" to "Ρίγα",
        "en" to "Riga",
        "es" to "Riga",
        "et" to "Riia",
        "fi" to "Riika",
        "fr" to "Riga",
        "ga" to "Ríge",
        "hr" to "Riga",
        "hu" to "Riga",
        "it" to "Riga",
        "lt" to "Ryga",
        "lv" to "Rīga",
        "mt" to "Riga",
        "nl" to "Riga",
        "pl" to "Ryga",
        "pt" to "Riga",
        "ro" to "Riga",
        "sk" to "Riga",
        "sl" to "Riga",
        "sv" to "Riga"
    ),

    "rome" to mapOf(
        "bg" to "Рим",
        "cs" to "Řím",
        "da" to "Rom",
        "de" to "Rom",
        "el" to "Ρώμη",
        "en" to "Rome",
        "es" to "Roma",
        "et" to "Rooma",
        "fi" to "Rooma",
        "fr" to "Rome",
        "ga" to "an Róimh",
        "hr" to "Rim",
        "hu" to "Róma",
        "it" to "Roma",
        "lt" to "Roma",
        "lv" to "Roma",
        "mt" to "Ruma",
        "nl" to "Rome",
        "pl" to "Rzym",
        "pt" to "Roma",
        "ro" to "Roma",
        "sk" to "Rím",
        "sl" to "Rim",
        "sv" to "Rom"
    ),

    "sofia" to mapOf(
        "bg" to "София",
        "cs" to "Sofie",
        "da" to "Sofia",
        "de" to "Sofia",
        "el" to "Σόφια",
        "en" to "Sofia",
        "es" to "Sofía",
        "et" to "Sofia",
        "fi" to "Sofia",
        "fr" to "Sofia",
        "ga" to "Sóifia",
        "hr" to "Sofija",
        "hu" to "Szófia",
        "it" to "Sofia",
        "lt" to "Sofija",
        "lv" to "Sofija",
        "mt" to "Sofia",
        "nl" to "Sofia",
        "pl" to "Sofia",
        "pt" to "Sófia",
        "ro" to "Sofia",
        "sk" to "Sofia",
        "sl" to "Sofija",
        "sv" to "Sofia"
    ),

    "stockholm" to mapOf(
        "bg" to "Стокхолм",
        "cs" to "Stockholm",
        "da" to "Stockholm",
        "de" to "Stockholm",
        "el" to "Στοκχόλμη",
        "en" to "Stockholm",
        "es" to "Estocolmo",
        "et" to "Stockholm",
        "fi" to "Tukholma",
        "fr" to "Stockholm",
        "ga" to "Stócólm",
        "hr" to "Stockholm",
        "hu" to "Stockholm",
        "it" to "Stoccolma",
        "lt" to "Stokholmas",
        "lv" to "Stokholma",
        "mt" to "Stokkolma",
        "nl" to "Stockholm",
        "pl" to "Sztokholm",
        "pt" to "Estocolmo",
        "ro" to "Stockholm",
        "sk" to "Štokholm",
        "sl" to "Stockholm",
        "sv" to "Stockholm"
    ],

    "tallinn" to mapOf(
        "bg" to "Талин",
        "cs" to "Tallinn",
        "da" to "Tallinn",
        "de" to "Tallinn",
        "el" to "Ταλίν",
        "en" to "Tallinn",
        "es" to "Tallin",
        "et" to "Tallinn",
        "fr" to "Tallinn",
        "fi" to "Tallinna",
        "ga" to "Taillinn",
        "hr" to "Tallinn",
        "hu" to "Tallinn",
        "it" to "Tallinn",
        "lt" to "Talinas",
        "lv" to "Tallina",
        "mt" to "Talinn",
        "nl" to "Tallinn",
        "pl" to "Tallin",
        "pt" to "Taline",
        "ro" to "Tallinn",
        "sk" to "Tallinn",
        "sl" to "Talin",
        "sv" to "Tallinn"
    ),

    "valletta" to mapOf(
        "bg" to "Валета",
        "cs" to "Valetta",
        "da" to "Valletta",
        "de" to "Valletta",
        "el" to "Βαλέτα",
        "en" to "Valletta",
        "es" to "La Valeta",
        "et" to "Valletta",
        "fi" to "Valletta",
        "fr" to "La Valette",
        "ga" to "Vaileite",
        "hr" to "Valletta",
        "hu" to "Valletta",
        "it" to "La Valletta",
        "lt" to "Valeta",
        "lv" to "Valeta",
        "mt" to "Valletta",
        "nl" to "Valletta",
        "pl" to "Valletta",
        "pt" to "Valeta",
        "ro" to "Valletta",
        "sk" to "Valletta",
        "sl" to "Valletta",
        "sv" to "Valletta"
    ),

    "vienna" to mapOf(
        "bg" to "Виена",
        "cs" to "Vídeň",
        "da" to "Wien",
        "de" to "Wien",
        "el" to "Βιέννη",
        "en" to "Vienna",
        "es" to "Viena",
        "et" to "Viin",
        "fi" to "Wien",
        "fr" to "Vienne",
        "ga" to "Vín",
        "hr" to "Beč",
        "hu" to "Bécs",
        "it" to "Vienna",
        "lt" to "Viena",
        "lv" to "Vīne",
        "mt" to "Vjenna",
        "nl" to "Wenen",
        "pl" to "Wiedeń",
        "pt" to "Viena",
        "ro" to "Viena",
        "sk" to "Viedeň",
        "sl" to "Dunaj",
        "sv" to "Wien"
    ),

    "vilnius" to mapOf(
        "bg" to "Вилнюс",
        "cs" to "Vilnius",
        "da" to "Vilnius",
        "de" to "Wilna (Vilnius)",
        "el" to "Βίλνιους",
        "en" to "Vilnius",
        "es" to "Vilna",
        "et" to "Vilnius",
        "fi" to "Vilna",
        "fr" to "Vilnius",
        "ga" to "Vilnias",
        "hr" to "Vilnius",
        "hu" to "Vilnius",
        "it" to "Vilnius",
        "lt" to "Vilnius",
        "lv" to "Viļņa",
        "mt" to "Vilnjus",
        "nl" to "Vilnius",
        "pl" to "Wilno",
        "pt" to "Vilnius",
        "ro" to "Vilnius",
        "sk" to "Vilnius",
        "sl" to "Vilna",
        "sv" to "Vilnius"
    ),
    
    "warsaw" to mapOf(
        "bg" to "Варшава",
        "cs" to "Varšava",
        "da" to "Warszawa",
        "de" to "Warschau",
        "el" to "Βαρσοβία",
        "en" to "Warsaw",
        "es" to "Varsovia",
        "et" to "Varssavi",
        "fi" to "Varsova",
        "fr" to "Varsovie",
        "ga" to "Vársá",
        "hr" to "Varšava",
        "hu" to "Varsó",
        "it" to "Varsavia",
        "lt" to "Varšuva",
        "lv" to "Varšava",
        "mt" to "Varsavja",
        "nl" to "Warschau",
        "pl" to "Warszawa",
        "pt" to "Varsóvia",
        "ro" to "Varșovia",
        "sk" to "Varšava",
        "sl" to "Varšava",
        "sv" to "Warszawa"
    ),

    "zagreb" to mapOf(
        "bg" to "Загреб",
        "cs" to "Záhřeb",
        "da" to "Zagreb",
        "de" to "Zagreb",
        "el" to "Ζάγκρεμπ",
        "en" to "Zagreb",
        "es" to "Zagreb",
        "et" to "Zagreb",
        "fi" to "Zagreb",
        "fr" to "Zagreb",
        "ga" to "Ságrab",
        "hr" to "Zagreb",
        "hu" to "Zágráb",
        "it" to "Zagabria",
        "lt" to "Zagrebas",
        "lv" to "Zagreba",
        "mt" to "Żagreb",
        "nl" to "Zagreb",
        "pl" to "Zagrzeb",
        "pt" to "Zagrebe",
        "ro" to "Zagreb",
        "sk" to "Záhreb",
        "sl" to "Zagreb",
        "sv" to "Zagreb"
    )
)

/*
fun printCityNames() {

}

fun printCountryNames() {

}
*/

fun main(args: Array<String>) {
    val finland = Country("Finland", City("Helsinki", Coordinate(60.1708, 24.9375)), 330_000L, 5_451_270L, "1995-01-01")
    val sweden = Country("Sweden", City("Stockholm", Coordinate(59.3294, 18.0686)), 438_574L, 9_644_864L, "1995-01-01")
    val belgium = Country("Belgium", City("Brussels", Coordinate(50.85, 4.35)), 30528L, 11_203_992L, "1958-01-01")
    val austria = Country("Austria", City("Vienna", Coordinate(48.2089, 16.3725)), 83879L, 8_507_786L, "1995-01-01")
    val czechRepublic = Country("Czech Republic", City("Prague", Coordinate(50.0833, 14.4167)), 78867L, 10_512_419L, "2004-05-01")
    val netherlands = Country("Netherlands", City("Amsterdam", Coordinate(52.3731, 4.8922)), 41540L, 16_829_289L, "1958-01-01")
    val bulgaria = Country("Bulgaria", City("Sofia", Coordinate(42.7, 23.3333)), 111_002L, 7_245_677L, "2007-01-01")
    val greece = Country(
        "Greece",
        City(
            "Athens",
            Coordinate(37.9667, 23.7167)),
        131957L,
        10_992_589L,
        "1981-01-01")

    val cyprus = Country(
        "Cyprus",
        City(
            "Nicosia",
            Coordinate(35.1667, 33.3667)),
        9251,
        858_000,
        "2004-05-01")

    val denmark = Country(
        "Denmark",
        City(
            "Copenhagen",
            Coordinate(55.6761, 12.5683)),
        42_921,
        5_627_235,
        "1973-01-01")

    val estonia = Country(
        "Estonia",
        City(
            "Tallinn",
            Coordinate(59.4372, 24.7453)),
        45227,
        1315819,
        "2004-01-01")

    val france = Country(
        "France",
        City(
            "Paris",
            Coordinate(48.8567, 2.3508)),
        632_833,
        65_856_609L,
        "1958-01-01")

    val germany = Country(
        "Germany",
        City(
            "Berlin",
            Coordinate(52.5167, 13.3833)),
        357340,
        80780000,
        "1958-01-01")

    val hungary = Country(
        "Hungary",
        City(
            "Budapest",
            Coordinate(47.4719, 19.0503)),
        93024,
        9879000,
        "2004-01-01")

    val ireland = Country(
        "Ireland",
        City(
            "Dublin",
            Coordinate(53.3478, -6.2597)),
        69797,
        4604029,
        "1973-01-01")

    val latvia = Country(
        "Latvia",
        City(
            "Riga",
            Coordinate(56.9489, 24.1064)),
        64573,
        2001468,
        "2004-05-01")

    val lithuania = Country(
        "Lithuania",
        City(
            "Vilnius",
            Coordinate(54.6833, 25.2833)),
        65300,
        2943472,
        "2004-05-01")

    val luxembourg = Country(
        "Luxembourg",
        City(
            "Luxembourg",
            Coordinate(49.6117, 6.13)),
        2586,
        549680,
        "2004-05-01")

    val malta = Country(
        "Malta",
        City(
            "Valletta",
            Coordinate(35.8978, 14.5125)),
        316,
        425384,
        "2004-05-01")

    val poland = Country(
        "Poland",
        City(
            "Warsaw",
            Coordinate(52.2333, 21.0167)),
        312679,
        38495659,
        "2004-05-01")

    val portugal = Country(
        "Portugal",
        City(
            "Lisbon",
            Coordinate(38.7136, -9.1392)),
        92225,
        10427301,
        "1986-01-01")

    val romania = Country(
        "Romania",
        City(
            "Bucharest",
            Coordinate(44.4325, 26.1039)),
        238391,
        19942642,
        "2007-01-01")

    val slovakia = Country(
        "Slovakia",
        City(
            "Bratislava",
            Coordinate(48.1439, 17.1097)),
        49035,
        5415949,
        "2004-05-01")

    val slovenia = Country(
        "Slovenia",
        City(
            "Ljubljana",
            Coordinate(46.0556, 14.5083)),
        20273,
        2061085,
        "2004-05-01")

    val unitedKingdom = Country(
        "United Kingdom",
        City(
            "London",
            Coordinate(51.5072, -0.1275)),
        248528,
        64308261,
        "1973-01-01")

    val croatia = Country(
        "Croatia",
        City(
            "Zagreb",
            Coordinate(45.8167, 15.9833)),
        56594,
        4246700,
        "2013-07-01")

    val italy = Country(
        "Italy",
        City(
            "Rome",
            Coordinate(41.9, 12.5)),
        302073,
        60782668,
        "1958-01-01")

    val spain = Country(
        "Spain",
        City(
            "Madrid",
            Coordinate(40.3833, -3.7167)),
        505970,
        46507760,
        "1986-01-01")
    
    val countries: List<Country> = listOf(
        finland, sweden, belgium, austria, czechRepublic, 
        netherlands, bulgaria, greece, cyprus, denmark,
        estonia, france, germany, hungary, ireland,
        latvia, lithuania, luxembourg, malta, poland,
        portugal, romania, slovakia, slovenia, unitedKingdom,
        croatia, italy, spain)

    /*
    var totalPopulationIterative = 0L
    for (country in countries) {
        totalPopulationIterative += country.population
    }
    println("Total population (iterative) = $totalPopulationIterative")

    val totalPopulationFunctional = countries.map { it.population }.reduce { total, item -> total + item }
    println("Total population (functional, map/reduce) = $totalPopulationFunctional")

    val totalPopulation = countries.map { it.population }.sum()
    println("Total population (functional, sum) = $totalPopulation")
    */

    var joinsByDate = mutableMapOf<String, MutableList<String>>()
    for (country in countries) {
        if (joinsByDate.containsKey(country.joinedUnionDate)) {
            joinsByDate[country.joinedUnionDate]!!.add(country.name)
        }
        else {
            joinsByDate[country.joinedUnionDate] = mutableListOf<String>(country.name)
        }
    }
    
    //println(joinsByDate)
    
    println("Timeline:")
    var joinDates = joinsByDate.keys.toList().sorted()
    for (date in joinDates) {
        val joinedCountries = joinsByDate[date]!!.sorted()
        val lastIndex = joinedCountries.size - 1
        val countryPart = when (joinedCountries.size) {
            0 -> "***ERROR***"
            1 -> joinedCountries[0]
            2 -> joinedCountries.joinToString(" and ")
            else -> "${ joinedCountries.subList(0, lastIndex).joinToString(", ") } and ${joinedCountries[lastIndex]}" 
        }
        println("$date: $countryPart joined the EU")
    }
}
