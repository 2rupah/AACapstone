package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryImage;
import com.techelevator.model.Review;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBrewery implements BreweryDao{

    private static final String SELECT_BREWERY_SQL = "SELECT brewery_id, name, location, established_year, description, imageurl, mapurl, longitude, latitude " +
            "FROM brewery";
    private static final String SELECT_IMAGE_SQL = "SELECT image_url FROM brewery_images";

    private JdbcTemplate jdbcTemplate;

    public JdbcBrewery(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Brewery> listAllBreweries() {
        List<Brewery> breweries = new ArrayList<>();
        SqlRowSet rows = jdbcTemplate.queryForRowSet(SELECT_BREWERY_SQL);
        while (rows.next()) {
            breweries.add( mapRowToBrewery(rows));
        }

        return breweries;
    }

//    copied and pasted this, we need to update the String sql for our brewery database!
    @Override
    public Brewery createBrewery(Brewery brewery) {
        String sql = "INSERT INTO brewery (name, location, established_year, description, imageurl, mapurl, longitude, latitude) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ? ) RETURNING brewery_id";
        try {
            int newBreweryId = jdbcTemplate.queryForObject(sql, int.class, brewery.getName(), brewery.getLocation(),
                    brewery.getEstablishedYear(), brewery.getDescription(), brewery.getImageUrl(), brewery.getMapUrl(),
                    brewery.getLongitude(), brewery.getLatitude());
            brewery.setBreweryId(newBreweryId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to database.", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Cannot have duplicate values.", e);
        }

        return brewery;
    }

    @Override
    public Brewery updateBrewery(Brewery brewery) {
        String sql = "UPDATE brewery " +
                "SET name = ?, " +
                "    location = ?, " +
                "    established_year = ?, " +
                "    description = ?, " +
                "    imageurl = ? " +
                "    mapurl = ? " +
                "    longitude = ? " +
                "    latitude = ?" +
                "WHERE brewery_id = ?;";
        try {
            jdbcTemplate.update(sql,
                    brewery.getName(),
                    brewery.getLocation(),
                    brewery.getEstablishedYear(),
                    brewery.getDescription(),
                    brewery.getImageUrl(),
                    brewery.getMapUrl());
                    brewery.getLongitude();
                    brewery.getLatitude();
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to database.", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Cannot have duplicate values.", e);
        }

        return brewery;
    }

    //Just gotta grab the sql query statement from here, really simple fix
    @Override
    public Brewery getBreweryById(int breweryId) {
        Brewery brewery = null;
        String sql = "SELECT brewery_id, name, location, established_year, description, imageurl, mapurl, longitude, latitude\n" +
                "from brewery\n" +
                "WHERE brewery_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
            if (results.next()) {
                brewery = mapRowToBrewery(results);
            }
        }catch(CannotGetJdbcConnectionException e){
            throw new DaoException("Unable to connect to server or database", e);
        }
        return brewery;
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

    @Override
    public List<Brewery> searchBreweries(String searchTerm) {
        List<Brewery> breweries = new ArrayList<>();
        String query = "SELECT brewery_id, name, location, established_year, description, imageurl, mapurl " +
                "FROM brewery " +
                "WHERE LOWER(name) LIKE ?";
        try {
            SqlRowSet rows = jdbcTemplate.queryForRowSet(query, "%" + searchTerm.toLowerCase() + "%");
            while (rows.next()) {
                breweries.add(mapRowToBrewery(rows));
            }
        } catch (EmptyResultDataAccessException e) {
            // No results found, return an empty list
        } catch (Exception e) {
            throw new DaoException("Error searching breweries", e);
        }
        return breweries;
    }


    private Brewery mapRowToBrewery(SqlRowSet row) {
        Brewery brewery = new Brewery();

        brewery.setBreweryId( row.getInt("brewery_id") );
        brewery.setName( row.getString("name") );
        brewery.setLocation( row.getString("location") );
        brewery.setEstablishedYear( row.getInt("established_year") );
        brewery.setDescription( row.getString("description") );
        brewery.setImageUrl( row.getString("imageurl") );
        brewery.setMapUrl(row.getString("mapurl"));

        List<BreweryImage> breweryImage = getImagesByBreweryId(brewery.getBreweryId());
        brewery.setBreweryImage(breweryImage);
        brewery.setLongitude(row.getDouble("longitude"));
        brewery.setLatitude(row.getDouble("latitude"));

        return brewery;
    }
    private BreweryImage mapRowToBreweryImage(SqlRowSet rowSet) {
        BreweryImage breweryImage = new BreweryImage();

        breweryImage.setBreweryId(rowSet.getInt("brewery_id"));
        breweryImage.setImageId(rowSet.getInt("image_id"));
        breweryImage.setImageUrl(rowSet.getString("image_url"));


        return breweryImage;
    }
}
