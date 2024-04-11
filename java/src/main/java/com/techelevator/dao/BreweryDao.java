package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDao {

    List<Brewery> listAllBreweries();

    Brewery createBrewery(Brewery brewery);

    Brewery updateBrewery(Brewery brewery);

    Brewery getBreweryById(int breweryId);
}
