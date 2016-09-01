package com.childsafe.service;

import com.childsafe.dao.CouncilDao;
import com.childsafe.dao.SuburbDao;
import com.childsafe.model.Council;
import com.childsafe.model.Suburb;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by ZhangHuan on 19/08/2016.
 */
@Service
public class csvParser {

    @Autowired
    private CouncilDao councilDao;

    @Autowired
    private SuburbDao suburbDao;

    public void createCouncilList() throws Exception{

        BufferedReader br = new BufferedReader(new FileReader("/Users/ZhangHuan/Desktop/childsafe/src/main/webapp/WEB-INF/resources/data/council1.csv"));
        String line = null;
        List councilList = new ArrayList();
        Scanner scanner = null;
        int index = 0;

        while ((line = br.readLine()) != null) {
            scanner = new Scanner(line);
            scanner.useDelimiter(",");
            Council council = new Council();
            while (scanner.hasNext()) {
                String data = scanner.next();
                if (index == 0)
                    council.setCouncilName(data);
                else if (index == 1)
                    //System.out.println(data);
                    council.setVacc_rate(Double.parseDouble(data));
                else if (index == 2)
                    council.setCrime_rate(Double.parseDouble(data));
                else if (index == 3)
                    council.setBullying_rate(Double.parseDouble(data));
                else if (index == 4)
                    council.setAbuse_rate(Double.parseDouble(data));
                else if (index == 5)
                    council.setDrug_dealing(Double.parseDouble(data));
                else if (index == 6)
                    council.setAbduction_rated(Double.parseDouble(data));
                else if (index == 7)
                    council.setBlackmail_extortion(Double.parseDouble(data));
                else if (index == 8)
                    council.setSexual_offense(Double.parseDouble(data));
                else
                    System.out.println("invalid data::" + data);
                index++;
            }
            index = 0;
            councilDao.addCouncil(council);
            councilList.add(council);

        }
        br.close();
        System.out.println(councilList.size());

    }
    public void createSuburblList() throws Exception{

        BufferedReader br = new BufferedReader(new FileReader("/Users/ZhangHuan/Desktop/childsafe/src/main/webapp/WEB-INF/resources/data/suburb3.csv"));
        String line = null;
        List sunurbList = new ArrayList();
        Scanner scanner = null;
        int index = 0;

        while ((line = br.readLine()) != null) {
            scanner = new Scanner(line);
            scanner.useDelimiter(",");
            Suburb suburb = new Suburb();
            while (scanner.hasNext()) {
                String data = scanner.next();
                if (index == 0){
                  Council council = councilDao.getCouncilById(Integer.parseInt(data));
                    suburb.setCouncil(council);
                }

                else if (index == 1)
                    suburb.setSuburbName(data);
                else if (index == 2)
                    suburb.setPostCode(data);
                else
                    System.out.println("invalid data::" + data);
                index++;
            }
            index = 0;
            suburbDao.addSuburb(suburb);
            sunurbList.add(suburb);

        }
        br.close();
        System.out.println(sunurbList.size());

    }
}
