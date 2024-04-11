package com.techelevator.dao;

import com.techelevator.model.Beer;
import java.util.List;

public interface BeerDao {

    //Get a beer by it's ID
    Beer getBeerById(int beerId);

    //List of all the beers from a specific brewery
    List<Beer> getAllBeersFromBrewery(int breweryId);

    // Create new Beer
    Beer createBeer(Beer beer);

    // Delete Beer by name
    public int deleteBeerById(int id);
}
