package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Brewery;
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

    private List<Brewery> breweries = new ArrayList<>();

    private JdbcTemplate jdbcTemplate;

    public JdbcBrewery(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Brewery> listAllBreweries() {

        SqlRowSet rows = jdbcTemplate.queryForRowSet(SELECT_BREWERY_SQL);
        while (rows.next()) {
            breweries.add( mapRowToBrewery(rows));
        }

        return breweries;
    }

    //copied and pasted this, we need to update the String sql for our brewery database!
//    @Override
//    public Brewery createBrewery(Brewery brewery) {
//        String sql = "INSERT INTO wish_list (user_id, name) VALUES (?, ?) RETURNING id, date_created";
//        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, brewery.getBreweryId(), brewery.getName());
//        if (rows.next()) {
//            brewery.setBreweryId( rows.getInt("???") );
//        }
//        return brewery;
//    }

//    @Override
//    public Brewery updateBrewery(Brewery brewery) {
//        Brewery result = brewery;
//        boolean finished = false;
//
//        for(int i = 0; i < breweries.size(); i++){
//            if (breweries.get(i).getBreweryId() == brewery.getBreweryId()){
//                breweries.set(i, result);
//                finished = true;
//                break;
//            }
//        }
//        if (!finished) {
//            throw new DaoException("Brewery to update not found! :(");
//        }
//        return result;
//    }

    @Override
    public Brewery getBreweryById(int breweryId) {
        for (Brewery brew : breweries) {
            if (brew.getBreweryId() == breweryId) {
                return brew;
            }
        }
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
