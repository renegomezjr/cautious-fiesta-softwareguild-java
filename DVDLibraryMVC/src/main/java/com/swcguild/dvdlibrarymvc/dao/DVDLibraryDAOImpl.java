/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.dvdlibrarymvc.dao;

import com.swcguild.dvdlibrarymvc.model.DVD;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 *
 * @author Winona and Carrie and Patrick
 */
//    private int dvdId;
//    private String title;
//    private String releaseDate;
//    private String rating;
//    private String director;
//    private String studio;
//    private String userRating;
public class DVDLibraryDAOImpl implements DVDLibraryDAO {

    Map<Integer, DVD> dvdLibrary = new HashMap<>();
    private static int dvdIdCounter = 0;
    private String numberOfDVDs;
    private String averageUserRating;

    
    @Override
    public String getAverageUserRating() {
        return averageUserRating;
    }
    
    @Override
    public String getNumberOfDVDs(){
        return numberOfDVDs;
    }

    public DVDLibraryDAOImpl() {
        DVD dvd = new DVD();
        dvd.setTitle("CastAway");
        dvd.setReleaseDate("2004-08-04");
        dvd.setRating("PG-13");
        dvd.setDirector("Gramps");
        dvd.setStudio("MGM");
        dvd.setUserRating("5");
        this.addDVD(dvd);

        dvd = new DVD();
        dvd.setTitle("StarWars");
        dvd.setReleaseDate("2001-04-01");
        dvd.setRating("PG-13");
        dvd.setDirector("Lucas");
        dvd.setStudio("WB");
        dvd.setUserRating("5");
        this.addDVD(dvd);

        dvd = new DVD();
        dvd.setTitle("Terminator");
        dvd.setReleaseDate("1987-04-01");
        dvd.setRating("R");
        dvd.setDirector("Smith");
        dvd.setStudio("LionsGate");
        dvd.setUserRating("4");
        this.addDVD(dvd);

        dvd = new DVD();
        dvd.setTitle("Terminator 2");
        dvd.setReleaseDate("1994-04-01");
        dvd.setRating("R");
        dvd.setDirector("Cohen");
        dvd.setStudio("Paramount");
        dvd.setUserRating("5");
        this.addDVD(dvd);

        dvd = new DVD();
        dvd.setTitle("Hope Floats");
        dvd.setReleaseDate("1993-04-01");
        dvd.setRating("PG");
        dvd.setDirector("Lame");
        dvd.setStudio("Lonely Hearts");
        dvd.setUserRating("3");
        this.addDVD(dvd);

        dvd = new DVD();
        dvd.setTitle("Cloudy with a Chance of Meatballs");
        dvd.setReleaseDate("2006-04-01");
        dvd.setRating("G");
        dvd.setDirector("Owens");
        dvd.setStudio("Night Chasers");
        dvd.setUserRating("4");
        this.addDVD(dvd);
        
        

    }

    @Override
    public List<DVD> getAllDVDs() {
        return new ArrayList(dvdLibrary.values());
    }

    @Override
    public void addDVD(DVD newDVD) {
        newDVD.setDvdId(dvdIdCounter);
        dvdIdCounter++;
        dvdLibrary.put(newDVD.getDvdId(), newDVD);
    }

    @Override
    public DVD removeDVD(int dvdId) {
        return dvdLibrary.remove(dvdId);
    }

    @Override
    public DVD findDVD(int dvdId) {
        return dvdLibrary.get(dvdId);
    }

    @Override
    public void updateDVD(DVD updatedDVD) {
        dvdLibrary.put(updatedDVD.getDvdId(), updatedDVD);
    }

    @Override
    public List<DVD> searchDVDs(Predicate<DVD> searchParams) {
        return dvdLibrary.values().stream()
                .filter(searchParams)
                .collect(Collectors.toList());
    }

    @Override
    public List<DVD> searchDVDs(Map<SearchTerm, String> criteria) {
        String titleCriteria = criteria.get(SearchTerm.TITLE);
        String releaseDateCriteria = criteria.get(SearchTerm.RELEASE_DATE);
        String ratingCriteria = criteria.get(SearchTerm.RATING);
        String directorCriteria = criteria.get(SearchTerm.DIRECTOR);
        String studioCriteria = criteria.get(SearchTerm.STUDIO);
        String userRatingCriteria = criteria.get(SearchTerm.USER_RATING);

        Predicate<DVD> titlePred;
        Predicate<DVD> releaseDatePred;
        Predicate<DVD> ratingPred;
        Predicate<DVD> directorPred;
        Predicate<DVD> studioPred;
        Predicate<DVD> userRatingPred;

        Predicate<DVD> allpass = (dvd) -> {
            return true;
        };

        titlePred = (titleCriteria == null || titleCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getTitle().toLowerCase().contains(titleCriteria.toLowerCase());
        releaseDatePred = (releaseDateCriteria == null || releaseDateCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getReleaseDate().toLowerCase().contains(releaseDateCriteria.toLowerCase());
        ratingPred = (ratingCriteria == null || ratingCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getRating().toLowerCase().contains(ratingCriteria.toLowerCase());
        directorPred = (directorCriteria == null || directorCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getDirector().toLowerCase().contains(directorCriteria.toLowerCase());
        studioPred = (studioCriteria == null || studioCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getStudio().toLowerCase().contains(studioCriteria.toLowerCase());
        userRatingPred = (userRatingCriteria == null || userRatingCriteria.isEmpty())
                ? allpass : (dvd) -> dvd.getUserRating().toLowerCase().contains(userRatingCriteria);

        return dvdLibrary.values().stream()
                .filter(titlePred)
                .filter(releaseDatePred)
                .filter(ratingPred)
                .filter(directorPred)
                .filter(studioPred)
                .filter(userRatingPred)
                .collect(Collectors.toList());
    }

    @Override
    public void findAverageUserRatings() {
        Collection<DVD> allDVDs = dvdLibrary.values();
        int total=0;
        
        for(DVD d : allDVDs){
            total += Double.parseDouble(d.getUserRating());
        }
        
        double avg = total/allDVDs.size();
        this.averageUserRating = "" + avg;
    }
    
    public void numberOfDVDs(){
        this.numberOfDVDs = "" + dvdLibrary.size();
    }
}
