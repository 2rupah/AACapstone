package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;

public class JdbcReviewDao implements ReviewDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Review> listByBeerId(int beerId) {
        List<Review> reviews = new ArrayList<Review>();
        String sql = "SELECT id, beer_id, reviewer, review, rating, FROM reviews WHERE beer_id = ?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, beerId);
        while(rows.next()) {
            reviews.add( mapRowToReview(rows) );
        }
        return reviews;
    }

    @Override
    public Review getById(int beerId) {
        return null;
    }

    @Override
    public Review add(Review review, int beerId) {
        return null;
    }
//
//    @Override
//    public Review update(Review review) {
//        return null;
//    }

//    @Override
//    public void delete(int beerId) {
//
//    }

    private Review mapRowToReview(SqlRowSet rowSet) {
        Review review = new Review();

        review.setBeerId(rowSet.getInt("product_id"));
        review.setReviewer(rowSet.getString("reviewer"));
        review.setReview(rowSet.getString("review"));
        review.setRating(rowSet.getInt("rating"));

        return review;
    }
}
