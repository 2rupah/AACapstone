package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBrewery implements BreweryDao{

    private static final String SELECT_BREWERY_SQL = "SELECT brewery_id, name, location, established_year, description " +
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




    private Brewery mapRowToBrewery(SqlRowSet row) {
        Brewery brewery = new Brewery();

        brewery.setBreweryId( row.getInt("brewery_id") );
        brewery.setName( row.getString("name") );
        brewery.setLocation( row.getString("location") );
        brewery.setEstablishedYear( row.getInt("established_year") );
        brewery.setDescription( row.getString("description") );

        return brewery;
    }
}
