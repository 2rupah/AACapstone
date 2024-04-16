package com.techelevator.dao;

import com.techelevator.model.BreweryImage;
import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBreweryImageDao implements BreweryImageDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryImageDao(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<BreweryImage> getImagesByBreweryId(int breweryId) {
        List<BreweryImage> breweryImagesById = new ArrayList<BreweryImage>();
        String sql = "SELECT brewery_id, image_id, image_url FROM brewery_images WHERE brewery_id = ?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, breweryId);
        while(rows.next()) {
            breweryImagesById.add( mapRowToBreweryImage(rows) );
        }
        return breweryImagesById;
    }

    private BreweryImage mapRowToBreweryImage(SqlRowSet rowSet) {
        BreweryImage breweryImage = new BreweryImage();

        breweryImage.setBrewery_id(rowSet.getInt("brewery_id"));
        breweryImage.setImage_id(rowSet.getInt("image_id"));
        breweryImage.setImage_url(rowSet.getString("image_url"));


        return breweryImage;
    }
}
