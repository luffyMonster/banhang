package com.edu.banhang.service;

import com.edu.banhang.model.Comment;

import java.util.List;

public interface CommentService {
    List<Comment>  findCommentByProductId(Long productId);
    Comment save(Comment comment);
}
