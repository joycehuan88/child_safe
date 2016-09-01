package com.childsafe.controller;

import com.childsafe.dao.CouncilDao;
import com.childsafe.dao.SuburbDao;
import com.childsafe.model.Council;
import com.childsafe.model.Suburb;
import com.childsafe.service.csvParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    private CouncilDao councilDao;
    @Autowired
    private SuburbDao suburbDao;


    @RequestMapping("/")
    public String home(Model model) {

//        try {
//            csvService.createCouncilList();
//            csvService.createSuburblList();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

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
            System.out.println(list);
        }
        model.addAttribute("suburbs", surburbList);
        model.addAttribute("councils", councils);
        return "home1";
    }

    @RequestMapping("/analysis")
    public String analysis() {
//        System.out.println(councilDao.getCouncilByCrimeRate());
        return "analysis";
    }

    @RequestMapping("/analysis/{suburbName}/{bully}/{abuse}/{immu}/{crime}/{drug}/{abduction}/{balckmail}/{sexual}")
    public @ResponseBody
    List<Council> getSuburbByName (@PathVariable(value = "suburbName") String suburbName,
                            @PathVariable(value = "bully") String bully,
                            @PathVariable(value = "abuse") String abuse,
                            @PathVariable(value = "immu") String immu,
                            @PathVariable(value = "crime") String crime,
                            @PathVariable(value = "drug") String drug,
                            @PathVariable(value = "abduction") String abduction,
                            @PathVariable(value = "balckmail") String balckmail,
                            @PathVariable(value = "sexual") String sexual) {
        System.out.println(suburbName);
        System.out.println(bully);
        System.out.println(abuse);
        System.out.println(immu);
        System.out.println(crime);
        System.out.println(drug);
        System.out.println(abduction);
        System.out.println(balckmail);
        System.out.println(sexual);
        Suburb suburb = suburbDao.getSuburbByName(suburbName);
        Council council = suburb.getCouncil();
        Council averageCouncil = councilDao.getCouncilById(32);
        List<Council> councilList = new ArrayList<Council>();
        councilList.add(council);
        councilList.add(averageCouncil);
        return councilList;
    }

    @RequestMapping("/analysis/init")
    public @ResponseBody
    List<String> getSuburbListWithLowestValue () {

        List<String> nameList = new ArrayList<String>();
        List<Council> bullys = councilDao.getCouncilByBullyRate();
       // System.out.println("bullying size :"+ bullys.size());
        List<Council> Abuses = councilDao.getCouncilByAbuseRate();
        List<Council> vaccs = councilDao.getCouncilByVaccRate();
        List<Council> crimes = councilDao.getCouncilByCrimeRate();
        List<Council> drugs = councilDao.getCouncilByDrugRate();
        List<Council> abductions = councilDao.getCouncilByAbdctionRate();
        List<Council> blackmails = councilDao.getCouncilByBlackmailRate();
        List<Council> sexuals = councilDao.getCouncilBySexualRate();

        String bullyString = "";
        String AbuseString= "";
        String CrimeString= "";
        String BlackString= "";
        String sexualString = "";
        String abductionString = "";
        String vaccString = "";
        String drugString= "";
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

        for (Council council:drugs) {
            drugString = drugString +council.getCouncilName()+" ";
        }
        nameList.add(drugString);

        for (Council council:abductions) {
            abductionString = abductionString +council.getCouncilName()+" ";
        }
        nameList.add(abductionString);

        for (Council council:blackmails) {
            BlackString = BlackString +council.getCouncilName()+" ";
        }
        nameList.add(BlackString);

        for (Council council:sexuals) {
            sexualString = sexualString +council.getCouncilName()+" ";
        }
        nameList.add(sexualString);

        return nameList;
    }

    @RequestMapping("/map")
    public String getMap(){
        return "map";
    }


    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload.")
    public void handleClientErrors (Exception e) {}

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error.")
    public void handleServerErrors (Exception e) {}



}
