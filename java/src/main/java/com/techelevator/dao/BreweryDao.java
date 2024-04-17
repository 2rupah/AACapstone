package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryImage;

import java.util.List;

public interface BreweryDao {

    List<Brewery> listAllBreweries();

    Brewery createBrewery(Brewery brewery);

    Brewery updateBrewery(Brewery brewery);

    Brewery getBreweryById(int breweryId);
    List<BreweryImage> getImagesByBreweryId(int breweryId);

    List<Brewery> searchBreweries(String searchTerm);
}
