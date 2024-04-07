package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/brewery")
public class BreweryController {

    private BreweryDao breweryDao;
    private BeerDao beerDao;

    public BreweryController(BreweryDao breweryDao, BeerDao beerDao) {
        this.breweryDao = breweryDao;
        this.beerDao = beerDao;
    }

    @GetMapping
    public List<Brewery> listAll() {
        return breweryDao.listAllBreweries();
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public List<Beer> list(@PathVariable int id) {
        return beerDao.getAllBeersFromBrewery(id);
    }
}
