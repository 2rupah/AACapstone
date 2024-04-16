package com.techelevator.model;

public class BreweryImage {
    private int brewery_id;
    private int image_id;
    private String image_url;

    public int getBrewery_id() {
        return brewery_id;
    }

    public BreweryImage(int brewery_id, int image_id, String image_url) {
        this.brewery_id = brewery_id;
        this.image_id = image_id;
        this.image_url = image_url;
    }

    public BreweryImage() {

    }
    public void setBrewery_id(int brewery_id) {
        this.brewery_id = brewery_id;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
