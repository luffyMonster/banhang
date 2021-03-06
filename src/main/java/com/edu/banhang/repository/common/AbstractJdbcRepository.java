package com.edu.banhang.repository.common;

import com.edu.banhang.model.BaseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.io.Serializable;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.*;

/**
 * Implementation of PagingAndSortingRepository using JdbcTemplate
 */
public abstract class AbstractJdbcRepository<T extends BaseModel, ID extends Serializable> implements PagingAndSortingRepository<T, ID> {
    @Autowired
    protected JdbcTemplate jdbcTemplate;

    protected String tableName;
    protected String idColumn;
    protected RowMapper<T> rowMapper;
    protected Updater<T> updater;
    private String deleteQuery;
    private String selectAll;
    private String selectById;
    private String countQuery;

    public AbstractJdbcRepository(){
        initialize();
        afterPropertiesSet();
    }

    public abstract void initialize();
    /**
     * Must be call on child after properties set
     */
    protected void afterPropertiesSet() {
        this.deleteQuery = String.format("delete from %s where %s = ?", tableName, idColumn);
        this.selectAll = String.format("select * from %s", tableName);
        this.selectById = String.format("select * from %s where %s = ?", tableName, idColumn);
        this.countQuery = String.format("select count(%s) from %s", idColumn, tableName);
    }

    @Override
    public long count() {
        Long count = jdbcTemplate.queryForObject(this.countQuery, Long.class);
        return count == null ? 0 : count;
    }

    @Override
    public void delete(ID arg0) {
        this.jdbcTemplate.update(this.deleteQuery, arg0);
    }

    @Override
    public void delete(T arg0) {
        this.jdbcTemplate.update(this.deleteQuery, arg0.getId());
    }

    @Override
    public void delete(Iterable<? extends T> arg0) {
        for (T t : arg0) {
            delete(t);
        }
    }

    @Override
    public void deleteAll() {
        delete(findAll());
    }

    @Override
    public boolean exists(ID arg0) {
        return findOne(arg0) != null;
    }

    @Override
    public Iterable<T> findAll() {
        return jdbcTemplate.query(this.selectAll, this.rowMapper);
    }

    @Override
    public T findOne(ID arg0) {
        try {
            return jdbcTemplate.queryForObject(this.selectById, new Object[]{arg0}, this.rowMapper);
        } catch (IncorrectResultSizeDataAccessException ex) {
            return null;
        }
    }

    @Override
    public T save(T arg0) {

        Map<String, Object> columns = new HashMap<String, Object>();
        updater.mapColumns(arg0, columns);

        //Case update
        if (arg0.getId() != null && exists((ID)arg0.getId())) {
            String updateQuery = String.format("update %s set ", this.tableName);
            columns.remove(this.idColumn);
            Object[] obj = new Object[columns.size() + 1];
            int i = 0;

            String separator = "";
            for (Map.Entry<String, Object> e : columns.entrySet()) {
                obj[i++] = e.getValue();
                updateQuery += separator + e.getKey() + " = ? ";
                separator = ", ";
            }

            obj[i] = arg0.getId();

            updateQuery += String.format(" where %s = ? ", this.idColumn);

            jdbcTemplate.update(updateQuery, obj);
        } else {//Case insert
            SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
            simpleJdbcInsert.setGeneratedKeyName(this.idColumn);
            simpleJdbcInsert.setTableName(this.tableName);
            Number id = simpleJdbcInsert.executeAndReturnKey(columns);
            arg0.setId(id.longValue());
        }

        return arg0;
    }

    public List<T> findBy(Map<String, Object> columns) {
        String selectQuery = String.format("select * from %s where ", this.tableName);

        Object[] obj = new Object[columns.size()];
        int i = 0;

        String separator = "";
        for (Map.Entry<String, Object> e : columns.entrySet()) {
            obj[i++] = e.getValue();
            selectQuery += separator + e.getKey() + " = ? ";
            separator = ", ";
        }
        return jdbcTemplate.query(selectQuery, obj, this.rowMapper);
    }

    @Override
    public Iterable<T> save(Iterable<? extends T> arg0) {
        List<T> ret = new ArrayList<T>();
        for (T t : arg0) {
            ret.add(save(t));
        }
        return ret;
    }

    @Override
    public Iterable<T> findAll(Sort arg0) {
        StringBuilder qu = new StringBuilder(this.selectAll).append(" ORDER BY");
        String separator = " ";
        for (Order o : arg0) {
            qu.append(separator).append(o.getProperty()).append(" ").append(o.getDirection().toString());
            separator = ", ";
        }
        return jdbcTemplate.query(qu.toString(), this.rowMapper);
    }

    @Override
    public Page<T> findAll(Pageable pageable) {
        final StringBuilder qu = new StringBuilder(this.selectAll);

        Optional.ofNullable(pageable.getSort()).ifPresent(sort -> {
            String separator = " ";
            qu.append(" ORDER BY");
            for (Order o : sort) {
                qu
                        .append(separator)
                        .append(o.getProperty())
                        .append(" ")
                        .append(o.getDirection().toString());
                separator = ", ";
            }
        });

        qu
                .append(" LIMIT ")
                .append(pageable.getOffset())
                .append(", ")
                .append(pageable.getPageSize())
                .append(" ");
        long count = count();
        int totalPages = (int) count / pageable.getPageSize();
        if (totalPages*pageable.getPageSize() != count) {
            totalPages += 1;
        }
        return new JdbcPage<T>(pageable,
                totalPages,
                (int) count,
                jdbcTemplate.query(qu.toString(), this.rowMapper));
    }

    public interface Updater<T> {
        void mapColumns(T t, Map<String, Object> mapping);
    }

}
