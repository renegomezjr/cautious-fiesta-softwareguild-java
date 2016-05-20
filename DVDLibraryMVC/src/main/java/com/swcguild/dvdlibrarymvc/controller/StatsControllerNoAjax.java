/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.dvdlibrarymvc.controller;

import com.swcguild.dvdlibrarymvc.dao.DVDLibraryDAO;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Rene Gomez
 */
@Controller
public class StatsControllerNoAjax {
    DVDLibraryDAO dao;
    
    @Inject
    public StatsControllerNoAjax(DVDLibraryDAO dao){
        this.dao = dao;
    }

    @RequestMapping(value = "/stats", method = RequestMethod.GET)
    public String displayStatsPage(Model model) {
        List<String> statsAboutLibrary = new ArrayList<>();
        dao.findAverageUserRatings();
        dao.numberOfDVDs();
        
        statsAboutLibrary.add(dao.getAverageUserRating());
        statsAboutLibrary.add(dao.getNumberOfDVDs());
        
        model.addAttribute("statsAboutLibrary", statsAboutLibrary);
        
        return "stats";
    }

   
}
