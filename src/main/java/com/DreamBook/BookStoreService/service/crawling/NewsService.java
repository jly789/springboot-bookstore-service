//package com.DreamBook.BookStoreService.service.crawling;
//
//import com.DreamBook.BookStoreService.dto.crawling.News;
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//import org.springframework.stereotype.Service;
//
//import javax.annotation.PostConstruct;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//@Service
//public class NewsService {
//    private static String News_URL = "https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1&start=we";
//
//    @PostConstruct
//    public List<News> getNewsDatas() throws IOException {
//        List<News> newsList = new ArrayList<>();
//        Document document = Jsoup.connect(News_URL).get();
//
////        Elements contents = document.select("section ul.type2 li");
//        Elements contents = document.select("div.ss_book_box");
//
//
//
//        for (Element content : contents) {
//            News news = News.builder()
//                    .imageabc(content.select("a img").attr("abs:src")) // 이미지
//
//                    .subjectabc(content.select("span.ss_p2").text())		// 제목
//                    .url(content.select("a").attr("abs:href"))		// 링크
//                    .build();
//            newsList.add(news);
//        }
//
//        return newsList;
//    }
//}