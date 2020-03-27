package bean;


import org.springframework.lang.NonNull;
import utils.Img2StrUtils;

public class Tgoods {

    private long goodsId;
    private String goodsName;
    private double goodsPrice;
    private String goodsText;
    private long adminId;
    private String coverImg1;
    private String coverImg2;
    private String coverImg3;
    private String introImg1;
    private String introImg2;
    private String introImg3;
    private String introImg4;
    private String introImg5;
    private String introImg6;


    public long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(long goodsId) {
        this.goodsId = goodsId;
    }


    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }


    public double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }


    public String getGoodsText() {
        return goodsText;
    }

    public void setGoodsText(String goodsText) {
        this.goodsText = goodsText;
    }


    public long getAdminId() {
        return adminId;
    }

    public void setAdminId(long adminId) {
        this.adminId = adminId;
    }


    public String getCoverImg1() {
        return coverImg1;
    }

    public void setCoverImg1(String coverImg1) {
        this.coverImg1 = coverImg1;
        if (coverImg1 != null) {
            Img2StrUtils.str2Img(this.coverImg1, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_cover1", "png");
        }
    }


    public String getCoverImg2() {
        return coverImg2;
    }

    public void setCoverImg2(String coverImg2) {
        this.coverImg2 = coverImg2;
        if (coverImg2 != null) {
            Img2StrUtils.str2Img(this.coverImg2, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_cover2", "png");
        }
    }


    public String getCoverImg3() {
        return coverImg3;
    }

    public void setCoverImg3(String coverImg3) {
        this.coverImg3 = coverImg3;
        if (coverImg3 != null) {
            Img2StrUtils.str2Img(this.coverImg3, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_cover3", "png");
        }
    }


    public String getIntroImg1() {
        return introImg1;
    }

    public void setIntroImg1(String introImg1) {
        this.introImg1 = introImg1;
        if (introImg1 != null) {
            Img2StrUtils.str2Img(this.introImg1, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro1", "png");
        }
    }


    public String getIntroImg2() {
        return introImg2;
    }

    public void setIntroImg2(String introImg2) {
        this.introImg2 = introImg2;
        if (introImg2 != null) {
            Img2StrUtils.str2Img(this.introImg2, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro2", "png");
        }
    }


    public String getIntroImg3() {
        return introImg3;
    }

    public void setIntroImg3(String introImg3) {
        this.introImg3 = introImg3;
        if (introImg3 != null) {
            Img2StrUtils.str2Img(this.introImg3, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro3", "png");
        }
    }


    public String getIntroImg4() {
        return introImg4;
    }

    public void setIntroImg4(String introImg4) {
        this.introImg4 = introImg4;
        if (introImg4 != null) {
            Img2StrUtils.str2Img(this.introImg4, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro4", "png");
        }
    }


    public String getIntroImg5() {
        return introImg5;
    }

    public void setIntroImg5(String introImg5) {
        this.introImg5 = introImg5;
        if (introImg5 != null) {
            Img2StrUtils.str2Img(this.introImg5, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro5", "png");
        }
    }


    public String getIntroImg6() {
        return introImg6;
    }

    public void setIntroImg6(String introImg6) {
        this.introImg6 = introImg6;
        if (introImg6 != null) {
            Img2StrUtils.str2Img(this.introImg6, "D:\\IdeaProjects\\graduationProject\\zhineng\\out\\artifacts\\zhineng_war_exploded\\img\\goods\\" + this.goodsId + "_intro6", "png");
        }
    }

}
