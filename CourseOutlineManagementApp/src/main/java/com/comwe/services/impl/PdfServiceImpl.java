//package com.comwe.services.impl;
//
//import com.comwe.services.PdfService;
//import com.itextpdf.io.font.FontConstants;
//import com.itextpdf.kernel.font.PdfFontFactory;
//import com.itextpdf.kernel.geom.PageSize;
//import com.itextpdf.kernel.pdf.PdfDocument;
//import com.itextpdf.kernel.pdf.PdfWriter;
//import com.itextpdf.layout.Document;
//import com.itextpdf.layout.element.Paragraph;
//import com.itextpdf.layout.property.TextAlignment;
//import com.itextpdf.layout.element.Table;
//import com.itextpdf.layout.property.UnitValue;
//import org.springframework.stereotype.Service;
//
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.util.Map;
//
//@Service
//public class PdfServiceImpl implements PdfService {  
//    public ByteArrayInputStream createPdf(Map<String, String> params) {
//        ByteArrayOutputStream out = new ByteArrayOutputStream();
//
//        try (PdfWriter writer = new PdfWriter(out);
//             PdfDocument pdf = new PdfDocument(writer);
//             Document document = new Document(pdf, PageSize.A4)) {
//
//            // Set font
//            document.setFont(PdfFontFactory.createFont(FontConstants.TIMES_ROMAN));
//
//            // Title: ĐỀ CƯƠNG MÔN HỌC
//            Paragraph title = new Paragraph("ĐỀ CƯƠNG MÔN HỌC")
//                    .setTextAlignment(TextAlignment.CENTER)
//                    .setBold();
//            document.add(title);
//
//            // Add details
//            document.add(new Paragraph("Mã đề cương: " + params.get("outlineId")));
//            document.add(new Paragraph("Tên môn học: " + params.get("subjectName")));
//            document.add(new Paragraph("Tên khoa: " + params.get("facultyName")));
//            document.add(new Paragraph("Tên giảng viên soạn: " + params.get("instructorName")));
//
//            // Create a table
//            Table table = new Table(UnitValue.createPercentArray(new float[]{1, 1}))
//                    .useAllAvailableWidth();
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
//            // Add additional information
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
//}
package com.comwe.services.impl;

import com.comwe.pojo.Faculty;
import com.comwe.pojo.Major;
import com.comwe.pojo.Outline;
import com.comwe.services.FacultyService;
import com.comwe.services.PdfService;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Map;
import org.apache.http.entity.StringEntity;
import org.cloudinary.json.JSONObject;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

@Service
public class PdfServiceImpl implements PdfService {

    @Autowired
    private FacultyService facultyService;

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
// Add additional information
