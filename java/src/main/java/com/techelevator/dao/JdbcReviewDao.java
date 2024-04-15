package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.List;

public class JdbcReviewDao implements ReviewDao {


    @Override
    public List<Review> listByBeerId(int beerId) {
        return null;
    }

    @Override
    public Review getById(int beerId) {
        return null;
    }

    @Override
    public Review add(Review review, int beerId) {
        return null;
    }

    @Override
    public Review update(Review review) {
        return null;
    }

    @Override
    public void delete(int beerId) {

    }

    private Review mapRowToReview(SqlRowSet row) {
        Review review = new Review();
        review.setBeerId(row.getLong("product_id"));
        review.setReviewer(row.getString("reviewer"));
        review.setTitle(row.getString("title"));
        review.setReview(row.getString("review"));
        review.setRating(row.getInt("rating"));
        return review;
    }
}
