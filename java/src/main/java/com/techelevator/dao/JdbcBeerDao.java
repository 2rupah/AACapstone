package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Beer getBeerById(int beerId) {
        Beer beer = null;
        String sql = "SELECT * " +
                "FROM beer " +
                "WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId);
        if(results.next()) {
            beer = mapRowToBeer(results);
        }
        return beer;
    }

    @Override
    public List<Beer> getAllBeersFromBrewery(int breweryId) {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT * " +
                "FROM beer " +
                "WHERE brewery_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while(results.next()) {
            beers.add(mapRowToBeer(results));
        }
        return beers;
    }

    private Beer mapRowToBeer(SqlRowSet rowSet){
        Beer beer = new Beer();

        beer.setBeerId(rowSet.getInt("beer_id") );
        beer.setName(rowSet.getString("name") );
        beer.setBreweryId(rowSet.getInt("brewery_id") );
        beer.setStyle(rowSet.getString("style") );
        beer.setAbv(rowSet.getDouble("abv") );
        beer.setIbu(rowSet.getInt("ibu") );
        beer.setDescription(rowSet.getString("description") );
        beer.setImageUrl(rowSet.getString("imageurl"));

        return beer;
    }
}
