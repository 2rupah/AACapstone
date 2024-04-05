package com.techelevator.dao;

import com.techelevator.model.Beer;
import java.util.List;

public interface BeerDao {

    //Get a beer by id
    Beer getBeerById();

    //Get a beer by a brewery id
    int getBeerByBreweryId();

    //List of all beers by brewery
    List<Beer> getBeersByBrewery();

}
