using System;
using System.Globalization;

namespace EUMembers;

public class Program
{
    public static void Main()
    {
        var currentCulture = CultureInfo.CurrentCulture;
        Console.WriteLine($"Current culture = {currentCulture}");

        foreach (var country in CountryManager.Instance.Countries)
        {
            Console.WriteLine(country.Name);
            Console.WriteLine($"Population: {country.Population:N0}");
            Console.WriteLine($"Area: {country.Area:N0} km\xB2");
            Console.WriteLine($"Population density: {country.PopulationDensity:N0} people per km\xB2");
            Console.WriteLine();
        }
    }
}
