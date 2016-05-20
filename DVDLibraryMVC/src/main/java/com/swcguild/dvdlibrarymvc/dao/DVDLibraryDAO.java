/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.dvdlibrarymvc.dao;

import com.swcguild.dvdlibrarymvc.model.DVD;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

/**
 *
 * @author Winona Wixson
 */
public interface DVDLibraryDAO {
    
    
    public String getAverageUserRating();
    public String getNumberOfDVDs();
    public void addDVD(DVD newDVD);   
    public DVD removeDVD(int dvdId);   
    public DVD findDVD(int dvdId);    
    public void updateDVD(DVD updatedDVD);
    public List<DVD> searchDVDs(Predicate<DVD> dvdSearch);    
//    public void loadDVDLibrary()throws FileNotFoundException;    
//    public void writeDVDLibrary()throws IOException;
    public List<DVD> getAllDVDs();
    public List<DVD> searchDVDs(Map<SearchTerm, String> criteria);
    public void findAverageUserRatings();
    public void numberOfDVDs();
    
    
}
