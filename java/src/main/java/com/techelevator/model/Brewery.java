package com.techelevator.model;

import java.util.List;

public class Brewery {

    private int breweryId;
    private String name;
    private String location;
    private int establishedYear;
    private String description;
    private String imageUrl;

    private String mapUrl;

    private double longitude;
    private double latitude;

    private List<BreweryImage> breweryImage;
    public Brewery() {
    }

    public Brewery(int breweryId, String name, String location, int establishedYear, String description, String imageUrl, String mapUrl, double longitude, double latitude) {
        this.breweryId = breweryId;
        this.name = name;
        this.location = location;
        this.establishedYear = establishedYear;
        this.description = description;
        this.imageUrl = imageUrl;
        this.mapUrl = mapUrl;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public List<BreweryImage> getBreweryImage() {
        return breweryImage;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public void setBreweryImage(List<BreweryImage> breweryImage) {
        this.breweryImage = breweryImage;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getEstablishedYear() {
        return establishedYear;
    }

    public void setEstablishedYear(int establishedYear) {
        this.establishedYear = establishedYear;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMapUrl() {
        return mapUrl;
    }

    public void setMapUrl(String mapUrl) {
        this.mapUrl = mapUrl;
    }
}
