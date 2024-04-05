package com.techelevator.model;

public class Brewery {

    private int breweryId;
    private String name;
    private String location;
    private int establishedYear;
    private String description;

    public Brewery() {
    }

    public Brewery(int breweryId, String name, String location, int establishedYear, String description) {
        this.breweryId = breweryId;
        this.name = name;
        this.location = location;
        this.establishedYear = establishedYear;
        this.description = description;
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
}
