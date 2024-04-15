package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {

    List<Review> listByBeerId (int beerId);
    Review getById(int beerId);
    Review add(Review review, int beerId);
    Review update(Review review);
    void delete(int beerId);
}
