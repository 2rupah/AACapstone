package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.util.List;

public class JdbcBeerDao implements BeerDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Beer getBeerById() {
        Beer beer = null;
        String sql = "SELECT beer_id " +
                "FROM beer " +
                "WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        if(results.next()) {
            beer = mapRowToBeer(results);
        }
        return beer;
    }

    @Override
    public int getBeerByBreweryId() {
        Beer beer = null;
        String sql = "SELECT brewery_id " +
                "FROM beer " +
                "WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        if(results.next()){
            beer = mapRowToBeer(results);
        }
        return 0;
    }

    @Override
    public List<Beer> getBeersByBrewery() {
        return null;
    }

    private Beer mapRowToBeer(SqlRowSet rowSet){
        Beer beer = new Beer();

        beer.setBeerId(rowSet.getInt("beer_id") );
        beer.setName(rowSet.getString("name") );
        beer.setBreweryId(rowSet.getInt("brewery_id") );
        beer.setStyle(rowSet.getString("style") );
        beer.setAbv(rowSet.getDouble("abv") );
        beer.setIbu(rowSet.getInt("ibu") );
        beer.setStyle(rowSet.getString("description") );

        return beer;
    }
}
