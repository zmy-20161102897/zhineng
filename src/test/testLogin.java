package test;

//import bean.Tgoods;
//import dao.GoodsDao;
import utils.Img2StrUtils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class testLogin {

    public static String data;

    public static void main(String[] args) {
//        AdminService adminService = new AdminService();
//        Tadmin admin = adminService.login("月亮邮递员","12345");
//        System.out.println(admin.getAdminName());

//        data = Img2StrUtils.img2Str(new File("C:\Users\44137\Documents\Tencent Files\441374342\FileRecv\graduationProject\zhineng\out\artifacts\zhineng_war_exploded\img\\01.png"), "png");
//        Img2StrUtils.str2Img(data, "D:\\qq", "png");
//        System.out.println(data);
//        Tgoods tgoods = new Tgoods();
//        tgoods.setCoverImg1(data);

        File a = new File("out\\artifacts\\zhineng_war_exploded\\img\\admin\\a.txt");
        try {
            a.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
