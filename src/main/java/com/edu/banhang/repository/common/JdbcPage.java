package com.edu.banhang.repository.common;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.Iterator;
import java.util.List;

public class JdbcPage<T> implements Page<T>
{

    private Pageable pageable;
    private int totalPages;
    private int totalNumbers;
    private List<T> content;



    public JdbcPage(Pageable pageable, int totalPages,
                    int totalNumbers, List<T> content) {
        super();
        this.pageable = pageable;
        this.totalPages = totalPages;
        this.totalNumbers = totalNumbers;
        this.content = content;
    }

    @Override
    public int getNumber() {
        return pageable.getPageNumber();
    }

    @Override
    public int getSize() {
        return pageable.getPageSize();
    }

    @Override
    public int getTotalPages() {
        return this.totalPages;
    }

    //number on current page
    @Override
    public int getNumberOfElements() {
        return this.getContent().size();
    }

    @Override
    public long getTotalElements() {
        return this.totalNumbers;
    }

    @Override
    public boolean hasPreviousPage() {
        return pageable.getPageNumber() != 0;
    }

    @Override
    public boolean isFirstPage() {
        return pageable.getPageNumber() == 0;
    }

    @Override
    public boolean hasNextPage() {
        return pageable.getPageNumber() != totalPages;
    }

    @Override
    public boolean isLastPage() {
        return pageable.getPageNumber() == totalPages;
    }

    @Override
    public Iterator<T> iterator() {
        return content.iterator();
    }

    @Override
    public List<T> getContent() {
        return content;
    }

    @Override
    public boolean hasContent() {
        return !content.isEmpty();
    }

    @Override
    public Sort getSort() {
        return this.pageable.getSort();
    }

}