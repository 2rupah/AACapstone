package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Brewery;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBrewery implements BreweryDao{

    private static final String SELECT_BREWERY_SQL = "SELECT brewery_id, name, location, established_year, description, imageurl " +
            "FROM brewery";


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

    //copied and pasted this, we need to update the String sql for our brewery database!
    @Override
    public Brewery createBrewery(Brewery brewery) {
        String sql = "INSERT INTO brewery (name, location, established_year, description, imageurl) " +
                "VALUES (?, ?, ?, ?, ? ) RETURNING brewery_id";
        try {
            int newBreweryId = jdbcTemplate.queryForObject(sql, int.class, brewery.getName(), brewery.getLocation(),
                    brewery.getEstablishedYear(), brewery.getDescription(), brewery.getImageUrl());
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
                "WHERE brewery_id = ?;";
        try {
            jdbcTemplate.update(sql,
                    brewery.getName(),
                    brewery.getLocation(),
                    brewery.getEstablishedYear(),
                    brewery.getDescription(),
                    brewery.getImageUrl(),
                    brewery.getBreweryId());
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
       
        return null;
    }


    private Brewery mapRowToBrewery(SqlRowSet row) {
        Brewery brewery = new Brewery();

        brewery.setBreweryId( row.getInt("brewery_id") );
        brewery.setName( row.getString("name") );
        brewery.setLocation( row.getString("location") );
        brewery.setEstablishedYear( row.getInt("established_year") );
        brewery.setDescription( row.getString("description") );
        brewery.setImageUrl( row.getString("imageurl") );

        return brewery;
    }
}
