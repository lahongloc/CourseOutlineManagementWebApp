/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.comwe.services.impl;

import com.comwe.pojo.DTOs.CommentDTO;
import com.comwe.repositories.CommentRepository;
import com.comwe.services.CommentService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author kitj3
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    private final String pythonApiUrl = "http://localhost:5000/sentiment";

    @Override
    public List<CommentDTO> getComments(Map<String, String> params, String outlineId) {
        return this.commentRepository.getComments(params, outlineId);
    }

    @Override
    public boolean addComment(Map<String, String> params) {
        try {
            String commentContent = params.get("content");

            // Chuẩn bị body yêu cầu cho API Python
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, String> requestBody = new HashMap<>();
            requestBody.put("content", commentContent);

            HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(requestBody, headers);

            // Gửi yêu cầu POST đến API Python
            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<Map> responseEntity = restTemplate.exchange(pythonApiUrl, HttpMethod.POST, requestEntity, Map.class);

            // Xử lý phản hồi từ API Python
            if (responseEntity.getStatusCode() == HttpStatus.OK) {
                Map<String, Object> responseBody = responseEntity.getBody();
                
                // 1 tich cuc - 0 tieu cuc
                int sentiment = (int) responseBody.getOrDefault("sentiment", null);

                // Lấy câu trả lời từ mô hình
                String modelResponse = (String) responseBody.getOrDefault("modelResponse", "");

                // Cập nhật params để bao gồm sentiment và modelResponse
                params.put("positive", String.valueOf(sentiment));
                params.put("modelResponse", modelResponse);
                System.out.println("Paramsssssssss: " + params.get("positive") + " - " + params.get("modelResponse"));
            } else {
                // Xử lý lỗi
                System.out.println("Đã xảy ra lỗi khi gọi API Python: " + responseEntity.getStatusCode());
            }

            return this.commentRepository.addComment(params);
        } catch (Exception ex) {
            System.out.println(ex);
            return false;
        }
    }

}
