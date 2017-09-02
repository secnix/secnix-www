<?php get_header(); ?>

<?php if (have_posts()) : while (have_posts()) : the_post(); ?>

<section class="mbr-section article mbr-parallax-background" id="blog-header" style="color: white; background-image: url(<?php echo get_template_directory_uri();?>/assets/images/mbr-2000x1500.jpg); padding-top: 80px; padding-bottom: 120px;">
    <div class="mbr-overlay" style="opacity: 0.8; background-color: rgb(0, 0, 0);"></div>
      <div class="container">
          <div class="row">
              <div class="col-md-8 col-md-offset-2 text-xl-center text-lg-center text-md-center text-xs-center">
                  <h3 class="mbr-section-title display-2">
                    <span style="font-weight: normal;">

                      <?php the_title(); ?> <?php echo get_the_post_thumbnail( $post_id, 'thumbnail', array('class' => 'img-responsive img-circle')); ?>

                    </span>
                  </h3>
              </div>
          </div>
      </div>
    <div class="mbr-arrow mbr-arrow-floating" aria-hidden="true">
      <a href="#privacy"><i class="mbr-arrow-icon"></i></a>
    </div>
</section>

  <section class="mbr-section mbr-section-hero mbr-section-full mbr-parallax-background mbr-section-with-arrow" id="privacy" style="padding-top: 20px; padding-bottom: 20px; background-color: white;">
    <div class="mbr-overlay" style="opacity: 01.0; background-color: rgb(255, 255, 255);"></div>
      <div class="mbr-table-cell" style="vertical-align: top;">
        <div class="container">
          <div class="row" style="padding: 0px;">
            <div class="mbr-section col-md-9  text-xs-left" style="padding-top: 20px; padding-bottom: 20px; background-color: ;">

               <?php /* echo get_the_post_thumbnail( $post_id, 'thumbnail', array('class' => 'img-responsive img-circle')); */?>

               <!--<h1><?php the_title(); ?></h1>-->
               <h4><?php echo get_the_date(); ?></h4>
               <h5><?php the_author(); ?></h5>
               <?php the_content(); ?>

               <?php
               // GET TAGS BY POST_ID
                $tags = get_the_tags($post->ID);  ?>

                <div class="mbr-section-btn">
                <?php foreach($tags as $tag) :  ?>
                <a class="btn btn-primary" style="padding:5px 10px;margin-left:0px" href="<?php bloginfo('url');?>/tag/<?php print_r($tag->slug);?>"><?php print_r($tag->name); ?></a>
                <?php endforeach; ?>
                </div>
                <!-- GET TAGS BY POST_ID -->
               <hr>

              <?php endwhile; ?>
              <?php endif; ?>


            </div>


            <div class="mbr-section col-md-3 text-xs-left" style="padding-top: 20px; padding-bottom: 20px; background-color: rgb(61, 142, 185); border: 10px solid rgb(61, 142, 185); border-radius: 10px;">

              <?php get_sidebar(); ?>

            </div>


          </div>
        </div>
      </div>
      <div class="mbr-arrow mbr-arrow-floating" aria-hidden="true">
        <a href="#contact"><i class="mbr-arrow-icon"></i></a>
      </div>
  </section>


<?php get_footer(); ?>
