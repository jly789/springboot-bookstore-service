package com.DreamBook.BookStoreService.controller.crawling;

import com.DreamBook.BookStoreService.dto.crawling.News;
import com.DreamBook.BookStoreService.service.crawling.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class NewsController {

    private final NewsService newsService;

    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    @GetMapping("/news")
    public String news(Model model) throws Exception{
        List<News> newsList = newsService.getNewsDatas();
        model.addAttribute("news", newsList);

        return "crawling/news";
    }
}