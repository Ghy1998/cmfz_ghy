package com.baizhi.test;

import com.baizhi.service.UserService;

import javax.annotation.Resource;

public class TestAdmin extends BasicTest{
    @Resource
   /* private GuruService guruService;*/
    private UserService userService;
   /* private CourseService courseService;*/
    /*private ArticleService articleService;*/
   /* private ChapterService chapterService;*/
    /*private AlbumService albumService;*/
    /*private AdminService adminService;*/
   /* private BannerService bannerService;*/

   /* @Test
    public void test01(){
        Admin admin = new Admin();
        admin.setUsername("ghy");
        admin.setPassword("ghy200612");
        Admin oneAdmin = adminService.findOneAdmin(admin);
        System.out.println(oneAdmin);
    }*/

   /* @Test
    public void test02(){
        List<Banner> byPage = bannerService.findByPage(1, 2);
        for (Banner banner : byPage) {
            System.out.println(banner);
        }
    }

    @Test
    public void test03(){
        Long totals = bannerService.findTotals();
        System.out.println(totals);
    }

    @Test
    public void test04(){
        Banner oneBanner = bannerService.findOneBanner("2");
        System.out.println(oneBanner);
    }

    @Test
    public void  test05(){
        Banner banner = new Banner();
        banner.setId("030db632-f439-4466-93d4-9f4e4df3fdc4");
        banner.setTitle("2222222");
        banner.setDescr("3333");
        banner.setStatus("y");
        banner.setCreateDate(new Date());
        bannerService.motifyBanner(banner);
    }*/
   /*@Test
    public void test06(){
       List<Album> albumPage = albumService.findAlbumPage(1, 1);
       for (Album album : albumPage) {
           System.out.println(album);
       }
   }
   @Test
    public void test07(){
       Long albumTotal = albumService.findAlbumTotal();
       System.out.println(albumTotal);
   }*/

  /* @Test
    public void test08(){
       Album album = new Album();
       album.setTitle("小悲咒");
       album.setCount(10);
       album.setAuthor("wo");
       album.setPublishDate(new Date());
       albumService.addAlbum(album);
   }

   @Test
    public void test09(){
       Album album = albumService.findAlbum("1");
       System.out.println(album);
   }*/
 /* @Test
   public void test10(){
    List<Article> articlePage = articleService.findArticlePage(1, 1);
    for (Article article : articlePage) {
      System.out.println(article);
    }
  }
  @Test
  public void test11(){
    Long articleTotal = articleService.findArticleTotal();
    System.out.println(articleTotal);
  }*/

   /* @Test
    public void test12(){
        Course course = new Course();
        course.setId("1");
        course.setTitle("敲木鱼");
        courseService.motifyCourse(course);
    }*/
   /*@Test
    public void test13(){
       User user = new User();
       user.setPhoneNum(123456789);
       user.setUsername("小明");
       user.setPassword("123456");
       user.setProvince("四川");
       user.setCity("成都");
       userService.addUser(user);
   }*/

   /*@Test
    public void test14(){
       List<Guru> allGuru = guruService.findAllGuru();
       for (Guru guru : allGuru) {
           System.out.println(guru);
       }
   }*/

}
