package com.comwe.services.impl;

import com.comwe.services.PdfService;
import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.UnitValue;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;

@Service
public class PdfServiceImpl implements PdfService {

//    @Override
//    public ByteArrayInputStream createPdf(Map<String, String> params) {
//        ByteArrayOutputStream out = new ByteArrayOutputStream();
//
//        try (PdfWriter writer = new PdfWriter(out);
//             PdfDocument pdf = new PdfDocument(writer);
//             Document document = new Document(pdf)) {
//
//            // Giới thiệu chữ: "ĐỀ CƯƠNG MÔN HỌC" ở chính giữa
//            document.add(new Paragraph("ĐỀ CƯƠNG MÔN HỌC").setTextAlignment(TextAlignment.CENTER).setBold());
//
//            // Thêm thông tin chi tiết
//            document.add(new Paragraph("Mã đề cương: " + params.get("outlineId")));
//            document.add(new Paragraph("Tên môn học: " + params.get("subjectName")));
//            document.add(new Paragraph("Tên khoa: " + params.get("facultyName")));
//            document.add(new Paragraph("Tên giảng viên soạn: " + params.get("instructorName")));
//
//            // Tạo bảng
//            Table table = new Table(new float[]{1, 1});
//            table.addCell("Ngày bắt đầu soạn");
//            table.addCell(params.get("startDate"));
//            table.addCell("Ngày hoàn thành");
//            table.addCell(params.get("endDate"));
//            table.addCell("Tín chỉ thực hành");
//            table.addCell(params.get("practicalCredits"));
//            table.addCell("Tín chỉ lý thuyết");
//            table.addCell(params.get("theoreticalCredits"));
//            document.add(table);
//
//            // Thêm thông tin khác
//            document.add(new Paragraph("Mô tả: " + params.get("description")));
//            document.add(new Paragraph("Trạng thái: " + params.get("status")));
//            document.add(new Paragraph("Khóa (năm): " + params.get("courseYear")));
//
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
//
//        return new ByteArrayInputStream(out.toByteArray());
//    }
    
    public ByteArrayInputStream createPdf(Map<String, String> params) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try (PdfWriter writer = new PdfWriter(out);
             PdfDocument pdf = new PdfDocument(writer);
             Document document = new Document(pdf, PageSize.A4)) {

            // Set font
            document.setFont(PdfFontFactory.createFont(FontConstants.TIMES_ROMAN));

            // Title: ĐỀ CƯƠNG MÔN HỌC
            Paragraph title = new Paragraph("ĐỀ CƯƠNG MÔN HỌC")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setBold();
            document.add(title);

            // Add details
            document.add(new Paragraph("Mã đề cương: " + params.get("outlineId")));
            document.add(new Paragraph("Tên môn học: " + params.get("subjectName")));
            document.add(new Paragraph("Tên khoa: " + params.get("facultyName")));
            document.add(new Paragraph("Tên giảng viên soạn: " + params.get("instructorName")));

            // Create a table
            Table table = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                    .useAllAvailableWidth();
            table.addCell("Ngày bắt đầu soạn");
            table.addCell(params.get("startDate"));
            table.addCell("Ngày hoàn thành");
            table.addCell(params.get("endDate"));
            table.addCell("Tín chỉ thực hành");
            table.addCell(params.get("practicalCredits"));
            table.addCell("Tín chỉ lý thuyết");
            table.addCell(params.get("theoreticalCredits"));
            document.add(table);

            // Add additional information
            document.add(new Paragraph("Mô tả: " + params.get("description")));
            document.add(new Paragraph("Trạng thái: " + params.get("status")));
            document.add(new Paragraph("Khóa (năm): " + params.get("courseYear")));

        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return new ByteArrayInputStream(out.toByteArray());
    }
}