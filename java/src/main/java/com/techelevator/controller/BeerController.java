package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/beer")
public class BeerController {

    private BeerDao beerDao;

    public BeerController(BeerDao beerDao) {
        this.beerDao = beerDao;
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Beer get(@PathVariable int id){
        return beerDao.getBeerById(id);
    }

    @RequestMapping(path = "brewery/{id}", method = RequestMethod.GET)
    public List<Beer> list(@PathVariable int id) {
        return beerDao.getAllBeersFromBrewery(id);
    }

}
