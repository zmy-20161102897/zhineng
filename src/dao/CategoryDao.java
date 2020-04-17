package dao;

import bean.Tcategory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.C3p0Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class CategoryDao {

    private RowMapper<Tcategory> noticeRowMapper = new RowMapper<Tcategory>() {
        @Override
        public Tcategory mapRow(ResultSet resultSet, int i) throws SQLException {
            Tcategory category = new Tcategory();
            category.setCid(resultSet.getInt(1));
            category.setCname(resultSet.getString(2));
            return category;
        }
    };

}
