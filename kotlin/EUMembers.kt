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
    var czechRepublic = Country("Czech Republic", City("Prague", Coordinate(50.0833, 14.4167)), 78867, 10_512_419, "2004-05-01")
    var netherlands = Country("Netherlands", City("Amsterdam", Coordinate(52.3731, 4.8922)), 41540, 16_829_289, "1958-01-01")
    
    val countries: List<Country> = listOf(finland, sweden, belgium, austria, czechRepublic, netherlands)

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
