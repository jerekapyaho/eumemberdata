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
