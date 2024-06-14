package com.comwe.controllers;

import com.comwe.services.DocumentService;
import com.comwe.services.FileStorageService;
import com.comwe.services.PdfService;
import com.comwe.pojo.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiDocumentController {

    @Autowired
    private FileStorageService fileStorageService;

    @Autowired
    private DocumentService documentService;

    @Autowired
    private PdfService pdfService;

    @PostMapping("/upload-pdf")
    public String uploadPdf(@RequestParam Map<String, String> params) {
        try {
            // Tạo file PDF từ thông tin được truyền vào
            System.out.println("PARAMS: " + params);
            ByteArrayInputStream pdfInputStream = this.pdfService.createPdf(params);

            System.out.println("pdf: " + pdfInputStream);

            // Lưu file PDF vào hệ thống tạm thời
            File tempFile = File.createTempFile("document", ".pdf");
            try ( FileOutputStream fos = new FileOutputStream(tempFile)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = pdfInputStream.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }
            }

            System.out.println("tempFile: " + tempFile);

            // Upload file lên dịch vụ lưu trữ (ví dụ: S3)
            String fileUrl = fileStorageService.uploadFile(tempFile);

            System.out.println("subjectName: " + params.get("subjectName"));
            
            // Lưu thông tin Document vào cơ sở dữ liệu
            Document document = this.documentService.saveDocument(
                    params.get("subjectName"),
                    fileUrl,
                    Integer.parseInt(params.get("outlineId"))
            );

            return "index";
        } catch (IOException ex) {
            ex.printStackTrace(); // Xử lý ngoại lệ theo logic của bạn
            return "generatePDF";
        }
    }
}
