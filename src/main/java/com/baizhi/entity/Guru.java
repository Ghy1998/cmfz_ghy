package com.baizhi.entity;

public class Guru {
    private String id;
    private String name;
    private String headPic;
    private String sex;
    private String status;

    public Guru() {
    }

    public Guru(String id, String name, String headPic, String sex, String status) {
        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.sex = sex;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Guru{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", headPic='" + headPic + '\'' +
                ", sex='" + sex + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
