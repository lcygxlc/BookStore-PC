<template>
    <div class="col-md-10 col-md-offset-1">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class=""></li>
                <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item">
                    <img class="first-slide" src="../assets/images/adver-01.jpg" alt="当前无图片">
                </div>
                <div class="item active">
                    <img class="second-slide" src="../assets/images/adver-02.jpg" alt="当前无图片">
                </div>
                <div class="item">
                    <img class="third-slide" src="../assets/images/adver-03.jpg" alt="当前无图片">
                </div>
            </div>
        </div>
    </div>
</template>

<script>

</script>

<style scoped>
/* GLOBAL STYLES
-------------------------------------------------- */
/* Padding below the footer and lighter body text */

body {
  padding-bottom: 40px;
  color: #5a5a5a;
}

/* CUSTOMIZE THE NAVBAR */
/* Special class on .container surrounding .navbar, used for positioning it into place. */
.navbar-wrapper {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  z-index: 20;
}

/* Flip around the padding for proper display in narrow viewports */
.navbar-wrapper > .container {
  padding-right: 0;
  padding-left: 0;
}
.navbar-wrapper .navbar {
  padding-right: 15px;
  padding-left: 15px;
}
.navbar-wrapper .navbar .container {
  width: auto;
}

/* CUSTOMIZE THE CAROUSEL*/
/* Carousel base class */
.carousel {
  height: 450px;
  margin-bottom: 10px;
}
.goods {
  height: 210px;
  margin-bottom: 10px;
}

/* Since positioning the image, we need to help out the caption */
.carousel-caption {
  z-index: 10;
}

/* Declare heights because of positioning of img element */
.carousel .item {
  height: 450px;
  background-color: #777;
}
.carousel .goods {
  height: 210px;
  background-color: #fff;
}
.carousel-inner > .item > img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  min-height: 100%;
  height: 500px;
}
.carousel-inner > .item > img.img-responsive {
  position: absolute;
  top: 0;
  left: 0;

  min-height: 90%;
  height: 200px;
}

/* MARKETING CONTENT */

/* Center align the text within the three columns below the carousel */
.marketing .col-lg-4 {
  margin-bottom: 60px;
  text-align: center;
}
.marketing h2 {
  font-weight: normal;
}
.marketing .col-lg-4 p {
  margin-right: 10px;
  margin-left: 10px;
}

/* Featurettes*/

.featurette-divider {
  margin: 80px 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
  font-weight: 300;
  line-height: 1;
  letter-spacing: -1px;
}

/* RESPONSIVE CSS*/

@media (min-width: 768px) {
  /* Navbar positioning foo */
  .navbar-wrapper {
    margin-top: 20px;
  }
  .navbar-wrapper .container {
    padding-right: 15px;
    padding-left: 15px;
  }
  .navbar-wrapper .navbar {
    padding-right: 0;
    padding-left: 0;
  }

  /* The navbar becomes detached from the top, so we round the corners */
  .navbar-wrapper .navbar {
    border-radius: 4px;
  }

  /* Bump up size of carousel content */
  .carousel-caption p {
    margin-bottom: 40px;
    font-size: 21px;
    line-height: 1.4;
  }

  .featurette-heading {
    font-size: 50px;
  }
}

@media (min-width: 992px) {
  .featurette-heading {
    margin-top: 120px;
  }
}
</style>