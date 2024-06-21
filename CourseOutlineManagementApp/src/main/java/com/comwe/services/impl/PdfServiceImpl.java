package com.comwe.services.impl;

import com.comwe.pojo.Outline;
import com.comwe.services.PdfService;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import org.springframework.stereotype.Service;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Service
public class PdfServiceImpl implements PdfService {
    @Override
    public ByteArrayInputStream createPdf(Outline outline) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try (PdfWriter writer = new PdfWriter(out); PdfDocument pdf = new PdfDocument(writer); Document document = new Document(pdf, PageSize.A4)) {

            // Đường dẫn tới font Noto Sans Regular trong thư mục resources của project
            String fontPath = "./arial.ttf";

            // Tạo PdfFont từ file font
            PdfFont font = PdfFontFactory.createFont(fontPath, "Identity-H");

            // Set font cho document
            document.setFont(font);

            // Title: ĐỀ CƯƠNG MÔN HỌC
            Paragraph title = new Paragraph("ĐỀ CƯƠNG MÔN HỌC")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setBold();
            document.add(title);

//            System.out.println(String.format("ALL PARAMS IN REPO: %s", params));
            // Add details
            document.add(new Paragraph(String.format("Mã đề cương: %s", outline.getId())).setFont(font));
            document.add(new Paragraph(String.format("Tên môn học: %s", outline.getSubjectId().getName())).setFont(font));
            document.add(new Paragraph(String.format("Tên khoa: %s", outline.getLecturerId().getFacultyId().getName())).setFont(font));
            document.add(new Paragraph(String.format("Tên giảng viên soạn: %s", outline.getLecturerId().getUserId().getName())).setFont(font));

            // Create a table
            Table table = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
                    .useAllAvailableWidth();
            table.addCell("Ngày bắt đầu hiệu lực");
            table.addCell(outline.getStartedDatetime().toString());
            table.addCell("Ngày hết hiệu lực");
            table.addCell(outline.getExpiredDatetime().toString());
            table.addCell("Tín chỉ thực hành");
            table.addCell(outline.getPracCreditHour() + "");
            table.addCell("Tín chỉ lý thuyết");
            table.addCell(outline.getTheoCreditHour() + "");
            document.add(table);
            document.add(new Paragraph(String.format("Mô tả: %s", outline.getDescription())).setFont(font));
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return new ByteArrayInputStream(out.toByteArray());
    }
}

