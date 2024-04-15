package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

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

    private Review mapRowToReview(SqlRowSet rowSet) {
        Review review = new Review();

        review.setBeerId(rowSet.getInt("product_id"));
        review.setReviewer(rowSet.getString("reviewer"));
        review.setReview(rowSet.getString("review"));
        review.setRating(rowSet.getInt("rating"));

        return review;
    }
}
