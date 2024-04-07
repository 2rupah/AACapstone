package com.techelevator.dao;

import com.techelevator.model.Beer;
import java.util.List;

public interface BeerDao {

    //Get a beer by it's ID
    Beer getBeerById(int beerId);

    //Get a beer by a brewery's ID
//    Beer getBeerByBreweryId(int breweryId);

    //List of all the beers from a specific brewery
    List<Beer> getAllBeersFromBrewery(int breweryId);

}
