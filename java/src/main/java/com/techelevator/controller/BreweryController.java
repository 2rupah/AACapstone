package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.JdbcBrewery;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
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

     /*4.10.2024 - Reconsidering our endpoints we should rename it something like /brewery/{id}/beer to gather our list
     of beers from a specific brewery */
    @RequestMapping(path = "/{id}/beer", method = RequestMethod.GET)
    public List<Beer> list(@PathVariable int id) {
        return beerDao.getAllBeersFromBrewery(id);
    }

//    @ResponseStatus(HttpStatus.CREATED)
//    @RequestMapping(path = "/(id)", method = RequestMethod.POST)
//    public Brewery addBrewery(@Valid @RequestBody Brewery brewery){
//        return breweryDao.createBrewery(brewery);
//    }
//
//    @RequestMapping(path = "", method = RequestMethod.PUT)
//    public Brewery updateBrewery(@Valid @RequestBody Brewery brewery, @PathVariable("id") int breweryId) {
//        if(brewery.getBreweryId() != breweryId) {
//            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Brewery ID doesn't exist! :O");
//        }
//
//        Brewery existingBrewery = breweryDao.getBreweryById(breweryId);
//        if(existingBrewery == null) {
//            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
//        }
//
//        breweryDao.updateBrewery(brewery);
//        return brewery;
//    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/beer", method = RequestMethod.POST)
    public Beer addBeer(@RequestBody Beer beer) {
        return beerDao.createBeer(beer);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path="/delete/{id}", method = RequestMethod.DELETE)
    public void deleteProduct(@PathVariable int id) {

        beerDao.deleteBeerById(id);
    }
}
