package com.childsafe.controller;

import com.childsafe.dao.CouncilDao;
import com.childsafe.dao.ParkDao;
import com.childsafe.dao.StatisticDao;
import com.childsafe.dao.SuburbDao;
import com.childsafe.model.Council;
import com.childsafe.model.Park;
import com.childsafe.model.Statistic;
import com.childsafe.model.Suburb;
import com.childsafe.service.csvParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.gavaghan.geodesy.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZhangHuan on 17/08/2016.
 */
@Controller
public class HomeController {

    @Autowired
    private csvParser csvService;

    @Autowired
    private StatisticDao statDao;

    @Autowired
    private CouncilDao councilDao;
    @Autowired
    private SuburbDao suburbDao;

    @Autowired
    private ParkDao parkDao;

    @RequestMapping("/")
    public String home(Model model) {

     //  try {
//            csvService.createCouncilList();
//            csvService.createSuburblList();
//            csvService.createParkList();
//csvService.createStatDataList();
     //  } catch (Exception e) {
     //       e.printStackTrace();
     //   }

        List<Suburb> surburbList = new ArrayList<Suburb>();
        List<Council> councils = councilDao.getAllCouncils();
        for (Council council:councils) {

            surburbList.addAll(council.getSuburbs());
        }

        for (Suburb suburb:surburbList
             ) {
            Council council = suburb.getCouncil();
            List<String> list = new ArrayList<String>();
            list.add("Crime Rate:"+council.getCrime_rate());
            list.add("Abuse Rate:"+council.getAbuse_rate());
            list.add("Abduction Rate:"+council.getAbduction_rated());
            list.add("Blackmail Rate:"+council.getBlackmail_extortion());
            list.add("Bullying Rate:"+council.getBullying_rate());
            list.add("Drug Dealing Rate:"+council.getDrug_dealing());
            list.add("Sexual offense Rate:"+council.getSexual_offense());
            list.add("Immunication Rate:"+council.getVacc_rate());
            suburb.setInfoList(list);
           // System.out.println(list);
        }
        model.addAttribute("suburbs", surburbList);
        model.addAttribute("councils", councils);
        return "home1";
    }

    @RequestMapping("/analysis")
    public String analysis() {
//        System.out.println(councilDao.getCouncilByCrimeRate());
        return "analysis2";
    }

    // search for council data based on surburb name
    @RequestMapping("/analysis/{suburbName}")
    public @ResponseBody
    List<Council> getSuburbByName (@PathVariable(value = "suburbName") String suburbName) {
        Suburb suburb = suburbDao.getSuburbByName(suburbName);
        Council council = suburb.getCouncil();
        System.out.println(suburb.getSuburbName());
        System.out.println(council.getCouncilName());
        Council averageCouncil = councilDao.getCouncilById(32);
        List<Council> councilList = new ArrayList<Council>();
        councilList.add(council);
        councilList.add(averageCouncil);
        return councilList;
    }
// initialize my suburb page, return suburbs with best rates and also average rates
    @RequestMapping("/analysis/init")
    public @ResponseBody
    List<String> getSuburbListWithLowestValue () {

        List<String> nameList = new ArrayList<String>();
        List<Council> bullys = councilDao.getCouncilByBullyRate();
        List<Council> Abuses = councilDao.getCouncilByAbuseRate();
        List<Council> vaccs = councilDao.getCouncilByVaccRate();
        List<Council> crimes = councilDao.getCouncilByCrimeRate();
//        List<Council> drugs = councilDao.getCouncilByDrugRate();
        List<Council> abductions = councilDao.getCouncilByAbdctionRate();
//        List<Council> blackmails = councilDao.getCouncilByBlackmailRate();
        List<Council> sexuals = councilDao.getCouncilBySexualRate();

        String bullyString = "";
        String AbuseString= "";
        String CrimeString= "";
//        String BlackString= "";
        String sexualString = "";
        String abductionString = "";
        String vaccString = "";
//        String drugString= "";
        for (Council council:bullys) {
            bullyString = bullyString +council.getCouncilName()+" ";
        }
        nameList.add(bullyString);

        for (Council council:Abuses) {
            AbuseString = AbuseString +council.getCouncilName()+" ";
        }
        nameList.add(AbuseString);

        for (Council council:vaccs) {
            vaccString = vaccString +council.getCouncilName()+" ";
        }
        nameList.add(vaccString);

        for (Council council:crimes) {
            CrimeString = CrimeString +council.getCouncilName()+" ";
        }
        nameList.add(CrimeString);

//        for (Council council:drugs) {
//            drugString = drugString +council.getCouncilName()+" ";
//        }
        //nameList.add(drugString);

        for (Council council:abductions) {
            abductionString = abductionString +council.getCouncilName()+" ";
        }
        nameList.add(abductionString);

//        for (Council council:blackmails) {
//            BlackString = BlackString +council.getCouncilName()+" ";
//        }
        //nameList.add(BlackString);

        for (Council council:sexuals) {
            sexualString = sexualString +council.getCouncilName()+" ";
        }
        nameList.add(sexualString);
        nameList.add(bullys.get(0).getBullying_rate()+"");
        nameList.add(Abuses.get(0).getAbuse_rate()+"");
        nameList.add(vaccs.get(0).getVacc_rate()+"");
        nameList.add(crimes.get(0).getCrime_rate()+"");
        nameList.add(abductions.get(0).getAbduction_rated()+"");
        nameList.add(sexuals.get(0).getSexual_offense()+"");


        return nameList;
    }

    @RequestMapping("/map")
    public String getMap(){
        return "map";
    }

// search and return playgrounds with filtered conditions
    @RequestMapping("/map/{lat}/{lng}/{toilet}/{parking}/{toddler}/{fenced}/{bike}/{radius}")
    public @ResponseBody
    List<Park> getMapByFilter (@PathVariable(value = "lat") String lat,
                               @PathVariable(value = "lng") String lng,
                               @PathVariable(value = "toilet") String toilet,
                               @PathVariable(value = "parking") String parking,
                               @PathVariable(value = "toddler") String toddler,
                               @PathVariable(value = "fenced") String fenced,
                               @PathVariable(value = "bike") String bike,
                               @PathVariable(value = "radius") String radius) {

        System.out.println(lat);
        System.out.println(lng);
        System.out.println(toilet);
        System.out.println(parking);
        System.out.println(toddler);
        System.out.println(fenced);
        System.out.println(bike);
        System.out.println(radius);

        GeodeticCalculator geoCalc = new GeodeticCalculator();
        Ellipsoid reference = Ellipsoid.WGS84;
        GlobalPosition userPos = new GlobalPosition(Double.parseDouble(lat), Double.parseDouble(lng), 0.0); // user Point

        List<Park> parkList = parkDao.getParkByFilter(toilet,parking,toddler,fenced,bike);

        List<Park> filterparkList = new ArrayList<Park>();
        for (Park park:parkList) {
            Double userLat = park.getLatitude();
            Double userLon = park.getLongitude();
            GlobalPosition pointA = new GlobalPosition(userLat, userLon, 0.0);
            double distance = geoCalc.calculateGeodeticCurve(reference, userPos, pointA).getEllipsoidalDistance();
            if(distance <= Double.parseDouble(radius)){
                filterparkList.add(park);
            }
            System.out.println(distance);
        }



        System.out.println(filterparkList.size());

        return filterparkList;
    }

    //my suburb page, search statistic data based on suburb name
    @RequestMapping("/analysis/stat/{suburbName}")
    public  @ResponseBody
    JSONArray getHistoryData(@PathVariable(value = "suburbName") String suburbName) {
        Suburb suburb = suburbDao.getSuburbByName(suburbName);

        String councilName = suburb.getCouncil().getCouncilName();
        List<Statistic> statList = statDao.getStatisticByCouncilName(councilName);
        JSONArray jsonArray = new JSONArray();
        for (Statistic stat:statList) {
            JSONObject obj = new JSONObject();
            obj.put("2012", stat.getStat12());
            obj.put("2013", stat.getStat13());
            obj.put("2014", stat.getStat14());
            obj.put("2015", stat.getStat15());
            obj.put("2016", stat.getStat16());
            jsonArray.add(obj);
        }
       // jsonArray.add(statDao.getSexualAverageStat());
        jsonArray.add(statDao.getAverageStat().get(0));
        jsonArray.add(statDao.getAverageStat().get(1));
        jsonArray.add(statDao.getAverageStat().get(2));
        jsonArray.add(statDao.getAverageStat().get(3));

        //jsonArray.add(statDao.getCrimeAverageStat());
        //jsonArray.add(statDao.getBullyAverageStat());
        System.out.println(jsonArray.size());

        return jsonArray;
    }


    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload.")
    public void handleClientErrors (Exception e) {}

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error.")
    public void handleServerErrors (Exception e) {}



}
