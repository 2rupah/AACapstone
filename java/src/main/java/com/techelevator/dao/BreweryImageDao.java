package com.techelevator.dao;

import com.techelevator.model.BreweryImage;

import java.util.List;

public interface BreweryImageDao {
    List<BreweryImage> getImagesByBreweryId(int brewery_Id);
}
