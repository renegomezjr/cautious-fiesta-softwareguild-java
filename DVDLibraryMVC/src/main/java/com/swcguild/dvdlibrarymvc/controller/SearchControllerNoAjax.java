/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.dvdlibrarymvc.controller;

import com.swcguild.dvdlibrarymvc.dao.DVDLibraryDAO;
import com.swcguild.dvdlibrarymvc.dao.SearchTerm;
import com.swcguild.dvdlibrarymvc.model.DVD;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Rene Gomez
 */

//private int dvdId;
//    private String title;
//    private String releaseDate;
//    private String rating;
//    private String director;
//    private String studio;
//    private String userRating;

@Controller
public class SearchControllerNoAjax {
    DVDLibraryDAO dao;
    
    @Inject
    public SearchControllerNoAjax(DVDLibraryDAO dao){
        this.dao = dao;
    }
    
    @RequestMapping(value="/search", method=RequestMethod.GET)
    public String displaySearchFormPage(Model model){
        return "searchFormWithoutAjax";
    }
    
    @RequestMapping(value="search", method=RequestMethod.POST)
    public String searchWithoutAjax(Model model, HttpServletRequest req){
        String titleCriteria = req.getParameter("title");
        String releaseDateCriteria = req.getParameter("releaseDate");
        String ratingCriteria = req.getParameter("rating");
        String directorCriteria = req.getParameter("director");
        String studioCriteria = req.getParameter("studio");
        String userRatingCriteria = req.getParameter("userRating");
        
        Map<SearchTerm, String> criteriaForSearch = new HashMap<>();
        criteriaForSearch.put(SearchTerm.TITLE, titleCriteria);
        criteriaForSearch.put(SearchTerm.RELEASE_DATE, releaseDateCriteria);
        criteriaForSearch.put(SearchTerm.RATING, ratingCriteria);
        criteriaForSearch.put(SearchTerm.DIRECTOR, directorCriteria);
        criteriaForSearch.put(SearchTerm.STUDIO, studioCriteria);
        criteriaForSearch.put(SearchTerm.USER_RATING, userRatingCriteria);
        
        List<DVD> foundDVDs = dao.searchDVDs(criteriaForSearch);
        model.addAttribute("dvdList", foundDVDs);
        model.addAttribute("fromSearch", true);
        model.addAttribute("listSize", foundDVDs.size());
        
        return "searchFormWithoutAjax";
    }
}
