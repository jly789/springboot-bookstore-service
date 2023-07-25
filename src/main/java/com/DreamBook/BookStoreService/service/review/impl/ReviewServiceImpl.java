package com.DreamBook.BookStoreService.service.review.impl;

import com.DreamBook.BookStoreService.dto.book.BookAddDTO;
import com.DreamBook.BookStoreService.dto.review.ReviewAddDTO;
import com.DreamBook.BookStoreService.mapper.review.ReviewMapper;
import com.DreamBook.BookStoreService.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Service
@Slf4j
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public int maxNum() throws Exception {
        return reviewMapper.maxNum();
    }


    public static String store(MultipartFile multipartFile, String imageFolder) throws IOException {
        if (multipartFile.isEmpty()) {
            return null;
        }

        String path = getFilePath() + imageFolder;

        String originalFilename = multipartFile.getOriginalFilename();
        String ext = originalFilename.substring(originalFilename.lastIndexOf("."));

        File file;
        String storeFileName;

        File folder = new File(path);
        if (!folder.exists()) {
            folder.mkdirs();
            log.info("폴더 생성 : " + path);
        }

        do {
            storeFileName = UUID.randomUUID().toString() + ext;
            log.info(storeFileName);
            file = new File(path, storeFileName);
        } while (file.exists());

        FileCopyUtils.copy(multipartFile.getBytes(), file);
        log.info("이미지 저장 완료");

        return storeFileName;
    }

    public static List<String> store(List<MultipartFile> multipartFileList, String imageFolder) throws IOException {

        List<String> list = new ArrayList<>();

        for (MultipartFile multipartFile : multipartFileList) {
            String storeFileName = store(multipartFile, imageFolder);

            if (storeFileName == null) {
                continue;
            }

            list.add(storeFileName);
        }

        return list;
    }


    // 이미지 저장 경로
    private static String getFilePath() {
        return System.getProperty("user.dir") + "\\src\\main\\resources\\static\\reviewImg";
    }





    @Override
    public void insertReviewData(ReviewAddDTO ReviewAddDTO, MultipartFile file) throws Exception {



            String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\reviewImg";

//        UUID uuid =  UUID.randomUUID();

            String fileName = file.getOriginalFilename();


            System.out.println(fileName);
            File saveFile = new File(projectPath, fileName);

            file.transferTo(saveFile);

            ReviewAddDTO.setReviewFileName(fileName);

            ReviewAddDTO.setReviewFilePath("/reviewImg/" + fileName);


            reviewMapper.insertReviewData(ReviewAddDTO);
        }





}
