pragma solidity ^0.4.4;

contract MappingEnumStruct {

    mapping(string => string) capitals;

    enum continents {Africa, Antartica, Asia, Australia, Europe, North_America, south_America}

    struct Country {
        bytes32 name;
        continents continent;
        uint16 populationInMillion;
    }

    Country[] europeanCountries;

    function addEuropeanCountry(bytes32 nm, uint8 cont, uint16 pop) returns (bool) {
        if (cont != uint8(continents.Europe)) 
            return false;
        
        Country memory ctry;

        ctry = Country(nm, continents(cont), pop);

        europeanCountries.push(ctry);
        return true; 
    }

    function getEuropeanCountry (bytes32 name) returns (bytes32, uint8, uint16) {
        for (uint8 i = 0; i < europeanCountries.length; i++){
            if (name == europeanCountries[i].name) {
                return (europeanCountries[i].name,
                        uint8(europeanCountries[i].continent),
                        europeanCountries[i].populationInMillion
                        );
            }
        }
    }

    function addCapital(string country, string capital) {
        capitals[country] = capital;
    }

    function getCapital(string country) returns (string) {
        return capitals[country];
    }

    function removeCapital(string country) {
        delete(capitals[country]);
    }

    function getContinent(uint arg) returns (string) {
        if (arg == uint8(continents.Africa)) 
            return "Africa";
        if (arg == uint8(continents.Antartica)) 
            return "Antartica";
        if (arg == uint8(continents.Asia)) 
            return "Asia";
        if (arg == uint8(continents.Australia)) 
            return "Australia";
        if (arg == uint8(continents.Europe)) 
            return "Europe";
        if (arg == uint8(continents.North_America)) 
            return "North_America";
        if (arg == uint8(continents.south_America)) 
            return "south_America";
    }
}