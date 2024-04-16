package com.techelevator.model;

public class BreweryImage {
    private int breweryId;
    private int imageId;
    private String imageUrl;

    public BreweryImage(int breweryId, int imageId, String imageUrl) {
        this.breweryId = breweryId;
        this.imageId = imageId;
        this.imageUrl = imageUrl;
    }

    public BreweryImage() {
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}