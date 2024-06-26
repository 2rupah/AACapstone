package com.techelevator.model;

public class Review {

    private int reviewId;
    private int beerId;
    private String reviewer;
    private String review;
    private int rating;

    public Review(int reviewId, int beerId, String reviewer, String review, int rating) {
        this.reviewId = reviewId;
        this.beerId = beerId;
        this.reviewer = reviewer;
        this.review = review;
        this.rating = rating;
    }

    public Review() {
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
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

