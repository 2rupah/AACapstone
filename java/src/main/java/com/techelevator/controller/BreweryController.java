package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@CrossOrigin
@RestController
//@RequestMapping("/brewery")
public class BreweryController {

    private BreweryDao breweryDao;
    private BeerDao beerDao;

    public BreweryController(BreweryDao breweryDao, BeerDao beerDao) {
        this.breweryDao = breweryDao;
        this.beerDao = beerDao;
    }

    @RequestMapping(path = "/brewery", method = RequestMethod.GET)
    public List<Brewery> listAll() {
        return breweryDao.listAllBreweries();
    }

     /*4.10.2024 - Reconsidering our endpoints we should rename it something like /brewery/{id}/beer to gather our list
     of beers from a specific brewery */
    @RequestMapping(path = "/brewery/{id}", method = RequestMethod.GET)
    public List<Beer> list(@PathVariable int id) {
        return beerDao.getAllBeersFromBrewery(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/brewery/add", method = RequestMethod.POST)
    public Brewery addBrewery(@RequestBody Brewery brewery){
        return breweryDao.createBrewery(brewery);
    }

    @RequestMapping(path = "/brewery/{id}/update", method = RequestMethod.PUT)
    public Brewery updateBrewery(@RequestBody Brewery brewery, @PathVariable int id) {
        if (id != brewery.getBreweryId()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN);
        }

        return breweryDao.updateBrewery(brewery);
    }

    @ResponseStatus(HttpStatus.CREATED)
@RequestMapping(path = "/login/add", method = RequestMethod.POST)
public Beer addBeer(@RequestBody Beer beer) {
    return beerDao.createBeer(beer);
}

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path="/brewery/{id}", method = RequestMethod.DELETE)
    public void deleteBeer(@PathVariable int id) {
        beerDao.deleteBeerById(id);
    }
}
