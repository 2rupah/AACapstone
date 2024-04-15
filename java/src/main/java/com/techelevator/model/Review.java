package com.techelevator.model;

public class Review {
    private long reviewId;
    private long beerId;
    private String reviewer;
    private String review;
    private int rating;

    public Review(long reviewId, long beerId, String reviewer, String review, int rating) {
        this.reviewId = reviewId;
        this.beerId = beerId;
        this.reviewer = reviewer;
        this.review = review;
        this.rating = rating;
    }

    public long getReviewId() {
        return reviewId;
    }

    public void setReviewId(long reviewId) {
        this.reviewId = reviewId;
    }

    public long getBeerId() {
        return beerId;
    }

    public void setBeerId(long beerId) {
        this.beerId = beerId;
    }

    public String getReviewer() {
        return reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
