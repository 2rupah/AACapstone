package com.techelevator.model;

public class Beer {

    //When adding beers we may find the @Min, @Max, and @NotBlank annotations useful
    //Don't forget these!!
    private int beerId;
    private String name;
    private int breweryId;
    private String style;
    private double abv;
    private int ibu;
    private String description;

    public Beer(int beerId, String name, int breweryId, String style, double abv, int ibu, String description){
        this.beerId = beerId;
        this.name = name;
        this.breweryId = breweryId;
        this.style = style;
        this.abv = abv;
        this.ibu = ibu;
        this.description = description;
    }

    public Beer(){

    }

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public double getAbv() {
        return abv;
    }

    public void setAbv(double abv) {
        this.abv = abv;
    }

    public int getIbu() {
        return ibu;
    }

    public void setIbu(int ibu) {
        this.ibu = ibu;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
