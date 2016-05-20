/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.dvdlibrarymvc.controller;

import com.swcguild.dvdlibrarymvc.dao.DVDLibraryDAO;
import com.swcguild.dvdlibrarymvc.model.DVD;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
public class HomeControllerNoAjax {
    private DVDLibraryDAO dao;
    
    @Inject
    public HomeControllerNoAjax(DVDLibraryDAO dao){
        this.dao = dao;
    }
    
    @RequestMapping(value = {"/","/home"}, method=RequestMethod.GET)
    public String displayDVDLibraryList(Model model){
        List<DVD> allDVDs = dao.getAllDVDs();
        model.addAttribute("dvdList", allDVDs);
        
        return "home";
    }
    
    @RequestMapping(value = "/newDVDNoAjax", method=RequestMethod.GET)
    public String displayNewDVDFormNoAjax(){
        return "newDVDNoAjax";
    }
    
    @RequestMapping(value="addDVDNoAjax", method=RequestMethod.POST)
    public String addNewDVD(HttpServletRequest req){
        String title = req.getParameter("title");
        String releaseDate = req.getParameter("releaseDate");
        String rating = req.getParameter("rating");
        String director = req.getParameter("director");
        String studio = req.getParameter("studio");
        String userRating = req.getParameter("userRating");
        
        DVD newDVD = new DVD();
        newDVD.setTitle(title);
        newDVD.setReleaseDate(releaseDate);
        newDVD.setRating(rating);
        newDVD.setDirector(director);
        newDVD.setStudio(studio);
        newDVD.setUserRating(userRating);
        
        dao.addDVD(newDVD);
        
        return "redirect:home"; 
    }
    
    @RequestMapping(value="deleteDVDNoAjax", method = RequestMethod.GET)
    public String deleteDVD(HttpServletRequest req){
        String dvdId = req.getParameter("dvdId");
        
        int sanitizedId = this.sanitizeDVDId(dvdId);
        
        if(sanitizedId >= 0){
            dao.removeDVD(sanitizedId);
        }
        
        return "redirect:home";
    }
    
    @RequestMapping(value="/editDVDNoAjax", method = RequestMethod.GET)
    public String displayDVDEditForm(HttpServletRequest req, Model model){
        int sanitizedDVDId = this.sanitizeDVDId(req.getParameter("dvdId"));
        
        if(sanitizedDVDId >= 0){
            DVD dvd = dao.findDVD(sanitizedDVDId);
            model.addAttribute("dvdToEdit", dvd);
        }
        
        return "editDVDNoAjaxForm";
    }
    
    @RequestMapping(value="editDVDNoAjaxMethod", method = RequestMethod.POST)
    public String editModelDVDNoAjax(@ModelAttribute("dvdToEdit") DVD dvd){
        dao.updateDVD(dvd);
        return "redirect:home";
    }
            
    
    private int sanitizeDVDId(String dvdParam){
        int dvdIdInt = -1;
        
        try{
            dvdIdInt = Integer.parseInt(dvdParam);
        } catch (NumberFormatException e){
            dvdIdInt = -1;
        }
        
        return dvdIdInt;
    }
    
}
