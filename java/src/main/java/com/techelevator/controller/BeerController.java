package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.ReviewDao;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import com.techelevator.model.Review;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/beer")
public class BeerController {

    private BeerDao beerDao;
    private ReviewDao reviewDao;

    public BeerController(BeerDao beerDao, ReviewDao reviewDao) {
        this.beerDao = beerDao;
        this.reviewDao = reviewDao;
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Beer get(@PathVariable int id){
        return beerDao.getBeerById(id);
    }

    // Reviews

    @GetMapping("/{id}/reviews")
    public List<Review> listReviewsForBeer(@PathVariable("id") int beerId) {
        return reviewDao.listByBeerId(beerId);
    }

    @GetMapping("/reviews/{id}")
    public Review getReview(@PathVariable("id") int reviewId) {
        Review review = reviewDao.getById(reviewId);
        if (review == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Review Not Found");
        }
        return reviewDao.getById(reviewId);
    }

    @PostMapping("/{id}/reviews")
    @ResponseStatus(HttpStatus.CREATED)
    public Review addReviewToBeer(@PathVariable("id") int beerId, @RequestBody Review review) {
        return reviewDao.add(review, beerId);
    }

}
